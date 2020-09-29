using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Administrador
{
    public partial class EmpleadoAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LlenarEstado();
            }
        }

        private void LlenarEstado()
        {
            ControllerEmpleado CtrlEstado = new ControllerEmpleado();
            List<tblEstado> estado = CtrlEstado.ConsultaEstado();
            ddlEstado.Items.Add("Seleccionar");
            ddlEstado.DataSource = estado;
            ddlEstado.DataValueField = "idEstado";
            ddlEstado.DataTextField = "strEstado";
            ddlEstado.DataBind();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var sex = cmbSexo.SelectedItem.Value;

            tblEmpleado empl = new tblEmpleado();
            empl.strNombre = txtNombre.Text.ToUpper();
            empl.strApellidoP = txtAPaterno.Text.ToUpper();
            empl.strApellidoM = txtAMaterno.Text.ToUpper();
            empl.strEdad = txtEdad.Text;
            empl.strSexo = sex;
            empl.strCorreo = txtCorreo.Text;       
            ControllerEmpleado ctrlEmpl = new ControllerEmpleado();
            ctrlEmpl.InsertarEmpleado(GetDatosVista(empl));
            this.Response.Redirect("./EmpleadoAdmin.aspx", true);
        }

        protected tblEmpleado GetDatosVista(tblEmpleado empl)
        {
            var random = new Random();
            var value = random.Next(0, 999999);
            var rol = cmbRol.SelectedItem.Value;

            tblDireccion direccion = new tblDireccion();
            //direccion.fkEstadoMunicipio = txtDirecEstado.Text.ToUpper();
            direccion.strCalle = txtCalle.Text.ToUpper();
            direccion.strColonia = txtColonia.Text.ToUpper();
            direccion.intCodpost = txtCodPos.Text;
            direccion.strNumInt = txtNumInt.Text.ToUpper();
            direccion.strNumExt = txtNumExt.Text.ToUpper();
            direccion.strReferencias = txtReferencia.Text.ToUpper();

            tblTelefono telefono = new tblTelefono();
            telefono.strCelular = txtCelular.Text.ToUpper();
            telefono.strTelCasa = txtTelCasa.Text.ToUpper();
            telefono.strOtro = txtTelOtro.Text.ToUpper();

            tblUsuario login = new tblUsuario();
            login.strUsuario = txtUsuario.Text;
            login.strPassword = txtPass.Text;
            login.strTipousuario = rol;

            empl.tblDireccion = direccion;
            empl.tblTelefono = telefono;
            empl.tblUsuario = login;

            return empl;
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            var municipio = (from estmun in contexto.tblEstado_Municipio

                             join est in contexto.tblEstado
                             on estmun.fkEstado
                             equals est.idEstado

                             join mun in contexto.TblMunicipio
                             on estmun.fkMunicipio
                             equals mun.idMunicipio

                             where estmun.fkEstado == Convert.ToInt32(ddlEstado.SelectedValue)
                             select mun.strMunicipio).ToList();
            ddlMunicipio.Items.Add("Seleccionar");
            ddlMunicipio.DataSource = municipio;
            ddlMunicipio.DataValueField = "idEstado_Municipio";
            ddlMunicipio.DataTextField = "fkEstado";
            ddlMunicipio.DataBind();
        }
    }
}