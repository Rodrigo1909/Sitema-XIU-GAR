using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using ProjectPaslum.Controllers;
using Controller;

namespace ProjectPaslum.Administrador
{
    public partial class EmpleadoAdmin : System.Web.UI.Page
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
            ControllerEmpleado CtrlEstado = new ControllerEmpleado();
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
            txtEdad.Text = "";
            txtCorreo.Text = "";

            txtCalle.Text = "";
            txtColonia.Text = "";
            txtNumExt.Text = "";
            txtNumInt.Text = "";
            txtCodPos.Text = "";
            txtReferencia.Text = "";
            
            txtTelCasa.Text = "";
            txtTelOtro.Text = "";
            txtCelular.Text = "";

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
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                this.LimpiarCampos();
                
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }

            
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

            ControllerEmpleado ctrlEmpl = new ControllerEmpleado();
            ctrlEmpl.enviarcorreo(empl.strCorreo, value.ToString());

            empl.tblDireccion = direccion;
            empl.tblTelefono = telefono;
            empl.tblUsuario = login;

            return empl;
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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string identificador = txtBusqueda.Text.ToUpper();
            tblEmpleado empleado = this.GetEmpleado(identificador);
            this.ConfigurarGrid(empleado);

        }

        public tblEmpleado GetEmpleado(string nombre)
        {
            ControllerEmpleado ctrEmpleado = new ControllerEmpleado();
            return ctrEmpleado.ConsultarEmpleado(nombre);
        }

        public void ConfigurarGrid(tblEmpleado emplea)
        {          

            if(emplea == null)
            {
                Response.Redirect("./EmpleadoAdmin.aspx", true);
            }
            else if (emplea.idActivo == 1)            
            {
                try
                {
                    var informacion = (from empl in contexto.tblEmpleado
                                        join tel in contexto.tblTelefono
                                            on empl.fkTelefono equals tel.idTelefono
                                        join log in contexto.tblUsuario
                                            on empl.fkLogin equals log.idUsuario
                                        join dir in contexto.tblDireccion
                                            on empl.fkDireccion equals dir.idDireccion
                                        join pri in contexto.tblEstado_Municipio 
                                            on dir.fkEstadoMunicipio equals pri.idEstado_Municipio
                                        join e in contexto.tblEstado 
                                            on pri.fkEstado equals e.idEstado
                                        join m in contexto.TblMunicipio 
                                            on pri.fkMunicipio equals m.idMunicipio
                                        where empl.idEmpleado == emplea.idEmpleado
                                        select new
                                        {
                                            NOMBRE = empl.strNombre + " " + empl.strApellidoP + " " + empl.strApellidoM,
                                            DIRECCIÓN = dir.strCalle + ", " + dir.strColonia  + ", " + e.strEstado + ", " + m.strMunicipio + ", " + dir.intCodpost,
                                            TELÉFONO = "(" + tel.strCelular + "),(" + tel.strTelCasa + ")",
                                            CORREO = empl.strCorreo,
                                            PASSWORD = log.strPassword
                                        }).ToList();

                    GridEmpleado.DataSource = informacion;
                    GridEmpleado.DataBind();               

                }
                catch (Exception)
                {

                    throw;
                }
            }
            else
            {
                Response.Redirect("./EmpleadoAdmin.aspx", true);
            }
        }

        protected void btnBorrar_Click(object sender, ImageClickEventArgs e)
        {
            var idEmpleado = (from empl in contexto.tblEmpleado
                               where empl.strNombre == txtBusqueda.Text.ToUpper()
                               select new { id = empl.idEmpleado }).FirstOrDefault();

            tblEmpleado emp = new tblEmpleado();
            ControllerEmpleado ctrlEmp = new ControllerEmpleado();

            emp.idEmpleado = idEmpleado.id;
            emp.idActivo = 0;

            ctrlEmp.BorradoLogicoEmpleado(emp);
            Response.Redirect("./EmpleadoAdmin.aspx", true);
        }
    }
}