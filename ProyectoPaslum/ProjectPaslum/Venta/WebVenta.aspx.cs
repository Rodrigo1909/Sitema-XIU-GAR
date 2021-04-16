using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Venta
{
    public partial class WebVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;

                Response.Redirect("/Venta/DesgloceRequisicionVenta.aspx");
            }
            
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList2.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList2.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;

                Response.Redirect("/Venta/DesgloceRequisicionVenta.aspx");
            }
        }



        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Seleccionar")
            {

                Label cod = (Label)e.Item.FindControl("idVentaLabel");

                string var = Convert.ToString(cod.Text);

                Session["desgloce"] = var;

                Response.Redirect("/Venta/DesgloceRequisicionVenta.aspx");
            }
        }
    }
}