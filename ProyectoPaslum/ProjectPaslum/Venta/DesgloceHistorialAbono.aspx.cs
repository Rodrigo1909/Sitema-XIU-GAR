using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class DesgloceHistorialAbono : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridItems(Convert.ToInt32(Session["desgloce"].ToString()));

            var ventas = (from venta in contexto.tblVenta
                           where venta.idVenta ==  int.Parse(Session["desgloce"].ToString())
                           select new { fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

            txtFecha.Text = ventas.fecha.ToString().Substring(0, 10);
            txtFechaFin.Text = ventas.fin.ToString().Substring(0, 10);
            txtTotal.Text = (ventas.total).ToString();

            
        }


        private void loadGridItems(int idDetalleVenta)
        {           
           try
            {
                var desglozar = (from detalle in contexto.tblDetalleVenta
                                 join producto in contexto.tblProducto 
                                    on detalle.fkProducto equals producto.idProducto                                 
                                 where detalle.fkVenta == idDetalleVenta
                                 select new
                                 {
                                     PRODUCTO = producto.strNombre,
                                     DESCRIPCIÓN = producto.strDescripcion,
                                     PRESENTACIÓN = producto.intPresentacion,
                                     PRECIO = detalle.dblPrecio,
                                     CANTIDAD = detalle.intCantidad
                                 }).ToList();

                GridView1.DataSource = desglozar;
                GridView1.DataBind();

                var TablaAbono = (from abono in contexto.tblHistorialAbono
                                 join venta in contexto.tblVenta
                                    on abono.fkVenta equals venta.idVenta
                                 where abono.fkVenta == idDetalleVenta
                                 select new
                                 {
                                     FECHA = abono.Fecha,
                                     CANTIDAD = abono.dblCantidad,
                                     ANTERIOR = abono.dblCantidadAnterior
                                 }).ToList();

                GridView2.DataSource = TablaAbono;
                GridView2.DataBind();


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}