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
    public partial class CotizacionVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        DataTable dtb;
        DataTable carrito = new DataTable();

        public void CargarDetalle()
        {
            if (Session["cotizacion"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("strNombre", System.Type.GetType("System.String"));             
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("preVenta", System.Type.GetType("System.Double"));
                dtb.Columns.Add("dblCosto", System.Type.GetType("System.Double"));
                

                Session["cotizacion"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["pedido"] = Session["prueba"];
            }


        }

        public void AgregarItem(string cod, string des)
        {
            int cantidad = 1;
            decimal precio2 = 0;
            decimal costo = 0;

            carrito = (DataTable)Session["cotizacion"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = (int)cantidad;
            fila[3] = (double)precio2;
            fila[4] = (double)costo;

            carrito.Rows.Add(fila);
            Session["cotizacion"] = carrito;
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
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
                }
                else
                {
                    Response.Redirect("../IndexPaslum.aspx", true);
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
                        orderby cli.strNombre ascending
                        select new { nombre = cli.strNombre + " " + cli.strApellidoP + " " + cli.strApellidoM, id = cli.idCliente }).ToList();

            ddlCliente.Items.Add("SELECCIONAR");
            ddlCliente.DataValueField = "id";
            ddlCliente.DataTextField = "nombre";
            ddlCliente.DataSource = clie;
            ddlCliente.DataBind();
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

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Session["domicilio"] = ddlDomicilio.SelectedValue;
            Session["cliente"] = ddlCliente.SelectedValue;
            Response.Redirect("PrintCotizacionVenta.aspx", true);
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                DataList1.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.DataList1.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.DataList1.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.DataList1.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.DataList1.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click1(object sender, EventArgs e)
        {
            Session["domicilio"] = ddlDomicilio.SelectedValue;
            Session["cliente"] = ddlCliente.SelectedValue;
            Response.Redirect("PrintCotizacionVenta.aspx", true);
        }
    }
}