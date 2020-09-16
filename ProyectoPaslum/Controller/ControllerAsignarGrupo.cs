using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;


namespace Controller
{
    public class ControllerAsignarGrupo
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarAsignacionGrupo(TblAsignacionGrupo _TBL_AsigGrupo)
        {
            bool respuesta = false;
            try
            {
                contexto.TblAsignacionGrupo.InsertOnSubmit(_TBL_AsigGrupo);
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


        public List<TblGrupo> ConsultaGrupo()
        {
            return contexto.TblGrupo.ToList<TblGrupo>();
        }
        public object ConsultaAsigMateria()
        {
            return contexto.TblAsignacionMateria
                .Select(p => new
                {
                    id = p.id,
                    strNombre = (p.id)
                })
                .ToList();
        }
    }
}
    