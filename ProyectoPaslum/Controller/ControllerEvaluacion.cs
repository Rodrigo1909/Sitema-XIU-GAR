using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerEvaluacion
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarEvaluacion(TblCatalogoEvaluacion _TBL_Evaluacion)
        {
            bool respuesta = false;
            try
            {
                contexto.TblCatalogoEvaluacion.InsertOnSubmit(_TBL_Evaluacion);
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
        public object ConsultaParciales()
        {
            return contexto.TblCatalogoParcial
                .Select(p => new
                {
                    id = p.id,
                    strNombre = (p.strNombre + "   " + p.strDescripcion ).ToUpper()
                })
                .ToList();
        }

    }
}
