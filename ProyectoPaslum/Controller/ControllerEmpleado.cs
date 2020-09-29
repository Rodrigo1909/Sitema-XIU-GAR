using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerEmpleado
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarEmpleado(tblEmpleado _TBL_Empl)
        {
            bool respuesta = false;
            try
            {
                contexto.tblEmpleado.InsertOnSubmit(_TBL_Empl);
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

        public List<tblEstado> ConsultaEstado()
        {
            return contexto.tblEstado.ToList<tblEstado>();
        }

        public List<tblEstado_Municipio> ConsultaEstadoMunicipio()
        {
            return contexto.tblEstado_Municipio.ToList<tblEstado_Municipio>();

        }

        public void Editar(tblEmpleado empl, tblTelefono tel)
        {
            tblEmpleado emplBd = contexto.tblEmpleado
                .Where(t => t.idEmpleado == empl.idEmpleado).FirstOrDefault();
            if (emplBd != null)
            {
                emplBd.strCorreo = empl.strCorreo;                
                contexto.SubmitChanges();
            }

            tblTelefono telBd = contexto.tblTelefono
                .Where(t => t.idTelefono == tel.idTelefono).FirstOrDefault();
            if (telBd != null)
            {
                telBd.strCelular = tel.strCelular;
                telBd.strTelCasa = tel.strTelCasa;
                telBd.strOtro = tel.strOtro;
                contexto.SubmitChanges();
            }
        }

        //public bool InsertarJusticante(TblJustificante _TBL_Just)
        //{
        //    bool respuesta = false;
        //    try
        //    {
        //        contexto.TblJustificante.InsertOnSubmit(_TBL_Just);
        //        contexto.SubmitChanges();
        //        respuesta = true;

        //    }
        //    catch (Exception ex)
        //    {
        //        System.Console.WriteLine(ex.ToString());
        //        respuesta = false;

        //    }
        //    return respuesta;

        //}
    }
}
