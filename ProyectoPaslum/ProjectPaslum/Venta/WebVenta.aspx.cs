using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data;

namespace ProjectPaslum.Venta
{
    public partial class WebVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                
            }

        }

        private void loadDrop(int idVenta)
        {
            try
            {
                GridDetalle.DataSource = contexto.tblDetalleVenta
                    .Where(c => c.fkVenta == idVenta)
                    .Select(n => new
                    {
                        Fecha = n.Fecha,
                        Cantidad = n.intCantidad,
                        Precio = n.dblPrecio

                    })
                    .ToList();
                GridDetalle.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}