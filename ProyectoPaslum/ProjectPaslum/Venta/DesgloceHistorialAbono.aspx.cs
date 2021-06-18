using Modelo;
using ProjectPaslum.Controllers;
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
                           select new { id = venta.idVenta,fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

            var resta = (from detalle in contexto.tblHistorialAbono
                         where detalle.fkVenta == int.Parse(Session["desgloce"].ToString())
                         orderby detalle.idHistorialAbono descending
                         select new {res = detalle.dblCantidadAnterior }).FirstOrDefault();

            txtFecha.Text = ventas.fecha.ToString().Substring(0, 10);
            txtFechaFin.Text = ventas.fin.ToString().Substring(0, 10);

            txtTotal.Text = "$" + Convert.ToDecimal(ventas.total).ToString("#,###.00");
            txtNumVen.Text = ventas.id.ToString();

            var faltante = ventas.total - resta.res ;

            txtRestante.Text = "$" + Convert.ToDecimal(faltante).ToString("#,###.00");
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
                                  orderby abono.idHistorialAbono descending 
                               where abono.fkVenta == idDetalleVenta
                                  select new
                                 {
                                     FECHA = abono.Fecha,
                                     ABONO = abono.dblCantidad,
                                     TOTAL_DE_ABONO = abono.dblCantidadAnterior
                                 }).ToList();

                GridView2.DataSource = TablaAbono;
                GridView2.DataBind();


            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime fechact = DateTime.Now;
            ControllerCliente ctrlClie = new ControllerCliente();
            tblVenta ven = new tblVenta();
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();

            var ultimoregistro = (from ha in contexto.tblHistorialAbono
                                  where ha.fkVenta == int.Parse(Session["desgloce"].ToString())
                                  orderby ha.idHistorialAbono descending
                                  select ha).FirstOrDefault();

            var ventas = (from venta in contexto.tblVenta
                          where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                          select new { fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

            var suma = ultimoregistro.dblCantidadAnterior + decimal.Parse(txtAbono.Text);

            if (suma < ventas.total)
            {
                tblHistorialAbono HisAbo = new tblHistorialAbono();
                HisAbo.Fecha = fechact;
                HisAbo.dblCantidad = decimal.Parse(txtAbono.Text);
                HisAbo.dblCantidadAnterior = suma;
                HisAbo.fkVenta = int.Parse(Session["desgloce"].ToString());
                HisAbo.fkValidacionUsuario = int.Parse(Session["idUsuario"].ToString());

                ctrlClie.InsertarHistorialAbono(HisAbo);
                this.Response.Redirect("./AlertaExito.aspx", true);                
            }
            else if (suma == ventas.total){
                tblHistorialAbono HisAbo = new tblHistorialAbono();
                HisAbo.Fecha = fechact;
                HisAbo.dblCantidad = decimal.Parse(txtAbono.Text);
                HisAbo.dblCantidadAnterior = suma;
                HisAbo.fkVenta = int.Parse(Session["desgloce"].ToString());
                HisAbo.fkValidacionUsuario = int.Parse(Session["idUsuario"].ToString());

                ctrlClie.InsertarHistorialAbono(HisAbo);
                ven.idVenta = int.Parse(Session["desgloce"].ToString());
                ven.strEstado = "VENTA A CREDITO FINALIZADA";

                ctrlAlm.EditarFinalizadoCredito(ven);

                this.Response.Redirect("./AlertaExito.aspx", true);
            }
            else
            {
                this.Response.Redirect("./AlertaErrorAbono.aspx", true);
            }

           
        }
    }
}