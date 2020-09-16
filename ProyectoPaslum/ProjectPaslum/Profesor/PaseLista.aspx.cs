using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using MessagingToolkit.QRCode.Codec;
using Controller;
using Modelo;

namespace ProjectPaslum.Profesor
{
    public partial class PaseLista : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    lbId.Text = Session["id"].ToString();
                    LlenarCarrera(Convert.ToInt32(Session["id"].ToString()));
                    LlenarGrupo(Convert.ToInt32(Session["id"].ToString()));
                    loadDrop(Convert.ToInt32(Session["id"].ToString()));
                }
            }                      
        }
        private void LlenarCarrera(int idProfe)
        {
            try
            {
                var car = (from ag in contexto.TblAsignacionGrupo
                           join g in contexto.TblGrupo
                           on ag.idGrupo equals g.id
                           join am in contexto.TblAsignacionMateria 
                           on ag.idAsignacionMateria equals am.id
                           join p in contexto.TblProfesor 
                           on am.idProfesor equals p.id
                           join m in contexto.TblMateria 
                           on am.idMateria equals m.id
                           join c in contexto.TblCarrera 
                           on g.idCarrera equals c.id
                           where p.id == idProfe
                           select c).ToList();

                ddlCarrera.Items.Add("Seleccionar");
                ddlCarrera.DataSource = car;
                ddlCarrera.DataValueField = "id";
                ddlCarrera.DataTextField = "strNombre";
                ddlCarrera.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void LlenarGrupo(int idProfe)
        {
            var grupo = (from asgr in contexto.TblAsignacionGrupo
                         join asmat in contexto.TblAsignacionMateria
                         on asgr.idAsignacionMateria equals asmat.id
                         join gru in contexto.TblGrupo
                         on asgr.idGrupo equals gru.id
                         where asmat.idProfesor == idProfe
                         select gru).ToList();
            ddlGrupo.DataSource = grupo;
            ddlGrupo.DataValueField = "id";
            ddlGrupo.DataTextField = "strNombre";
            ddlGrupo.DataBind();
            ddlGrupo.Items.Insert(0, new ListItem("Seleccionar", "0"));
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
        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            var random = new Random();
            var value = random.Next(0, 999999999);
            var carrera = ddlCarrera.SelectedValue;
            var grupo = ddlGrupo.SelectedValue;
            var materia = ddlMateria.SelectedValue;
            var parcial = ddlParcial.SelectedValue;
            DateTime fechact = DateTime.Now;

            QRCodeEncoder encoder = new QRCodeEncoder();
            Bitmap img = encoder.Encode(value.ToString());
            System.Drawing.Image QR = (System.Drawing.Image)img;

            using (MemoryStream ms = new MemoryStream())
            {
                QR.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                byte[] imageBytes = ms.ToArray();
                imgCtrl.Src = "data:image/gif;base64," + Convert.ToBase64String(imageBytes);
                imgCtrl.Height = 300;
                imgCtrl.Width = 300;
            }

            TblQR qr = new TblQR();
            qr.qr = value.ToString();
            qr.fecha = fechact;
            qr.idCarrera = int.Parse(carrera);
            qr.idGrupo = int.Parse(grupo);
            qr.idAsignacion = int.Parse(materia);
            qr.idProfesor = Int32.Parse(lbId.Text);
            qr.idParcial = int.Parse(parcial);
            ControllerQr ctrlQr = new ControllerQr();
            ctrlQr.InsertarQr(qr);


        }

        protected void ddlMateria_SelectedIndexChanged(object sender, EventArgs e)
        {
            ControllerEvaluacion CtrlAsignarE = new ControllerEvaluacion();
            var evaluacion = CtrlAsignarE.ConsultaParciales();
            ddlParcial.Items.Add("Seleccionar");
            ddlParcial.DataSource = evaluacion;
            ddlParcial.DataValueField = "id";
            ddlParcial.DataTextField = "strNombre";
            ddlParcial.DataBind();
        }
    }
}