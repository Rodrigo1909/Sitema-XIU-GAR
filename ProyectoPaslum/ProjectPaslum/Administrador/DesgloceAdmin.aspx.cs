using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace ProjectPaslum.Administrador
{
    public partial class DesgloceAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            loadGridItems(Convert.ToInt32(Session["desgloce"].ToString()));

            var ventas = (from venta in contexto.tblVenta
                          where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                          select new { fecha = venta.Fecha, fin = venta.strFechaEntega, hora = venta.strHoraEntega }).FirstOrDefault();

            txtFecha.Text = ventas.fecha.ToString().Substring(0, 10);
            txtFechaFin.Text = ventas.fin.ToString();
            txtHoraEntrega.Text = ventas.hora.ToString();
        }

        private void loadGridItems(int idDetalleVenta)
        {
            try
            {
                var desglozar = (from detalle in contexto.tblDetalleVenta
                                 join producto in contexto.tblProducto
                                    on detalle.fkProducto equals producto.idProducto
                                 join unidad in contexto.tblUnidadMedida
                                    on producto.fkUnidadMedida equals unidad.idUnidadMedida
                                 where detalle.fkVenta == idDetalleVenta
                                 select new
                                 {
                                     PRODUCTO = producto.strNombre,
                                     DESCRIPCIÓN = producto.strDescripcion,
                                     PRESENTACIÓN = producto.intPresentacion,
                                     CANTIDAD = detalle.intCantidad,
                                     UNIDAD = unidad.strNombre
                                 }).ToList();

                GridView1.DataSource = desglozar;
                GridView1.DataBind();



            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Administrador/PrincipalAdministrador.aspx");
        }
    }

}