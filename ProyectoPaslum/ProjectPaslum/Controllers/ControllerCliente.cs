using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace ProjectPaslum.Controllers
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
                var correo = "xiugarmx@gmail.com";
                var pass = "Pakal2019";

                m.From = new MailAddress(correo);
                m.To.Add(new MailAddress(to));

                m.Body = "Gracias por ser parte de nuestros clientes, somos empresa azucarera más grande de México," +
                    "es un placer tenerte en nuestro catalogo de clientes.\n" +
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

        public List<tblCliente> ConsultaCliente()
        {
            return contexto.tblCliente.ToList<tblCliente>();
        }

        public bool InsertarVenta(tblVenta _TBL_Venta)
        {
            bool respuesta = false;
            try
            {
                contexto.tblVenta.InsertOnSubmit(_TBL_Venta);
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
        public bool InsertarDetalle(tblDetalleVenta _TBL_DetalleVenta)
        {
            bool respuesta = false;
            try
            {
                contexto.tblDetalleVenta.InsertOnSubmit(_TBL_DetalleVenta);
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

        public bool InsertarOrdenCompra(tblOrdenCompra _TBL_OrdenCompra)
        {
            bool respuesta = false;
            try
            {
                contexto.tblOrdenCompra.InsertOnSubmit(_TBL_OrdenCompra);
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

        public bool InsertarHistorialAbono(tblHistorialAbono _TBL_HistorialAbono)
        {
            bool respuesta = false;
            try
            {
                contexto.tblHistorialAbono.InsertOnSubmit(_TBL_HistorialAbono);
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
    }
}