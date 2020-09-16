using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerParcial
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarParcial(TblCatalogoParcial _TBL_Parcial)
        {
            bool respuesta = false;
            try
            {
                contexto.TblCatalogoParcial.InsertOnSubmit(_TBL_Parcial);
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
