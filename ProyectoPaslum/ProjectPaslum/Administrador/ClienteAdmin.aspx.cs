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

namespace ProjectPaslum.Administrador
{
    public partial class ClienteAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                this.LlenarEstado();
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string identificador = txtBusqueda.Text.ToUpper();
            tblCliente cliente = this.GetCliente(identificador);
            this.ConfigurarGrid(cliente);
        }

        public tblCliente GetCliente(string nombre)
        {
            ControllerCliente ctrCliente = new ControllerCliente();
            return ctrCliente.ConsultarCliente(nombre);
        }

        public void ConfigurarGrid(tblCliente clien)
        {

            if (clien == null)
            {
                Response.Redirect("./ClienteAdmin.aspx", true);
            }
            else if (clien.idActivo == 1)
            {
                try
                {
                    var informacion = (from cli in contexto.tblCliente
                                       join tel in contexto.tblTelefono
                                           on cli.fkTelefono equals tel.idTelefono
                                       join dir in contexto.tblDireccion
                                           on cli.fkDireccion equals dir.idDireccion
                                       join pri in contexto.tblEstado_Municipio
                                           on dir.fkEstadoMunicipio equals pri.idEstado_Municipio
                                       join e in contexto.tblEstado
                                           on pri.fkEstado equals e.idEstado
                                       join m in contexto.TblMunicipio
                                           on pri.fkMunicipio equals m.idMunicipio
                                       where cli.idCliente == clien.idCliente
                                       select new
                                       {
                                           ENCARGADO = cli.strNombre + " " + cli.strApellidoP + " " + cli.strApellidoM,
                                           ESTABLECIMIENTO = cli.strEstablecimiento,
                                           DIRECCIÓN = dir.strCalle + ", " + dir.strColonia + ", " + e.strEstado + ", " + m.strMunicipio + ", " + dir.intCodpost,
                                           TELÉFONO = "(" + tel.strCelular + "),(" + tel.strTelCasa + ")",
                                           CORREO = cli.strCorreo,
                                       }).ToList();

                    GridCliente.DataSource = informacion;
                    GridCliente.DataBind();



                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                Response.Redirect("./ClienteAdmin.aspx", true);
            }
        }

        protected void btnBorrar_Click(object sender, ImageClickEventArgs e)
        {
            var idCliente = (from clie in contexto.tblCliente
                              where clie.strNombre == txtBusqueda.Text.ToUpper()
                              select new { id = clie.idCliente }).FirstOrDefault();

            tblCliente cli = new tblCliente();
            ControllerCliente ctrlClie = new ControllerCliente();

            cli.idCliente = idCliente.id;
            cli.idActivo = 0;

            ctrlClie.BorradoLogicoCliente(cli);
            Response.Redirect("./ClienteAdmin.aspx", true);
        }

        //protected void btnExportarExcel_Click(object sender, EventArgs e)
        //{
        //    //ExportToExcel("Informe.xlsx", GridView1);
        //    Response.ClearContent();
        //    Response.AddHeader("content-disposition", "attachment;filename=FileName.xlsx");
        //    Response.Charset = "";
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.ContentType = "application/vnd.xls";

        //    System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        //    System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        //    //GridView1.RenderControl(htmlWrite);
        //    Response.Write(stringWrite.ToString());
        //    Response.End();
        //}
        //protected override void Render(HtmlTextWriter writer)
        //{
        //    /// this is needed to render your new control.
        //    base.Render(writer);
        //}

        //public override void VerifyRenderingInServerForm(Control control)
        //{

        //}

        //private void ExportToExcel(string nameReport, GridView wControl)
        //{
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ClearContent();
        //    Response.ClearHeaders();
        //    Response.Charset = "UTF-8";
        //    StringWriter strwritter = new StringWriter();
        //    HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.ContentType = "application/vnd.ms-excel";
        //    Response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
        //    GridView1.GridLines = GridLines.Both;
        //    GridView1.HeaderStyle.Font.Bold = true;
        //    GridView1.RenderControl(htmltextwrtter);
        //    Response.Write(strwritter.ToString());
        //    Response.End();


        //}
    }
}