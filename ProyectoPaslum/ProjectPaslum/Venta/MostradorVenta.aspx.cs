using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

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
    }
    }
