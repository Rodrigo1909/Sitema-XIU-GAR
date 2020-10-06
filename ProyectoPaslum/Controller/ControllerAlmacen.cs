using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using System.Data.SqlClient;

namespace Controller
{
    public class ControllerAlmacen
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarAlmacen(tblAlmacen _TBL_Alm)
        {
            bool respuesta = false;
            try
            {
                contexto.tblAlmacen.InsertOnSubmit(_TBL_Alm);
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

        public bool InsertarEntradaAlmacen(tblStock _TBL_Stock)
        {
            bool respuesta = false;
            try
            {
                contexto.tblStock.InsertOnSubmit(_TBL_Stock);
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

        public bool InsertarMovimientoAlmacen(tblMovimiento _TBL_Movimiento)
        {
            bool respuesta = false;
            try
            {
                contexto.tblMovimiento.InsertOnSubmit(_TBL_Movimiento);
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

        public List<tblEmpleado> ConsultaEmpleado()
        {
            return contexto.tblEmpleado.ToList<tblEmpleado>();
        }

        public List<tblAlmacen> ConsultaAlmacen()
        {
            return contexto.tblAlmacen.ToList<tblAlmacen>();
        }

        public List<tblProducto> ConsultaProducto()
        {
            return contexto.tblProducto.ToList<tblProducto>();
        }

    }
}
