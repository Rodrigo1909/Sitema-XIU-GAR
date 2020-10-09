using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Administrador
{
    public partial class UniMedidaAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            tblUnidadMedida UniMed = new tblUnidadMedida();
            UniMed.strNombre = txtNombre.Text.ToUpper();
            UniMed.strAbreviatura = txtPresentacion.Text.ToUpper();
            UniMed.idActivo = 1;

            ControllerUnidadMedida ctrlUniMed = new ControllerUnidadMedida();
            ctrlUniMed.InsertarUnidadMedida(UniMed);
            this.Response.Redirect("./UniMedidaAdmin.aspx", true);
        }
    }
}