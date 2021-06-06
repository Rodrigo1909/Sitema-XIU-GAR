using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using System.Data;

namespace ProjectPaslum.Venta
{
    public partial class CreditoVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        DataTable dtb;
        DataTable carrito = new DataTable();

        public void CargarDetalle()
        {
            if (Session["credito"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("strNombre", System.Type.GetType("System.String"));
                //dtb.Columns.Add("dblPrecio", System.Type.GetType("System.Double"));
                //dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("preVenta", System.Type.GetType("System.Double"));
                dtb.Columns.Add("dblCosto", System.Type.GetType("System.Double"));
                //dtb.Columns.Add("intPresentacion", System.Type.GetType("System.Int32"));
                //dtb.Columns.Add("strNombre1", System.Type.GetType("System.String"));

                Session["credito"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["credito"] = Session["prueba"];
            }


        }

        public void AgregarItem(string cod, string des)
        {
            int cantidad = 1;
            decimal precio2 = 0;
            decimal costo = 0;

            carrito = (DataTable)Session["credito"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = (int)cantidad;
            fila[3] = (double)precio2;
            fila[4] = (double)costo;

            carrito.Rows.Add(fila);
            Session["credito"] = carrito;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    txtVendedor.Text = (Session["CompletoNombre"].ToString());
                    //lbEmpleado.Text = (Session["id"].ToString());                    
                    this.LlenarCliente();

                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
            }
            if (Page.IsPostBack == false)
            {
                CargarDetalle();                
            }
        }

        private void LlenarCliente()
        {
            var clie = (from cli in contexto.tblCliente
                        select new { nombre = cli.strNombre + " " + cli.strApellidoP + " " + cli.strApellidoM, id = cli.idCliente }).ToList();

            ddlCliente.Items.Add("SELECCIONAR");
            ddlCliente.DataValueField = "id";
            ddlCliente.DataTextField = "nombre";
            ddlCliente.DataSource = clie;
            ddlCliente.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Session["domicilio"] = ddlDomicilio.SelectedValue;
            Session["cliente"] = ddlCliente.SelectedValue;
            Session["FechaCredito"] = calFin.Text;
            Response.Redirect("CobrarCreditoVenta.aspx", true);
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDomicilio.Items.Clear();
            ddlLugar.Items.Clear();

            var cliente = (from cli in contexto.tblCliente

                               join dom in contexto.tblDireccion
                               on cli.fkDireccion
                               equals dom.idDireccion

                               where cli.idCliente == Convert.ToInt32(ddlCliente.SelectedValue)
                               select new { colonia = dom.strColonia + ", " + dom.strCalle + ", " + dom.intCodpost, establecimiento = cli.strEstablecimiento }).ToList();

                ddlDomicilio.DataValueField = "colonia";
                ddlDomicilio.DataTextField = "colonia";
                ddlDomicilio.DataSource = cliente;
                ddlDomicilio.DataBind();

                ddlLugar.DataValueField = "establecimiento";
                ddlLugar.DataTextField = "establecimiento";
                ddlLugar.DataSource = cliente;
                ddlLugar.DataBind();
            }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            
            if (e.CommandName == "Seleccionar")
            {
                DataList2.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList2.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList2.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList2.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList2.SelectedItem.FindControl("strNombre1Label")).Text;
                
                AgregarItem(cod, des);

                
                //Session["prueba"] = "Sesión usuario prueba";
            }

        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;

            if (e.CommandName == "Seleccionar")
            {
                DataList3.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList3.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList3.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList3.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList3.SelectedItem.FindControl("strNombre1Label")).Text;
                
                AgregarItem(cod, des);               
               
            }
        }

        protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                DataList4.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList4.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList4.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList4.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList4.SelectedItem.FindControl("strNombre1Label")).Text;
                
                AgregarItem(cod, des);
            }
        }

        protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;

            if (e.CommandName == "Seleccionar")
            {
                DataList5.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList5.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList5.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList5.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList5.SelectedItem.FindControl("strNombre1Label")).Text;
                
                AgregarItem(cod, des);
            }
        }

        protected void DataList6_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;

            if (e.CommandName == "Seleccionar")
            {
                DataList6.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList6.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList6.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList6.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList6.SelectedItem.FindControl("strNombre1Label")).Text;
                
                AgregarItem(cod, des);            
            }
        }


    }
}