using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Modelo;
using System.Data.SqlClient;

namespace ProjectPaslum.Controllers
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
            var activo = 1;

            var almacen = (from alm in contexto.tblAlmacen
                           where alm.idActivo == activo
                           select alm).ToList();
            return almacen;
        }

        public List<tblProducto> ConsultaProducto()
        {
            return contexto.tblProducto.ToList<tblProducto>();
        }

        public void EditarProceso(tblVenta ven)
        {
            tblVenta venBd = contexto.tblVenta
                .Where(t => t.idVenta == ven.idVenta).FirstOrDefault();
            if (venBd != null)
            {
                venBd.strEstado = "EN PROCESO";
                contexto.SubmitChanges();
            }
            
        }

        public void EditarFinalizado(tblVenta ven)
        {
            tblVenta venBd = contexto.tblVenta
                .Where(t => t.idVenta == ven.idVenta).FirstOrDefault();
            if (venBd != null)
            {
                venBd.strEstado = "FINALIZADO";
                contexto.SubmitChanges();
            }

        }

        public void EditarFinalizadoCredito(tblVenta ven)
        {
            tblVenta venBd = contexto.tblVenta
                .Where(t => t.idVenta == ven.idVenta).FirstOrDefault();
            if (venBd != null)
            {
                venBd.strEstado = "VENTA A CREDITO FINALIZADA";
                contexto.SubmitChanges();
            }

        }

        public void EditarPendiente(tblVenta ven)
        {
            tblVenta venBd = contexto.tblVenta
                .Where(t => t.idVenta == ven.idVenta).FirstOrDefault();
            if (venBd != null)
            {
                venBd.strEstado = "PENDIENTE";
                contexto.SubmitChanges();
            }

        }
    }
}