using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Alumno
{
    public partial class DatosEscolares : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrera"] != null)
            {
                TxtCarrera.Text = Session["carrera"].ToString();
                lbGrupo.Text = Session["forGrupo"].ToString();
            }
        }
    }
}