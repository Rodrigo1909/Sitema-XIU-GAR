using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class AbonoExito : System.Web.UI.Page
    {
        DataTable dtb;
        DataTable carrito = new DataTable();

        public void CargarDetalle()
        {
            dtb = new DataTable("Carrito");
            dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
            dtb.Columns.Add("strNombre", System.Type.GetType("System.String"));
            dtb.Columns.Add("dblPrecio", System.Type.GetType("System.Double"));
            dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
            dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));

            Session["pedido"] = dtb;
            Session["prueba"] = dtb;

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            if (Page.IsPostBack == false)
            {
                CargarDetalle();
            }
        }
    }
}