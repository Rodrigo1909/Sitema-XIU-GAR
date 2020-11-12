﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data;

namespace ProjectPaslum.Cliente
{
    public partial class CarritoCliente : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                cargarcarrito();
                txtCorreo.Text = (Session["correo"].ToString());
                txtCliente.Text = (Session["nombre"].ToString());
                txtFecha.Text = DateTime.Now.Date.ToString().Substring(0, 10);
            }
        }

    

        public void cargarcarrito()
        {
            GridView1.DataSource = Session["pedido"];
            GridView1.DataBind();
            Button1_Click(Button1, null);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i;
            double total = 0, prec, subtotal = 0, igv;
            string cod, desc;
            int cant;

            var items = (DataTable)Session["pedido"];
            //DataRow fila = items.NewRow();
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);
                desc = (GridView1.Rows[i].Cells[2].Text);
                prec = System.Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox1")).Text);
                double prec1 = System.Convert.ToDouble(prec);
                subtotal = cant * prec1;
                GridView1.Rows[i].Cells[5].Text = subtotal.ToString();
                foreach (DataRow dr in items.Rows)
                {
                    if (dr["idProducto"].ToString() == cod.ToString())
                    {
                        dr["canproducto"] = cant;
                        dr["subtotal"] = subtotal;
                    }
                }

                total = total + subtotal;
            }

            igv = total * 0.18;
            subtotal = total - igv;

            lblIGV.Text = igv.ToString("0.00");
            lblSubTotal.Text = subtotal.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");


        }

        public double TotalCarrito(DataTable dt)
        {
            double tot = 0;
            foreach (DataRow item in dt.Rows)
            {
                tot += Convert.ToDouble(item[4]);
            }
            return tot;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Borrar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DataTable ocar = new DataTable();
                ocar = (DataTable)Session["pedido"];
                ocar.Rows[index].Delete();
                lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompraCliente.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        


        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["pedido"];
            dt1.Rows[index].Delete();

            lblTotal.Text = TotalCarrito(dt1).ToString();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            Session["pedido"] = dt1;
            Button1_Click(Button1, null);
        }

        protected void SendEmail(object sender, EventArgs e)
        {



        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}