using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerMateria
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarMateria(TblMateria _TBL_Mate)
        {
            bool respuesta = false;
            try
            {
                contexto.TblMateria.InsertOnSubmit(_TBL_Mate);
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


        public List<TblCarrera> ConsultaCarrera()
        {
            return contexto.TblCarrera.ToList<TblCarrera>();
        }

        public List<TblCuatri> ConsultaCuatri()
        {
            return contexto.TblCuatri.ToList<TblCuatri>();
        }
    }
}