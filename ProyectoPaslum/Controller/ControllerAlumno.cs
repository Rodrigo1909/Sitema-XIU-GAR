using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controller
{
    public class ControllerAlumno
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        public bool InsertarAlum(TblAlumno _TBL_Alum)
        {
            bool respuesta = false;
            try
            {
                contexto.TblAlumno.InsertOnSubmit(_TBL_Alum);
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

        public List<TblCarrera> ConsultaCarrera()
        {
            return contexto.TblCarrera.ToList<TblCarrera>();
        }

        public List<TblCuatri> ConsultaCuatri()
        {
            return contexto.TblCuatri.ToList<TblCuatri>();
        }
        public void Editar(TblAlumno alum, TblTelefono tel, TblDireccion dom)
        {
            TblAlumno alumBd = contexto.TblAlumno
                .Where(t => t.id == alum.id).FirstOrDefault();
            if (alumBd != null)
            {
                alumBd.strCorreo = alum.strCorreo;
                contexto.SubmitChanges();
            }   

            TblTelefono telBd = contexto.TblTelefono
                .Where(t => t.id == tel.id).FirstOrDefault();
            if (telBd != null)
            {
                telBd.strcelular = tel.strcelular;
                telBd.strtelCasa = tel.strtelCasa;
                telBd.strotro = tel.strotro;
                contexto.SubmitChanges();
            }

            TblDireccion domBd = contexto.TblDireccion
                .Where(t => t.id == dom.id).FirstOrDefault();
            if (domBd != null)
            {
                domBd.strcalle = dom.strcalle;
                domBd.strcolonia = dom.strcolonia;
                domBd.strmunicipio = dom.strmunicipio;
                contexto.SubmitChanges();
            }
        }

        public bool InsertarJusticante(TblJustificante _TBL_Just)
        {
            bool respuesta = false;
            try
            {
                contexto.TblJustificante.InsertOnSubmit(_TBL_Just);
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



