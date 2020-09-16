using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Profesor
{
    public partial class DatosPersonales : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombre"] != null)
            {
                TxtNombre.Text = Session["nombre"].ToString();
                TxtApellidoP.Text = Session["apellido1"].ToString();
                TxtApellidoM.Text = Session["apellido2"].ToString();
                lbcorreo.Text = Session["correo"].ToString();
                lbCalle.Text = Session["calle"].ToString();
                lbColonia.Text = Session["colonia"].ToString();
                lbMunicipio.Text = Session["municipio"].ToString();
                lbTelefono.Text = Session["telefono1"].ToString();
                lbCelular.Text = Session["telefono2"].ToString();
                lbOtro.Text = Session["telefono3"].ToString();
                lbforTel.Text = Session["forTel"].ToString();
                lbforDom.Text = Session["forDom"].ToString();
            }
            
        }

        protected void BtnEditar_Click(object sender, EventArgs e)
        {
            TblProfesor prof = new TblProfesor();
            prof.id = Convert.ToInt32(Session["id"]);
            if (TxtCorreo.Text.Length > 1)
            {
                prof.strCorreo = TxtCorreo.Text;
            }
            else
            {
                prof.strCorreo = lbcorreo.Text;
            }

            TblTelefono tel = new TblTelefono();
            tel.id = Convert.ToInt32(Session["forTel"]);
            if(TxtCelular.Text.Length > 1) { 
                tel.strcelular = TxtCelular.Text;
            }
            else
            {
                tel.strcelular = lbCelular.Text;
            }
            if (TxtTelefono.Text.Length > 1)
            {
                tel.strtelCasa = TxtTelefono.Text;
            }
            else
            {
                tel.strtelCasa = lbTelefono.Text;
            }
            if (TxtOtro.Text.Length > 1)
            {
                tel.strotro = TxtOtro.Text;
            }
            else
            {
                tel.strotro = lbOtro.Text;
            }

            TblDireccion dom = new TblDireccion();
            dom.id = Convert.ToInt32(Session["forDom"]);
            if (TxtCalle.Text.Length > 1)
            {
                dom.strcalle = TxtCalle.Text;
            }
            else
            {
                dom.strcalle = lbCalle.Text;
            }
            if (TxtColonia.Text.Length > 1)
            {
                dom.strcolonia = TxtColonia.Text;
            }
            else
            {
                dom.strcolonia = lbColonia.Text;
            }
            if (TxtMunicipio.Text.Length > 1)
            {
                dom.strmunicipio = TxtMunicipio.Text;
            }
            else
            {
                dom.strmunicipio = lbMunicipio.Text;
            }
            ControllerMaestro ctrlProfe = new ControllerMaestro();
            ctrlProfe.Editar(prof, tel, dom);
            this.Response.Redirect("./DatosPersonales.aspx", true);
        }
    }
}