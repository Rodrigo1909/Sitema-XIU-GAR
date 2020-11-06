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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    txtVendedor.Text = (Session["CompletoNombre"].ToString());
                    //lbEmpleado.Text = (Session["id"].ToString());
                    this.LlenarAlmacen();
                    this.LlenarCliente();

                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
            }
        }

        private void LlenarAlmacen()
        {
            ControllerAlmacen CtrlAlmacen = new ControllerAlmacen();
            List<tblAlmacen> almacen = CtrlAlmacen.ConsultaAlmacen();
            ddlAlmacen.Items.Add("Seleccionar");
            ddlAlmacen.DataSource = almacen;
            ddlAlmacen.DataValueField = "idAlmacen";
            ddlAlmacen.DataTextField = "strNombre";
            ddlAlmacen.DataBind();

        }
        private void LlenarCliente()
        {
            ControllerCliente CtrlACliente = new ControllerCliente();
            List<tblCliente> cliente = CtrlACliente.ConsultaCliente();
            ddlCliente.Items.Add("MOSTRADOR");
            ddlCliente.DataSource = cliente;
            ddlCliente.DataValueField = "idCliente";
            ddlCliente.DataTextField = "strNombre";
            ddlCliente.DataBind();

            ddlDomicilio.Items.Add("Oficina XIU-GAR");

            ddlLugar.Items.Add("Oficina XIU-GAR");
        }


        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
          
        }

        protected void ddlAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        {
            var producto = (from prod in contexto.tblProducto

                            join alm in contexto.tblAlmacen
                            on prod.fkAlmacen
                            equals alm.idAlmacen

                            where prod.fkAlmacen == Convert.ToInt32(ddlAlmacen.SelectedValue)
                            select new { nombre = prod.strNombre, id = prod.idProducto }).ToList();



            ddlProducto.Items.Add("Seleccionar");
            ddlProducto.DataValueField = "id";
            ddlProducto.DataTextField = "nombre";
            ddlProducto.DataSource = producto;
            ddlProducto.DataBind();
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
    }
    }
