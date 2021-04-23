using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Venta
{
    public partial class MostradorVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        DataTable dtb;
        DataTable carrito = new DataTable();

        public void CargarDetalle()
        {
            if (Session["contado"] == null)
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

                Session["contado"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["contado"] = Session["prueba"];
            }


        }

        public void AgregarItem(string cod, string des/*, double precio*/)
        {
            //double total;
            //int cantidad = 1;
            //decimal precio2 = 0;
            //decimal costo = 0;
            //total = precio * cantidad;
            //carrito = (DataTable)Session["contado"];
            //DataRow fila = carrito.NewRow();
            //fila[0] = cod;
            //fila[1] = des;
            //fila[2] = precio;
            //fila[3] = (int)cantidad;
            //fila[4] = total;
            //fila[5] = (double)precio2;
            //fila[6] = (double)costo;

            
            int cantidad = 1;
            decimal precio2 = 0;
            decimal costo = 0;
            
            carrito = (DataTable)Session["contado"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;            
            fila[2] = (int)cantidad;            
            fila[3] = (double)precio2;
            fila[4] = (double)costo;

            carrito.Rows.Add(fila);
            Session["contado"] = carrito;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    txtVendedor.Text = (Session["CompletoNombre"].ToString());                                   
                    this.LlenarCliente();

                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
                else
                {
                    Response.Redirect("../IndexPaslum.aspx", true);
                }
            }
            if (Page.IsPostBack == false)
            {
                CargarDetalle();
                //lblAgregado.Text = "";
            }
        }

        private void LlenarCliente()
        {


            var clie = (from cli in contexto.tblCliente
                           select new { nombre = cli.strNombre + " " + cli.strApellidoP + " " + cli.strApellidoM, id = cli.idCliente }).ToList();

            ddlCliente.Items.Add("MOSTRADOR");            
            ddlCliente.DataValueField = "id";
            ddlCliente.DataTextField = "nombre";
            ddlCliente.DataSource = clie;
            ddlCliente.DataBind();

            ddlDomicilio.Items.Add("Oficina XIU-GAR");
            ddlBodega.Items.Add("No aplica");
            ddlLugar.Items.Add("Oficina XIU-GAR");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Session["domicilio"] = ddlDomicilio.SelectedValue;
            Session["cliente"] = ddlCliente.SelectedValue;
            Response.Redirect("CobrarVenta.aspx", true);
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDomicilio.Items.Clear();
            ddlLugar.Items.Clear();
            ddlBodega.Items.Clear();

            if (ddlCliente.SelectedValue != "MOSTRADOR") { 
            var cliente = (from cli in contexto.tblCliente

                            join dom in contexto.tblDireccion
                            on cli.fkDireccion
                            equals dom.idDireccion

                            where cli.idCliente == Convert.ToInt32(ddlCliente.SelectedValue)
                            select new { colonia = dom.strColonia + ", " + dom.strCalle + ", " + dom.intCodpost, bodega = cli.strNumeroBodega , establecimiento = cli.strEstablecimiento }).ToList();

            ddlDomicilio.DataValueField = "colonia";
            ddlDomicilio.DataTextField = "colonia";
            ddlDomicilio.DataSource = cliente;
            ddlDomicilio.DataBind();

            ddlBodega.DataValueField = "bodega";
            ddlBodega.DataTextField = "bodega";
            ddlBodega.DataSource = cliente;
            ddlBodega.DataBind();

            ddlLugar.DataValueField = "establecimiento";
            ddlLugar.DataTextField = "establecimiento";
            ddlLugar.DataSource = cliente;
            ddlLugar.DataBind();
            }
            else
            {
                ddlBodega.Items.Add("No aplica");

                ddlDomicilio.Items.Add("Oficina XIU-GAR");

                ddlLugar.Items.Add("Oficina XIU-GAR");
            }

        }        

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;//, uni = null;
            //double precio = 0;
            //int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList2.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList2.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList2.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList2.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList2.SelectedItem.FindControl("strNombre1Label")).Text ;
                //precio = double.Parse(((Label)this.DataList2.SelectedItem.FindControl("dblPrecioLabel")).Text);
                //pres = int.Parse(((Label)this.DataList2.SelectedItem.FindControl("intPresentacionLabel")).Text);
                //uni = ((Label)this.DataList2.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des/*, precio, pres, uni*/);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;//, uni = null;
            //double precio = 0;
            //int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList3.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList3.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList3.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList3.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList3.SelectedItem.FindControl("strNombre1Label")).Text;
                //precio = double.Parse(((Label)this.DataList3.SelectedItem.FindControl("dblPrecioLabel")).Text);
                //pres = int.Parse(((Label)this.DataList3.SelectedItem.FindControl("intPresentacionLabel")).Text);
                //uni = ((Label)this.DataList3.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des/*, precio, pres, uni*/);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;//, uni = null;
            //double precio = 0;
            //int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList4.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList4.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList4.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList4.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList4.SelectedItem.FindControl("strNombre1Label")).Text;
                //precio = double.Parse(((Label)this.DataList4.SelectedItem.FindControl("dblPrecioLabel")).Text);
                //pres = int.Parse(((Label)this.DataList4.SelectedItem.FindControl("intPresentacionLabel")).Text);
                //uni = ((Label)this.DataList4.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des/* precio, pres, uni*/);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;//, uni = null;
            //double precio = 0;
            //int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList5.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList5.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList5.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList5.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList5.SelectedItem.FindControl("strNombre1Label")).Text;
                //precio = double.Parse(((Label)this.DataList5.SelectedItem.FindControl("dblPrecioLabel")).Text);
                //pres = int.Parse(((Label)this.DataList5.SelectedItem.FindControl("intPresentacionLabel")).Text);
                //uni = ((Label)this.DataList5.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des/*, precio, pres, uni*/);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void DataList6_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;//, uni = null;
            //double precio = 0;
            //int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList6.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList6.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList6.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList6.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList6.SelectedItem.FindControl("strNombre1Label")).Text;
                //precio = double.Parse(((Label)this.DataList6.SelectedItem.FindControl("dblPrecioLabel")).Text);
                //pres = int.Parse(((Label)this.DataList6.SelectedItem.FindControl("intPresentacionLabel")).Text);
                //uni = ((Label)this.DataList6.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des/*, precio, pres, uni*/);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }
    }
    }
