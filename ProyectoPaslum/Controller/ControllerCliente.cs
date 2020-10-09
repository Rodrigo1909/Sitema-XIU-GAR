using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Controller
{
    public class ControllerCliente
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarCliente(tblCliente _TBL_Cliente)
        {
            bool respuesta = false;
            try
            {
                contexto.tblCliente.InsertOnSubmit(_TBL_Cliente);
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

        MailMessage m = new MailMessage();
        SmtpClient smtp = new SmtpClient();

        public bool enviarcorreo(string to, string contra)
        {
            try
            {
                var correo = "rodrigo.montero1909@gmail.com";
                var pass = "solamente1909";

                m.From = new MailAddress(correo);
                m.To.Add(new MailAddress(to));

                m.Body = "Gracias por ser nuestro cliente somos empresa azucarera más grande de México," + 
                    "es un placer tenerte en nuestro catalogo de clientes, tu usuario es tu correo electronico y tu contraseña es: " + contra;

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
