using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerGrupo
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarGrupo(TblGrupo _TBL_Grupo)
        {
            bool respuesta = false;
            try
            {
                contexto.TblGrupo.InsertOnSubmit(_TBL_Grupo);
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
    }
}
