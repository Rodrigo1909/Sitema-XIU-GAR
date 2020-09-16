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
    public partial class Evaluaciones : System.Web.UI.Page
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
                    this.LlenarParcial();
                }
                
                alertError.Visible = false;
                alertBien.Visible = false;
            }
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


        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            var mat = ddlMateria.SelectedValue;

            var porc = (from por in contexto.TblCatalogoParcial
                        where por.idAsignacionMaeria == Convert.ToInt32(ddlMateria.SelectedValue)
                        select por.intPorcentaje).Sum();

            var suma = porc+ Int32.Parse(TxtPorcentaje.Text);

            
            /*porc = Int32.Parse(lbAcumulado.ToString());*/


                if (suma >= 101)
                {
                    alertError.Visible = true;
                }
                else
                {

                    TblCatalogoParcial parcial = new TblCatalogoParcial();
                    parcial.strNombre = TxtNombre.Text.ToUpper();
                    parcial.strDescripcion = TxtDescripcion.Text.ToUpper();
                    parcial.intPorcentaje = Int32.Parse(TxtPorcentaje.Text);
                    parcial.idAsignacionMaeria = int.Parse(mat);
                    ControllerParcial ctrlParcial = new ControllerParcial();
                    ctrlParcial.InsertarParcial(parcial);
                    alertBien.Visible = true;
                
            }

            this.Response.Redirect("./Evaluaciones.aspx", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var par = ddlParcial.SelectedValue;

            TblCatalogoEvaluacion asignacion = new TblCatalogoEvaluacion();
            asignacion.idCatalogoParcial = int.Parse(par);
            asignacion.strDescripcion = TxtDescripcionActividad.Text.ToUpper();
            ControllerEvaluacion ctrlAsig = new ControllerEvaluacion();
            ctrlAsig.InsertarEvaluacion(asignacion);
            this.Response.Redirect("./Evaluaciones.aspx", true);
        }

        protected void LlenarParcial()
        {
            ControllerEvaluacion CtrlAsignarE = new ControllerEvaluacion();
            var evaluacion = CtrlAsignarE.ConsultaParciales();
            ddlParcial.Items.Add("Seleccionar");
            ddlParcial.DataSource = evaluacion;
            ddlParcial.DataValueField = "id";
            ddlParcial.DataTextField = "strNombre";
            ddlParcial.DataBind();

        }

        protected void ddlMateria_SelectedIndexChanged(object sender, EventArgs e)
        {
              
               //porc = Convert.ToInt32(lbPorcentaje.Text);
        }
    }
}