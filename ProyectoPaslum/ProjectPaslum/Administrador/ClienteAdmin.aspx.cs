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

namespace ProjectPaslum.Administrador
{
    public partial class ClienteAdmin : System.Web.UI.Page
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
            ControllerCliente CtrlEstado = new ControllerCliente();
            List<tblEstado> estado = CtrlEstado.ConsultaEstado();
            ddlEstado.Items.Add("Seleccionar");
            ddlEstado.DataSource = estado;
            ddlEstado.DataValueField = "idEstado";
            ddlEstado.DataTextField = "strEstado";
            ddlEstado.DataBind();

        }

        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            var municipio = (from munesta in contexto.tblEstado_Municipio

                             join mun in contexto.TblMunicipio
                             on munesta.fkMunicipio
                             equals mun.idMunicipio

                             join est in contexto.tblEstado
                             on munesta.fkEstado
                             equals est.idEstado

                             where munesta.fkEstado == Convert.ToInt32(ddlEstado.SelectedValue)
                             select new { nombre = mun.strMunicipio, id = munesta.idEstado_Municipio }).ToList();



            ddlMunicipio.Items.Add("Seleccionar");
            ddlMunicipio.DataValueField = "id";
            ddlMunicipio.DataTextField = "nombre";
            ddlMunicipio.DataSource = municipio;
            ddlMunicipio.DataBind();
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
            }
            else
            {
                //sweet poner que ya esta registrado el correo
            }

            this.Response.Redirect("./ClienteAdmin.aspx", true);
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
            ctrlClie.enviarcorreo(cli.strCorreo, value.ToString());

            cli.tblDireccion = direccion;
            cli.tblTelefono = telefono;
            cli.tblUsuario = login;

            return cli;
        }
    }
}