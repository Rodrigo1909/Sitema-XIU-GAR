using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerCuatri
    {
         PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarCuatri(TblCuatri _TBL_Cuatri)
        {
            bool respuesta = false;
            try
            {
                contexto.TblCuatri.InsertOnSubmit(_TBL_Cuatri);
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
