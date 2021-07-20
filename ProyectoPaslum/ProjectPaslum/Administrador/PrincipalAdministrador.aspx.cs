using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace ProjectPaslum
{
    public partial class Principal : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void ListVentaHoy_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                ListVentaHoy.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListVentaHoy.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;

                Response.Redirect("/Administrador/DesgloceAdmin.aspx");
            }
      
            Response.Redirect("/Administrador/PrincipalAdministrador.aspx");
        }
    }
}