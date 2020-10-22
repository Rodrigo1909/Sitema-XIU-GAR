using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace ProjectPaslum.Controllers
{
    public class ControllerAutenticacion
    {
        private PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public tblUsuario ValidarLogin(tblUsuario _user)
        {
            tblUsuario respuesta = null;
            Expression<Func<tblUsuario, bool>> predicado = p => p.strUsuario == _user.strUsuario && p.strPassword == _user.strPassword;
            try
            {
                tblUsuario user = contexto.tblUsuario.Where(predicado).FirstOrDefault<tblUsuario>();
                if (user != null)
                {

                    if (user.idUsuario > 0)
                    {
                        respuesta = user;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Usuario o contraseña incorrecto", ex);
                respuesta = null;
            }
            return respuesta;
        }
    }
}