using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerQr
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarQr(TblQR _TBL_QR)
        {
            bool respuesta = false;
            try
            {
                contexto.TblQR.InsertOnSubmit(_TBL_QR);
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

        public List<TblGrupo> ConsultaGrupo()
        {
            return contexto.TblGrupo.ToList<TblGrupo>();
        }

        public List<TblMateria> ConsultaMateria()
        {
            return contexto.TblMateria.ToList<TblMateria>();
        }
    }
}
