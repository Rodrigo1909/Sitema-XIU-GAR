using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace ProjectPaslum.Controllers
{
    public class ControllerProveedor
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();

        public bool InsertarProveedor(tblProveedor _TBL_Provee)
        {
            bool respuesta = false;
            try
            {
                contexto.tblProveedor.InsertOnSubmit(_TBL_Provee);
                contexto.SubmitChanges();
                respuesta = true;

            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.ToString());
                respuesta = false;

            }
            return respuesta;

        }

        public List<tblEstado> ConsultaEstado()
        {
            return contexto.tblEstado.ToList<tblEstado>();
        }

        public List<tblEstado_Municipio> ConsultaEstadoMunicipio()
        {
            return contexto.tblEstado_Municipio.ToList<tblEstado_Municipio>();

        }

        public void Editar(tblEmpleado empl, tblTelefono tel)
        {
            tblEmpleado emplBd = contexto.tblEmpleado
                .Where(t => t.idEmpleado == empl.idEmpleado).FirstOrDefault();
            if (emplBd != null)
            {
                emplBd.strCorreo = empl.strCorreo;
                contexto.SubmitChanges();
            }

            tblTelefono telBd = contexto.tblTelefono
                .Where(t => t.idTelefono == tel.idTelefono).FirstOrDefault();
            if (telBd != null)
            {
                telBd.strCelular = tel.strCelular;
                telBd.strTelCasa = tel.strTelCasa;
                telBd.strOtro = tel.strOtro;
                contexto.SubmitChanges();
            }
        }

        public tblProveedor ConsultarProveedor(string strNombre)
        {
            return contexto.tblProveedor.Where(e => e.strNombre == strNombre).FirstOrDefault<tblProveedor>();

        }

        MailMessage m = new MailMessage();
        SmtpClient smtp = new SmtpClient();

        public bool enviarcorreo(string to, string contra)
        {
            try
            {
                var correo = "xiugarmx@gmail.com";
                var pass = "Pakal2019";

                m.From = new MailAddress(correo);
                m.To.Add(new MailAddress(to));

                m.Body = "Gracias por ser uno de nuestros emprendedores, somos una empresa 100% Mexicana\n" +
                    "y una de las más grandes de México en la produccion de azucar," +
                    "es un placer tenerte en nuestro equipo.\n" +
                    "Tu usuario es: " + to + "\n" +
                    "Tu contraseña es: " + contra;

                m.Subject = "Bienvenido a XIU-GAR";

                smtp.Host = "smtp.gmail.com";

                smtp.Port = 587;

                smtp.Credentials = new NetworkCredential(correo, pass);

                smtp.EnableSsl = true;

                smtp.Send(m);

                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
                return false;
            }
        }
    }
}