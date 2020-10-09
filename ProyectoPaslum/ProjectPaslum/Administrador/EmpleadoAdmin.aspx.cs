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
            var usu = (from usua in contexto.tblUsuario
                       where usua.strUsuario == txtCorreo.Text
                       select usua).FirstOrDefault();

            if (usu == null)
            {
                tblEmpleado empl = new tblEmpleado();
                empl.strNombre = txtNombre.Text.ToUpper();
                empl.strApellidoP = txtAPaterno.Text.ToUpper();
                empl.strApellidoM = txtAMaterno.Text.ToUpper();
                empl.strEdad = txtEdad.Text;
                empl.strSexo = sex;
                empl.strCorreo = txtCorreo.Text;
                empl.idActivo = 1;
                ControllerEmpleado ctrlEmpl = new ControllerEmpleado();
                ctrlEmpl.InsertarEmpleado(GetDatosVista(empl));
            }
            else
            {
                //sweet poner que ya esta registrado el correo
            }
          
            this.Response.Redirect("./EmpleadoAdmin.aspx", true);
        }

        protected tblEmpleado GetDatosVista(tblEmpleado empl)
        {

            var rol = cmbRol.SelectedItem.Value;
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
            telefono.strTelCasa = txtTelCasa.Text.ToUpper();
            telefono.strOtro = txtTelOtro.Text.ToUpper();

            tblUsuario login = new tblUsuario();
            login.strUsuario = txtCorreo.Text;
            login.strPassword = value.ToString();
            login.strTipousuario = rol;
            login.idActivo = 1;

            //ControllerEmpleado ctrlEmpl = new ControllerEmpleado();
            //ctrlEmpl.enviarcorreo(empl.strCorreo, value.ToString());

            empl.tblDireccion = direccion;
            empl.tblTelefono = telefono;
            empl.tblUsuario = login;

            return empl;
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
            int identificador = int.Parse(txtBusqueda.Text);
            tblEmpleado empleado = this.GetEmpleado(identificador);
            this.ConfigurarGrid(empleado);

        }

        public tblEmpleado GetEmpleado(int id)
        {
            ControllerEmpleado ctrEmpleado = new ControllerEmpleado();
            return ctrEmpleado.ConsultarEmpleado(id);
        }

        public void ConfigurarGrid(tblEmpleado emplea)
        {
            List<tblEmpleado> empleados = new List<tblEmpleado>();
            empleados.Add(emplea);
            this.GridEmpleado.DataSource = empleados;
            this.GridEmpleado.DataBind();
        }

    }
}