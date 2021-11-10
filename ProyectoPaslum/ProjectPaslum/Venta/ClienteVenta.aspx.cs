using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using ProjectPaslum.Controllers;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Text;

namespace ProjectPaslum.Venta
{
    public partial class ClienteVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                this.LlenarEstado();
                this.LlenarEstadoEmpresarial();
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }

        private void LlenarEstado()
        {
            ControllerCliente CtrlEstado = new ControllerCliente();
            List<tblEstado> estado = CtrlEstado.ConsultaEstado();
            ddlEstado.Items.Add("Seleccionar");
            ddlEstado.DataSource = estado;
            ddlEstado.DataValueField = "idEstado";
            ddlEstado.DataTextField = "strEstado";
            ddlEstado.DataBind();

        }

        private void LlenarEstadoEmpresarial()
        {
            ControllerCliente CtrlEstado = new ControllerCliente();
            List<tblEstado> estado = CtrlEstado.ConsultaEstado();
            ddlEstadoEmpresarial.Items.Add("Seleccionar");
            ddlEstadoEmpresarial.DataSource = estado;
            ddlEstadoEmpresarial.DataValueField = "idEstado";
            ddlEstadoEmpresarial.DataTextField = "strEstado";
            ddlEstadoEmpresarial.DataBind();

        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtAMaterno.Text = "";
            txtAPaterno.Text = "";
            txtEstablecimiento.Text = "";
            txtCorreo.Text = "";
            txtSituacion.Text = "";
            txtMetodoPago.Text = "";
            txtCalle.Text = "";
            txtColonia.Text = "";
            txtNumExt.Text = "";
            txtNumInt.Text = "";
            txtCodPos.Text = "";
            txtReferencia.Text = "";
            txtNumeroBodega.Text = "";
            txtHorario.Text = "";
            txtEncargador.Text = "";
            txtPagos.Text = "";
            txtTelEncargador.Text = "";
            txtTelOtro.Text = "";
            txtCelular.Text = "";

        }

        private void LimpiarCamposEmpresarial()
        {
            txtNombreEmpresarial.Text = "";
            txtPaternoEmpresarial.Text = "";
            txtMaternoEmpresarial.Text = "";
            txtEstablecimientoEmpresarial.Text = "";
            txtCorreoEmpresarial.Text = "";
            txtPagoEmpresarial.Text = "";
            txtCalleEmpresarial.Text = "";
            txtColoniaEmpresarial.Text = "";
            txtExteriorEmpresarial.Text = "";
            txtInteriorEmpresarial.Text = "";
            txtCPEmpresarial.Text = "";
            txtReferenciaEmpresarial.Text = "";
            txtCelularEmpresarial.Text = "";
            txtOficinaEmpresarial.Text = "";
            txtOtroEmpresarial.Text = "";
            txtRFEmpresarial.Text = "";

        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var usu = (from usua in contexto.tblUsuario
                       where usua.strUsuario == txtCorreo.Text
                       select usua).FirstOrDefault();


            if (usu == null)
            {
                tblCliente cli = new tblCliente();
                cli.strNombre = txtNombre.Text.ToUpper();
                cli.strApellidoP = txtAPaterno.Text.ToUpper();
                cli.strApellidoM = txtAMaterno.Text.ToUpper();
                cli.strSituacionFiscal = txtSituacion.Text;
                cli.strCorreo = txtCorreo.Text;
                cli.strNumeroBodega = txtNumeroBodega.Text;
                cli.strHorarioAtencion = txtHorario.Text;
                cli.strEncargado = txtEncargador.Text.ToUpper();
                cli.strPagos = txtPagos.Text.ToUpper();
                cli.strMetodoPago = txtMetodoPago.Text;
                cli.strEstablecimiento = txtEstablecimiento.Text;
                cli.idActivo = 1;
                ControllerCliente ctrlCli = new ControllerCliente();
                ctrlCli.InsertarCliente(GetDatosVista(cli));
                this.LimpiarCamposEmpresarial();
                this.LimpiarCampos();
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
        }
        protected tblCliente GetDatosVista(tblCliente cli)
        {

            var EstaMuni = ddlMunicipio.SelectedItem.Value;
            var random = new Random();
            var value = random.Next(0, 999999);


            tblDireccion direccion = new tblDireccion();
            direccion.fkEstadoMunicipio = Int32.Parse(EstaMuni);
            direccion.strCalle = txtCalle.Text.ToUpper();
            direccion.strColonia = txtColonia.Text.ToUpper();
            direccion.intCodpost = txtCodPos.Text;
            direccion.strNumInt = txtNumInt.Text.ToUpper();
            direccion.strNumExt = txtNumExt.Text.ToUpper();
            direccion.strReferencias = txtReferencia.Text.ToUpper();

            tblTelefono telefono = new tblTelefono();
            telefono.strCelular = txtCelular.Text.ToUpper();
            telefono.strTelCasa = txtTelEncargador.Text.ToUpper();
            telefono.strOtro = txtTelOtro.Text.ToUpper();

            tblUsuario login = new tblUsuario();
            login.strUsuario = txtCorreo.Text;
            login.strPassword = value.ToString();
            login.strTipousuario = "CLIENTE";
            login.idActivo = 1;

            ControllerCliente ctrlClie = new ControllerCliente();
            //ctrlClie.enviarcorreo(cli.strCorreo, value.ToString());

            cli.tblDireccion = direccion;
            cli.tblTelefono = telefono;
            cli.tblUsuario = login;

            return cli;
        }
        protected void btnRegistarEmpresarial_Click(object sender, EventArgs e)
        {
            var usu = (from usua in contexto.tblUsuario
                       where usua.strUsuario == txtCorreoEmpresarial.Text
                       select usua).FirstOrDefault();


            if (usu == null)
            {
                tblCliente cli = new tblCliente();
                cli.strNombre = txtNombreEmpresarial.Text.ToUpper();
                cli.strApellidoP = txtPaternoEmpresarial.Text.ToUpper();
                cli.strApellidoM = txtMaternoEmpresarial.Text.ToUpper();
                cli.strSituacionFiscal = "No aplica";
                cli.strCorreo = txtCorreoEmpresarial.Text;
                cli.strNumeroBodega = "No aplica";
                cli.strHorarioAtencion = "No aplica";
                cli.strEncargado = "No aplica";
                cli.strPagos = "No aplica";
                cli.strMetodoPago = txtMetodoPago.Text;
                cli.strEstablecimiento = txtEstablecimientoEmpresarial.Text;
                cli.idActivo = 1;
                ControllerCliente ctrlCli = new ControllerCliente();
                ctrlCli.InsertarCliente(GetDatosVistaEmpresarial(cli));
                this.LimpiarCamposEmpresarial();
                this.LimpiarCampos();
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
        }

        protected tblCliente GetDatosVistaEmpresarial(tblCliente cli)
        {

            var EstaMuni = ddlMunicipioEmpresarial.SelectedItem.Value;
            var random = new Random();
            var value = random.Next(0, 999999);


            tblDireccion direccion = new tblDireccion();
            direccion.fkEstadoMunicipio = Int32.Parse(EstaMuni);
            direccion.strCalle = txtCalleEmpresarial.Text.ToUpper();
            direccion.strColonia = txtColoniaEmpresarial.Text.ToUpper();
            direccion.intCodpost = txtCPEmpresarial.Text;
            direccion.strNumInt = txtInteriorEmpresarial.Text.ToUpper();
            direccion.strNumExt = txtExteriorEmpresarial.Text.ToUpper();
            direccion.strReferencias = txtReferenciaEmpresarial.Text.ToUpper();

            tblTelefono telefono = new tblTelefono();
            telefono.strCelular = txtCelularEmpresarial.Text.ToUpper();
            telefono.strTelCasa = txtOficinaEmpresarial.Text.ToUpper();
            telefono.strOtro = txtOtroEmpresarial.Text.ToUpper();

            tblUsuario login = new tblUsuario();
            login.strUsuario = txtCorreoEmpresarial.Text;
            login.strPassword = value.ToString();
            login.strTipousuario = "CLIENTE";
            login.idActivo = 1;

            ControllerCliente ctrlClie = new ControllerCliente();
            //ctrlClie.enviarcorreo(cli.strCorreo, value.ToString());

            cli.tblDireccion = direccion;
            cli.tblTelefono = telefono;
            cli.tblUsuario = login;

            return cli;
        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMunicipio.Items.Clear();
            var municipio = (from munesta in contexto.tblEstado_Municipio

                             join mun in contexto.TblMunicipio
                             on munesta.fkMunicipio
                             equals mun.idMunicipio

                             join est in contexto.tblEstado
                             on munesta.fkEstado
                             equals est.idEstado
                             orderby mun.strMunicipio ascending
                             where munesta.fkEstado == Convert.ToInt32(ddlEstado.SelectedValue)
                             select new { nombre = mun.strMunicipio, id = munesta.idEstado_Municipio }).ToList();



            ddlMunicipio.Items.Add("Seleccionar");
            ddlMunicipio.DataValueField = "id";
            ddlMunicipio.DataTextField = "nombre";
            ddlMunicipio.DataSource = municipio;
            ddlMunicipio.DataBind();
        }

        protected void ddlEstadoEmpresarial_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMunicipioEmpresarial.Items.Clear();
            var municipio = (from munesta in contexto.tblEstado_Municipio

                             join mun in contexto.TblMunicipio
                             on munesta.fkMunicipio
                             equals mun.idMunicipio

                             join est in contexto.tblEstado
                             on munesta.fkEstado
                             equals est.idEstado
                             orderby mun.strMunicipio ascending
                             where munesta.fkEstado == Convert.ToInt32(ddlEstadoEmpresarial.SelectedValue)
                             select new { nombre = mun.strMunicipio, id = munesta.idEstado_Municipio }).ToList();



            ddlMunicipioEmpresarial.Items.Add("Seleccionar");
            ddlMunicipioEmpresarial.DataValueField = "id";
            ddlMunicipioEmpresarial.DataTextField = "nombre";
            ddlMunicipioEmpresarial.DataSource = municipio;
            ddlMunicipioEmpresarial.DataBind();
        }
    }
}