﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPaslum.Venta
{
    public partial class PrincipalVendedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                DateTime dt = DateTime.Now;
                DateTime wkStDt = DateTime.MinValue;
                wkStDt = dt.AddDays(1 - Convert.ToDouble(dt.DayOfWeek));
                DateTime fechadesdesemana = wkStDt.Date;

                DateTime DOMINGO = DateTime.MaxValue;
                DOMINGO = dt.AddDays(7 - Convert.ToDouble(dt.DayOfWeek));
                DateTime DomingoSemana = DOMINGO.Date;



                lbLunes.Text = fechadesdesemana.ToString("yyyy-MM-dd");
                lbDomingo.Text = DomingoSemana.ToString("yyyy-MM-dd");
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }

        }

        protected void ListVentaHoy_ItemCommand(object source, DataListCommandEventArgs e)
        {
            ListVentaHoy.SelectedIndex = e.Item.ItemIndex;            

            string cod;
            string estado = ((Label)this.ListVentaHoy.SelectedItem.FindControl("strEstadoLabel")).Text;


            if (e.CommandName == "Seleccionar")
            {
                if (estado == "CREDITO")
                {

                    cod = ((Label)this.ListVentaHoy.SelectedItem.FindControl("idVentaLabel")).Text;
                    Session["desgloce"] = cod;

                    Response.Redirect("/Venta/DesgloceHistorialAbono.aspx");
                }
                else
                {                   
       
                    cod = ((Label)this.ListVentaHoy.SelectedItem.FindControl("idVentaLabel")).Text;
                    Session["desgloce"] = cod;

                    Response.Redirect("/Venta/DesgloceRequisicionVenta.aspx");
                }
                
            }
            
        }
    }
}