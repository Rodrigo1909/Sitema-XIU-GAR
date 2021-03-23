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
            if (Session["pedido"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("strNombre", System.Type.GetType("System.String"));
                dtb.Columns.Add("dblPrecio", System.Type.GetType("System.Double"));
                dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("intPresentacion", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("strNombre1", System.Type.GetType("System.String"));

                Session["pedido"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["pedido"] = Session["prueba"];
            }


        }

        public void AgregarItem(string cod, string des, double precio, int pre, string uni)
        {
            double total;
            int cantidad = 1;
            total = precio * cantidad;
            carrito = (DataTable)Session["pedido"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = precio;
            fila[3] = (int)cantidad;
            fila[4] = total;
            fila[5] = (int)pre;
            fila[6] = uni;

            carrito.Rows.Add(fila);
            Session["pedido"] = carrito;
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

            if (ddlCliente.SelectedValue != "MOSTRADOR") { 
            var cliente = (from cli in contexto.tblCliente

                            join dom in contexto.tblDireccion
                            on cli.fkDireccion
                            equals dom.idDireccion

                            where cli.idCliente == Convert.ToInt32(ddlCliente.SelectedValue)
                            select new { colonia = dom.strColonia + ", " + dom.strCalle + ", " + dom.intCodpost , establecimiento = cli.strEstablecimiento }).ToList();

            ddlDomicilio.DataValueField = "colonia";
            ddlDomicilio.DataTextField = "colonia";
            ddlDomicilio.DataSource = cliente;
            ddlDomicilio.DataBind();

            ddlLugar.DataValueField = "establecimiento";
            ddlLugar.DataTextField = "establecimiento";
            ddlLugar.DataSource = cliente;
            ddlLugar.DataBind();
            }
            else
            {
                ddlDomicilio.Items.Add("Oficina XIU-GAR");

                ddlLugar.Items.Add("Oficina XIU-GAR");
            }

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null, uni = null;
            double precio = 0;
            int pres = 0;
            if (e.CommandName == "Seleccionar")
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList1.SelectedItem.FindControl("idNombreLabel")).Text;
                precio = double.Parse(((Label)this.DataList1.SelectedItem.FindControl("dblPrecioLabel")).Text);
                pres = int.Parse(((Label)this.DataList1.SelectedItem.FindControl("intPresentacionLabel")).Text);
                uni = ((Label)this.DataList1.SelectedItem.FindControl("strNombre1Label")).Text;
                AgregarItem(cod, des, precio, pres, uni);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                //lblAgregado.Text = "Producto Agregado: " + nom + " " + des;
                //Session["prueba"] = "Sesión usuario prueba";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnRegistrar_Click1(object sender, EventArgs e)
        {

        }
    }
    }
