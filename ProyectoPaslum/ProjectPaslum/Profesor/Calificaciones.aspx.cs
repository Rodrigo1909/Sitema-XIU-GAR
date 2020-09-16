using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Profesor
{
    public partial class Calificaciones : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    lbProfe.Text = Session["id"].ToString();
                    loadDrop(Convert.ToInt32(Session["id"].ToString()));
                    //loadGridItems(Convert.ToInt32(Session["id"].ToString()));
                }
            }

        }

        //private void loadGridItems(int idPadre)
        //{
        //    var parcial = (from par in contexto.TblCatalogoParcial where par.idAsignacionMaeria == Convert.ToInt32(ddlMateria.SelectedValue) select par).FirstOrDefault();
        //    var grupo = (from grup in contexto.TblAsignacionGrupo where grup.idAsignacionMateria == Convert.ToInt32(ddlMateria.SelectedValue) select grup).FirstOrDefault();

        //    try
        //    {
        //        GridView2.DataSource = contexto.TblCalificacion
        //            .Where(c => c.idCatalogoParcial == parcial)
        //            .Select(n => new
        //            {
        //                Nombre = n.strNombre.ToUpper(),
        //                ApellidoP = n.strApellidoP.ToUpper(),
        //                ApellidoM = n.strApellidoM.ToUpper(),
        //                Edad = n.intEdad,
        //                Sexo = n.strSexo.ToUpper(),
        //                Alergias = n.strAlergia.ToUpper(),
        //                Usuario = n.TblUser != null ? n.TblUser.strusuario : String.Empty,
        //                Contraseña = n.TblUser != null ? n.TblUser.strpass : String.Empty

        //            })
        //            .ToList();
        //        GridView2.DataBind();
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}

        private void loadDrop(int idProfe)
        {
            try
            {
                var gfg = (from am in contexto.TblAsignacionMateria
                           join m in contexto.TblMateria
                           on am.idMateria equals m.id
                           join p in contexto.TblProfesor on am.idProfesor equals p.id
                           where p.id == idProfe
                           select m).ToList();

                ddlMateria.DataValueField = "id";
                ddlMateria.DataTextField = "strNombre";
                ddlMateria.DataSource = gfg;
                ddlMateria.DataBind();
                ddlMateria.Items.Insert(0, new ListItem("Seleccionar", "0"));
            }
            catch (Exception)
            {

                throw;
            }
        }


        protected void ddlMateria_SelectedIndexChanged(object sender, EventArgs e)
        {
            var parcial = (from par in contexto.TblCatalogoParcial where par.idAsignacionMaeria == Convert.ToInt32(ddlMateria.SelectedValue) select par).ToList();
            ddlParcial.Items.Add("Seleccionar");
            ddlParcial.DataSource = parcial;
            ddlParcial.DataValueField = "id";
            ddlParcial.DataTextField = "strNombre";
            ddlParcial.DataBind();

            var grupo = (from grup in contexto.TblAsignacionGrupo where grup.idAsignacionMateria == Convert.ToInt32(ddlMateria.SelectedValue) select grup).ToList();
            ddlGrupo.Items.Add("Seleccionar");
            ddlGrupo.DataSource = parcial;
            ddlGrupo.DataValueField = "id";
            ddlGrupo.DataTextField = "id";
            ddlGrupo.DataBind();
        }


    }
}