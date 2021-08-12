using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class HistorialAbono : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }




        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;
            }
            Response.Redirect("/Venta/DesgloceHistorialAbono.aspx");
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList2.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList2.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;
            }
            Response.Redirect("/Venta/DesgloceHistorialAbono.aspx");
        }
    }
}