using ProjectPaslum.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;

namespace ProjectPaslum.Almacen
{
    public partial class RequisicionAlmacen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Response.Redirect("/Almacen/RequisicionAlmacen.aspx");
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

                Response.Redirect("/Almacen/DesgloceRequisicionAlmacen.aspx");
            }
            else if (e.CommandName == "Finalizar")
            {
                
                string confirmValue = Request.Form["confirm_value"];

                if (confirmValue == "Si")
                {
                    ControllerAlmacen ctrlAlm = new ControllerAlmacen();
                    tblVenta ven = new tblVenta();

                    DataList1.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList1.SelectedItem.FindControl("idVentaLabel")).Text;
                    ven.idVenta = Convert.ToInt32(cod);
                    ven.strEstado = "EN PROCESO";

                    ctrlAlm.EditarProceso(ven);
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se puso en proceso la requisición')", true);

                }
                else
                {
                    
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se cancelo la continuidad de la requisición')", true);
                }

                


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

                Response.Redirect("/Almacen/DesgloceRequisicionAlmacen.aspx");
            }

            else if (e.CommandName == "Finalizar")
            {

                string confirmValue = Request.Form["confirm_value"];

                if (confirmValue == "Si")
                {
                    ControllerAlmacen ctrlAlm = new ControllerAlmacen();
                    tblVenta ven = new tblVenta();

                    DataList2.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList2.SelectedItem.FindControl("idVentaLabel")).Text;
                    ven.idVenta = Convert.ToInt32(cod);
                    ven.strEstado = "FINALIZAR";

                    ctrlAlm.EditarFinalizado(ven);
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se finalizo la requisición')", true);

                }
                else
                {

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se cancelo la finalización de la requisición')", true);
                }

                


            }

            else if (e.CommandName == "Pendiente")
            {

                string confirmValue = Request.Form["confirm_value"];

                if (confirmValue == "Si")
                {
                    ControllerAlmacen ctrlAlm = new ControllerAlmacen();
                    tblVenta ven = new tblVenta();

                    DataList2.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList2.SelectedItem.FindControl("idVentaLabel")).Text;
                    ven.idVenta = Convert.ToInt32(cod);
                    ven.strEstado = "PENDIENTE";

                    ctrlAlm.EditarPendiente(ven);
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se regreso a estado PENDIENTE la requisición')", true);

                }
                else
                {

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se cancelo la finalización de la requisición')", true);
                }

                


            }

        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList3.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList3.SelectedItem.FindControl("idVentaLabel")).Text;
                Session["desgloce"] = cod;

                Response.Redirect("/Almacen/DesgloceRequisicionAlmacen.aspx");
            }

            else if (e.CommandName == "Finalizar")
            {

                string confirmValue = Request.Form["confirm_value"];

                if (confirmValue == "Si")
                {
                    ControllerAlmacen ctrlAlm = new ControllerAlmacen();
                    tblVenta ven = new tblVenta();

                    DataList3.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList3.SelectedItem.FindControl("idVentaLabel")).Text;
                    ven.idVenta = Convert.ToInt32(cod);
                    ven.strEstado = "EN PROCESO";

                    ctrlAlm.EditarProceso(ven);
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se regreso la requisición al estado en proceso')", true);

                }
                else
                {

                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se cancelo la finalización de la requisición')", true);
                }

                


            }
        }
    }
}