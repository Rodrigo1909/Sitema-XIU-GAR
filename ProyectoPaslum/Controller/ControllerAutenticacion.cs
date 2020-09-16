using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace Controller
{
    public class ControllerAutenticacion
    {
        private PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public TblUser ValidarLogin(TblUser _user)
        {
            TblUser respuesta = null;
            Expression<Func<TblUser, bool>> predicado = p => p.strusuario == _user.strusuario && p.strpass == _user.strpass;
            try
            {
                TblUser user = contexto.TblUser.Where(predicado).FirstOrDefault<TblUser>();
                if (user != null)
                {

                    if (user.id > 0)
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
