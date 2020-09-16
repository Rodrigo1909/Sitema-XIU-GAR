using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Modelo;

namespace ProjectPaslum.Alumno
{
    public partial class ListaAsistencia : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    lbAlumno.Text = Session["id"].ToString();
                    loadDrop(Convert.ToInt32(Session["id"].ToString()));
                }
            }
        }

        private void loadDrop(int idAlumno)
        {
            //try
            //{
                //var gfg = (from asis in contexto.TblAsistencia
                //           join al in contexto.TblAlumno
                //           on asis.idAlumno equals al.id
                //           join ma in contexto.TblMateria 
                //           on asis.idMateria equals ma.id
                //           where asis.dteFecha>=DateTime.Parse(Inicio.Text)
                //           where asis.dteFecha<= DateTime.Parse(Fin.Text)
                //           where al.id == idAlumno
                //           where asis.idMateria == Convert.ToInt32(ddlMateria.SelectedValue)
                //           select asis.idMateria).Count();



            //catch (Exception)
            //{

            //    throw;
            //}
        }
    }
}