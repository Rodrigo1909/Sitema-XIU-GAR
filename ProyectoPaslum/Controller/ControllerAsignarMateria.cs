using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerAsignarMateria
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarAsignacionMateria(TblAsignacionMateria _TBL_AsigMateria)
        {
            bool respuesta = false;
            try
            {
                contexto.TblAsignacionMateria.InsertOnSubmit(_TBL_AsigMateria);
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
       
        public object ConsultaProfesor()
        {
            return contexto.TblProfesor
                .Select(p => new
                {
                    id = p.id,
                    strNombre = (p.strNombre + " " + p.strApellidoP + " " + p.strApellidoM).ToUpper()
                })
                .ToList();
        }

        public List<TblMateria> ConsultaMateria()
        {
            return contexto.TblMateria.ToList<TblMateria>();
        }
    }
}
