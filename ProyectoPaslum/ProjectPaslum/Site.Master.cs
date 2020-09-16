using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Modelo;
using Controller;
using System.Linq;

namespace ProjectPaslum
{
    public partial class SiteMaster : MasterPage
    {
        private PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // El código siguiente ayuda a proteger frente a ataques XSRF
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Utilizar el token Anti-XSRF de la cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generar un nuevo token Anti-XSRF y guardarlo en la cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Establecer token Anti-XSRF
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validar el token Anti-XSRF
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Error de validación del token Anti-XSRF.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            ValidarLogin(GetDatosVista());
        }

        protected TblUser GetDatosVista()
        {
            String user = txtUsuario.Text;
            String pass = txtPass.Text;

            TblUser usuario = new TblUser();
            usuario.strusuario = user;
            usuario.strpass = pass;
            return usuario;

        }

        protected void ValidarLogin(TblUser usuario)
        {
            if (this.txtUsuario.Text.Equals("administrador") && this.txtPass.Text.Equals("1234"))
            {
                Session["user"] = txtUsuario.Text;
                this.Response.Redirect("./Administrador/PrincipalAdministrador.aspx", true);
            }
            ControllerAutenticacion ctrlAutenticacion = new ControllerAutenticacion();
            TblUser UsuarioLoggeado = ctrlAutenticacion.ValidarLogin(usuario);

            if (UsuarioLoggeado != null)
            {
                if (UsuarioLoggeado.strtipoUsuario == "PROFESOR")
                {
                    var profesor = (from profe in contexto.TblProfesor where profe.idUser == UsuarioLoggeado.id select profe).FirstOrDefault();
                    var profesorTel = (from profeTel in contexto.TblProfesor join tel in contexto.TblTelefono on profeTel.idTelefono equals tel.id select new { celular = tel.strcelular, casa = tel.strtelCasa, otro = tel.strotro }).FirstOrDefault();
                    var profesorDir = (from profeDir in contexto.TblProfesor join dir in contexto.TblDireccion on profeDir.idDireccion equals dir.id select new { calle = dir.strcalle, colonia = dir.strcolonia, municipio = dir.strmunicipio }).FirstOrDefault();
                    Session["id"] = profesor.id;
                    Session["nombre"] = profesor.strNombre;
                    Session["apellido1"] = profesor.strApellidoP;
                    Session["apellido2"] = profesor.strApellidoM;
                    Session["matricula"] = profesor.id;
                    Session["correo"] = profesor.strCorreo;
                    Session["telefono1"] = profesorTel.celular;
                    Session["telefono2"] = profesorTel.casa;
                    Session["telefono3"] = profesorTel.otro;
                    Session["calle"] = profesorDir.calle;
                    Session["colonia"] = profesorDir.colonia;
                    Session["municipio"] = profesorDir.municipio;
                    Session["forTel"] = profesor.idTelefono;
                    Session["forDom"] = profesor.idDireccion;
                    Response.Redirect("./Profesor/PrincipalProfesor.aspx", true);
                }
                else if (UsuarioLoggeado.strtipoUsuario == "ALUMNO")
                {                    
                    var alumno = (from alum in contexto.TblAlumno where alum.idUser == UsuarioLoggeado.id select alum).FirstOrDefault();
                    var alumnoTel = (from al in contexto.TblAlumno join tel in contexto.TblTelefono on al.idTelefono equals tel.id select new { celular = tel.strcelular, casa = tel.strtelCasa, otro =tel.strotro }).FirstOrDefault();
                    var alumnoCar = (from alcar in contexto.TblAlumno join car in contexto.TblCarrera on alcar.idCarrera equals car.id select new { nombre = car.strNombre, area = car.strArea }).FirstOrDefault();
                    var alumnoDir = (from aldir in contexto.TblAlumno join dir in contexto.TblDireccion on aldir.idDireccion equals dir.id select new { calle = dir.strcalle, colonia = dir.strcolonia, municipio = dir.strmunicipio}).FirstOrDefault();
                    Session["id"] = alumno.id;
                    Session["nombre"] = alumno.strNombre;
                    Session["apellido1"] = alumno.strApellidoP;
                    Session["apellido2"] = alumno.strApellidoM;
                    Session["matricula"] = alumno.id;
                    Session["correo"] = alumno.strCorreo;
                    Session["telefono1"] = alumnoTel.celular;
                    Session["telefono2"] = alumnoTel.casa;
                    Session["telefono3"] = alumnoTel.otro;
                    Session["carrera"] = alumnoCar.nombre;
                    Session["area"] = alumnoCar.area;
                    Session["calle"] = alumnoDir.calle;
                    Session["colonia"] = alumnoDir.colonia;
                    Session["municipio"] = alumnoDir.municipio;
                    Session["forTel"] = alumno.idTelefono;
                    Session["forDom"] = alumno.idDireccion;
                    Session["forGrupo"] = alumno.idGrupo;
                    Response.Redirect("./Alumno/PrincipalAlumno.aspx", true);
                }
            }
            else
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Usuario o contraseña incorrecta');</script>");
                Response.Redirect("IndexPaslum.aspx", true);
                this.Response.Write("<script> lenguage='JavaScript'>windows.alert('Fallo')</script>");
            }
        }
    }

}