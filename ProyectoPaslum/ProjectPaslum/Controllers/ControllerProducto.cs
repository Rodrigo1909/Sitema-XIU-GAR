using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;

namespace ProjectPaslum.Controllers
{
    public class ControllerProducto
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarProducto(tblProducto _TBL_Prod)
        {
            bool respuesta = false;
            try
            {
                contexto.tblProducto.InsertOnSubmit(_TBL_Prod);
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

        public List<tblAlmacen> ConsultaAlmacen()
        {
            return contexto.tblAlmacen.ToList<tblAlmacen>();
        }

        public List<tblUnidadMedida> ConsultaUnidadMedida()
        {
            return contexto.tblUnidadMedida.ToList<tblUnidadMedida>();
        }
    }
}