using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using Controller;
using Modelo;


namespace ProjectPaslum.Profesor
{
    public partial class Justificantes : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    //lbId.Text = Session["id"].ToString();
                    //LlenarCarrera(Convert.ToInt32(Session["id"].ToString()));
                    //LlenarGrupo(Convert.ToInt32(Session["id"].ToString()));
                    //loadDrop(Convert.ToInt32(Session["id"].ToString()));
                }
            }

        }

        //private void LlenarCarrera(int idProfe)
        //{
        //    try
        //    {
        //        var car = (from ag in contexto.TblAsignacionGrupo
        //                   join g in contexto.TblGrupo
        //                   on ag.idGrupo equals g.id
        //                   join am in contexto.TblAsignacionMateria
        //                   on ag.idAsignacionMateria equals am.id
        //                   join p in contexto.TblProfesor
        //                   on am.idProfesor equals p.id
        //                   join m in contexto.TblMateria
        //                   on am.idMateria equals m.id
        //                   join c in contexto.TblCarrera
        //                   on g.idCarrera equals c.id
        //                   where p.id == idProfe
        //                   select c).ToList();

        //        ddlCarrera.Items.Add("Seleccionar");
        //        ddlCarrera.DataSource = car;
        //        ddlCarrera.DataValueField = "id";
        //        ddlCarrera.DataTextField = "strNombre";
        //        ddlCarrera.DataBind();
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}

        //private void LlenarGrupo(int idProfe)
        //{
        //    var grupo = (from asgr in contexto.TblAsignacionGrupo
        //                 join asmat in contexto.TblAsignacionMateria
        //                 on asgr.idAsignacionMateria equals asmat.id
        //                 join gru in contexto.TblGrupo
        //                 on asgr.idGrupo equals gru.id
        //                 where asmat.idProfesor == idProfe
        //                 select gru).ToList();
        //    ddlGrupo.DataSource = grupo;
        //    ddlGrupo.DataValueField = "id";
        //    ddlGrupo.DataTextField = "strNombre";
        //    ddlGrupo.DataBind();
        //    ddlGrupo.Items.Insert(0, new ListItem("Seleccionar", "0"));
        //}

        //private void loadDrop(int idProfe)
        //{
        //    try
        //    {
        //        var gfg = (from am in contexto.TblAsignacionMateria
        //                   join m in contexto.TblMateria
        //                   on am.idMateria equals m.id
        //                   join p in contexto.TblProfesor on am.idProfesor equals p.id
        //                   where p.id == idProfe
        //                   select m).ToList();

        //        ddlMateria.DataValueField = "id";
        //        ddlMateria.DataTextField = "strNombre";
        //        ddlMateria.DataSource = gfg;
        //        ddlMateria.DataBind();
        //        ddlMateria.Items.Insert(0, new ListItem("Seleccionar", "0"));
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //}

        protected void abrir_Click(object sender, EventArgs e)
        {
            Process.Start(TextBox1.Text);
        }
    }
}