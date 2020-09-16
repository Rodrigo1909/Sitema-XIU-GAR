using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using Modelo;

namespace ProjectPaslum.Profesor
{
    public partial class NotaInfo : System.Web.UI.Page
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
                }
            }
        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            var carrera = ddlMateria.SelectedValue;
            DateTime fechact = DateTime.Now;

            TblNota nota = new TblNota();
            nota.strTitulo = txtTitulo.Text.ToUpper();
            nota.strDescripcion = txtDescripcion.Text.ToUpper();
            nota.fecha = fechact;
            nota.idMateria = int.Parse(carrera);
            nota.idProfesor = int.Parse(lbProfe.Text);
            ControllerMaestro ctrlGrupo = new ControllerMaestro();
            ctrlGrupo.InsertarNota(nota);
            this.Response.Redirect("./NotaInfo.aspx", true);


        }
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
    }
}