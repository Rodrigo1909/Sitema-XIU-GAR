using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;

namespace ProjectPaslum.Controllers
{
    public class ControllerUnidadMedida
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarUnidadMedida(tblUnidadMedida _TBL_UniMedida)
        {
            bool respuesta = false;
            try
            {
                contexto.tblUnidadMedida.InsertOnSubmit(_TBL_UniMedida);
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