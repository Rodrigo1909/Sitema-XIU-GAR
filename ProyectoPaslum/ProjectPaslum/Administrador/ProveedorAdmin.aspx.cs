using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Administrador
{
    public partial class ProveedorAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        ControllerProveedor CtrlProveedor = new ControllerProveedor();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.LlenarEstado();
            }
        }



        private void LlenarEstado()
        {
            List<tblEstado> estado = CtrlProveedor.ConsultaEstado();
            ddlEstado.Items.Add("Seleccionar");
            ddlEstado.DataSource = estado;
            ddlEstado.DataValueField = "idEstado";
            ddlEstado.DataTextField = "strEstado";
            ddlEstado.DataBind();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var usu = (from usua in contexto.tblUsuario
                       where usua.strUsuario == txtCorreo.Text
                       select usua).FirstOrDefault();

            if (usu == null)
            {
                tblProveedor provee = new tblProveedor();
                provee.strNombre = txtNombre.Text.ToUpper();
                provee.strApellidoP = txtAPaterno.Text.ToUpper();
                provee.strApellidoM = txtAMaterno.Text.ToUpper();
                provee.strRazonSocial = txtRazonSocial.Text;
                provee.strWeb = txtWeb.Text;
                provee.strProducto = txtProdServ.Text.ToUpper();
                provee.strCorreo = txtCorreo.Text;
                provee.idActivo = 1;
                CtrlProveedor.InsertarProveedor(GetDatosVista(provee));
            }
            else
            {
                //sweet poner que ya esta registrado el correo
            }

            this.Response.Redirect("./ProveedorAdmin.aspx", true);
        }

        protected tblProveedor GetDatosVista(tblProveedor provee)
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
            login.strTipousuario = "PROVEEDOR";
            login.idActivo = 1;

            CtrlProveedor.enviarcorreo(provee.strCorreo, value.ToString());

            provee.tblDireccion = direccion;
            provee.tblTelefono = telefono;
            provee.tblUsuario = login;

            return provee;
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string identificador = txtBusqueda.Text.ToUpper();
            tblProveedor proveedor = this.GetProveedor(identificador);
            this.ConfigurarGrid(proveedor);

        }

        public tblProveedor GetProveedor(string nombre)
        {
            return CtrlProveedor.ConsultarProveedor(nombre);
        }

        public void ConfigurarGrid(tblProveedor provee)
        {
            List<tblProveedor> proveedores = new List<tblProveedor>();
            proveedores.Add(provee);
            this.GridProveedor.DataSource = proveedores;
            this.GridProveedor.DataBind();
        }
    }
}