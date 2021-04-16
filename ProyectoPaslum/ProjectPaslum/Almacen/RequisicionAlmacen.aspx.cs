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
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbEmpleado.Text = (Session["id"].ToString());
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
            Response.Redirect("/Almacen/RequisicionAlmacen.aspx");
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
                    DateTime fechact = DateTime.Now;

                    DataList2.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList2.SelectedItem.FindControl("idVentaLabel")).Text;

                    var Productos = (from prod in contexto.tblDetalleVenta
                                     where prod.fkVenta == Int32.Parse(cod)
                                     select prod);

                    foreach (tblDetalleVenta det in Productos)
                    {

                        var cantidadExistente = (from existe in contexto.tblStock
                                                 where existe.fkProducto == det.fkProducto
                                                 select existe);

                        var existente = (from existe in contexto.tblStock
                                         where existe.fkProducto == det.fkProducto
                                         select existe).FirstOrDefault();


                        if (existente == null)
                        {
                            Response.Redirect("/Almacen/AlertaFallo.aspx");
                        }
                        else
                        {
                            foreach (tblStock ord in cantidadExistente)
                            {
                                var resta = ord.dblCantidad - det.intCantidad;

                                if (resta >= 0)
                                {

                                    tblMovimiento mov = new tblMovimiento();
                                    mov.strTipo = "VENTA NUMERO " + cod;
                                    mov.fecha = fechact;
                                    mov.dblValAnt = ord.dblCantidad;
                                    mov.dblValNvo = resta;
                                    mov.fkStock = ord.idStock;
                                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);
                                    mov.strNumVen = cod;
                                    mov.strFactura = "";

                                    ctrlAlm.InsertarMovimientoAlmacen(mov);
                                    ord.dblCantidad = resta;
                                    contexto.SubmitChanges();
                                    Response.Redirect("/Almacen/AlertaExito.aspx");
                                }
                                else
                                {
                                    Response.Redirect("/Almacen/AlertaAlerta.aspx");
                                }
                            }


                        }
                    }


                    ven.idVenta = Convert.ToInt32(cod);
                    ven.strEstado = "FINALIZAR";

                    ctrlAlm.EditarFinalizado(ven);


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

            Response.Redirect("/Almacen/RequisicionAlmacen.aspx");

        }

        //protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        //{
        //    string cod;
        //    if (e.CommandName == "Seleccionar")
        //    {
        //        DataList3.SelectedIndex = e.Item.ItemIndex;

        //        cod = ((Label)this.DataList3.SelectedItem.FindControl("idVentaLabel")).Text;
        //        Session["desgloce"] = cod;

        //        Response.Redirect("/Almacen/DesgloceRequisicionAlmacen.aspx");
        //    }

        //    else if (e.CommandName == "Finalizar")
        //    {

        //        string confirmValue = Request.Form["confirm_value"];

        //        if (confirmValue == "Si")
        //        {
        //            ControllerAlmacen ctrlAlm = new ControllerAlmacen();
        //            tblVenta ven = new tblVenta();

        //            DataList3.SelectedIndex = e.Item.ItemIndex;

        //            cod = ((Label)this.DataList3.SelectedItem.FindControl("idVentaLabel")).Text;
        //            ven.idVenta = Convert.ToInt32(cod);
        //            ven.strEstado = "EN PROCESO";

        //            ctrlAlm.EditarProceso(ven);
        //            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se regreso la requisición al estado en proceso')", true);

        //        }
        //        else
        //        {

        //            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Se cancelo la finalización de la requisición')", true);
        //        }
               
        //    }
        //    Response.Redirect("/Almacen/RequisicionAlmacen.aspx");
        //}

        protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            if (e.CommandName == "Seleccionar")
            {
                DataList4.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList4.SelectedItem.FindControl("idVentaLabel")).Text;
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

                    DataList4.SelectedIndex = e.Item.ItemIndex;

                    cod = ((Label)this.DataList4.SelectedItem.FindControl("idVentaLabel")).Text;
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
            Response.Redirect("/Almacen/RequisicionAlmacen.aspx");
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            
            if (e.CommandName == "Seleccionar")
            {
                
                Label cod = (Label)e.Item.FindControl("idVentaLabel");

                string var = Convert.ToString(cod.Text);

                Session["desgloce"] = var;

                Response.Redirect("/Almacen/DesgloceRequisicionAlmacen.aspx");
            }

            
        }
    }
}