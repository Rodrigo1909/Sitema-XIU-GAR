using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;


namespace ProjectPaslum.Alumno
{
    public partial class Alumno : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUPArchivo.HasFile)
            {
                string path = Server.MapPath("~/images/AlumRegistrado/" + FileUPArchivo.FileName);
                FileUPArchivo.SaveAs(path);

                DateTime fechact = DateTime.Now;

                TblJustificante just = new TblJustificante();
                just.strMotivo = txtMotivo.Text.ToUpper();
                just.fechaJusti = DateTime.Parse(fechajus.Text);
                just.strArchivo = path;
                just.fecha = fechact;
                ControllerAlumno ctrlAlum = new ControllerAlumno();
                ctrlAlum.InsertarJusticante(just);                
            }
            this.Response.Redirect("./PrincipalAlumno.aspx", true);
        }
    }
}