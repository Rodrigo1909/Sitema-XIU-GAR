using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Venta
{
    public partial class LineaVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            tblVenta ven = new tblVenta();
            ven.strEstado = "COMPLETA";
            contexto.SubmitChanges();
        }
    }
}