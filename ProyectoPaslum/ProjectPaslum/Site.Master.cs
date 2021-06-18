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
using ProjectPaslum.Controllers;
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

        protected tblUsuario GetDatosVista()
        {
            String user = txtUsuario.Text;
            String pass = txtPass.Text;

            tblUsuario usuario = new tblUsuario();
            usuario.strUsuario = user;
            usuario.strPassword = pass;
            return usuario;

        }

        protected void ValidarLogin(tblUsuario usuario)
        {
            ControllerAutenticacion ctrlAutenticacion = new ControllerAutenticacion();
            tblUsuario UsuarioLoggeado = ctrlAutenticacion.ValidarLogin(usuario);

            if (UsuarioLoggeado != null)
            {
                if (UsuarioLoggeado.strTipousuario == "ADMINISTRADOR")
                {
                    Response.Redirect("./Administrador/PrincipalAdministrador.aspx", true);
                }
                if (UsuarioLoggeado.strTipousuario == "VENDEDOR")
                {
                    var vendedor = (from empl in contexto.tblEmpleado
                                    where empl.fkLogin == UsuarioLoggeado.idUsuario
                                    select empl).FirstOrDefault();

                    var vendedorTel = (from profeTel in contexto.tblEmpleado
                                       join tel in contexto.tblTelefono 
                                       on profeTel.fkTelefono equals tel.idTelefono
                                       select new { celular = tel.strCelular, casa = tel.strTelCasa}).FirstOrDefault();
                   
                    Session["id"] = vendedor.idEmpleado;
                    Session["idUsuario"] = UsuarioLoggeado.idUsuario;
                    Session["CompletoNombre"] = vendedor.strNombre + " " + vendedor.strApellidoP + " " + vendedor.strApellidoM;
                    Session["nombre"] = vendedor.strNombre;
                    Session["apellido1"] = vendedor.strApellidoP;
                    Session["apellido2"] = vendedor.strApellidoM;
                    Session["correo"] = vendedor.strCorreo;
                    Session["telefono1"] = vendedorTel.celular;
                    Session["telefono2"] = vendedorTel.casa;
                    Session["rol"] = UsuarioLoggeado.strTipousuario;

                    Response.Redirect("./Venta/PrincipalVendedor.aspx", true);
                }
                else if (UsuarioLoggeado.strTipousuario == "ALMACEN")
                {                    
                    var almacen = (from empl in contexto.tblEmpleado
                                    where empl.fkLogin == UsuarioLoggeado.idUsuario
                                    select empl).FirstOrDefault();
                    
                    Session["id"] = almacen.idEmpleado;
                    Session["nombre"] = almacen.strNombre + " " + almacen.strApellidoP + " " + almacen.strApellidoM;
                    Response.Redirect("./Almacen/PrincipalAlmacen.aspx", true);
                }
                else if (UsuarioLoggeado.strTipousuario == "CLIENTE")
                {
                    var cliente = (from cli in contexto.tblCliente
                                   where cli.fkLogin == UsuarioLoggeado.idUsuario
                                   select cli).FirstOrDefault();
                   
                    Session["id"] = cliente.idCliente;
                    Session["nombre"] = cliente.strNombre + " " + cliente.strApellidoP + " " + cliente.strApellidoM;
                    Session["correo"] = cliente.strCorreo;
                    Response.Redirect("./Cliente/CompraCliente.aspx", true);
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