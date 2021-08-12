using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Venta
{
    public partial class PerfilVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                txtNombre.Text = Session["nombre"].ToString();
                txtApellidoP.Text = Session["apellido1"].ToString();
                txtApellidoM.Text = Session["apellido2"].ToString();
                txtCorreo.Text = Session["correo"].ToString();
                txtTelefono.Text = Session["telefono1"].ToString();
                txtCelular.Text = Session["telefono2"].ToString();
                txtOtro.Text = Session["rol"].ToString();
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }
    }
}