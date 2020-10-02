using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;
using System.Data.SqlClient;
using System.Data;

namespace ProjectPaslum.Almacen
{
    public partial class EntradaAlmacen : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    txtVendedor.Text = (Session["nombre"].ToString());
                    lbEmpleado.Text = (Session["id"].ToString());
                    this.LlenarAlmacen();
                    this.LlenarProducto();
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

        private void LlenarProducto()
        {
            ControllerAlmacen CtrlAlmacen = new ControllerAlmacen();
            List<tblProducto> producto = CtrlAlmacen.ConsultaProducto();
            ddlProducto.Items.Add("Seleccionar");
            ddlProducto.DataSource = producto;
            ddlProducto.DataValueField = "idProducto";
            ddlProducto.DataTextField = "strNombre";
            ddlProducto.DataBind();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var almacen = ddlAlmacen.SelectedItem.Value;
            var producto = ddlProducto.SelectedItem.Value;
            var movimiento = ddlMovimiento.SelectedItem.Value;
            DateTime fechact = DateTime.Now;
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();

            var cantidadExistente = (from existe in contexto.tblStock
                                    where existe.fkProducto == Int32.Parse(producto)
                                     select existe).FirstOrDefault();

            if (cantidadExistente != null)
            {
                decimal suma;
                suma = cantidadExistente.dblCantidad + Int32.Parse(txtCantidad.Text);
                contexto.SubmitChanges();
            }
            else
            {
                tblStock stock = new tblStock();
                stock.dblCantidad = Int32.Parse(txtCantidad.Text);
                stock.fkProducto = Int32.Parse(producto);

                
                
                ctrlAlm.Editar(stock);
            }
            


            tblMovimiento mov = new tblMovimiento();
            mov.strTipo = movimiento;
            mov.fecha = fechact;
            mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

            ctrlAlm.InsertarMovimientoAlmacen(mov);


            this.Response.Redirect("./EntradaAlmacen.aspx", true);
        }
    }
}