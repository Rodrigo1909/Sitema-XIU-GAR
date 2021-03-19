using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Almacen
{
    public partial class SalidasAlmacen : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (Session["id"] != null)
                {
                    txtAlmacenista.Text = (Session["nombre"].ToString());
                    lbEmpleado.Text = (Session["id"].ToString());
                    this.LlenarAlmacen();
                }
            }
        }

        private void LimpiarCampos()
        {
            txtCantidad.Text = "";
            txtFactura.Text = "";
            txtOrdenCompra.Text = "";
            ddlAlmacen.Items.Clear();
            ddlExistente.Items.Clear();
            ddlProducto.Items.Clear();
            ddlMovimiento.Items.Clear();          

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
            var almacen = ddlAlmacen.SelectedItem.Value;
            var producto = ddlProducto.SelectedItem.Value;
            var movimiento = ddlMovimiento.SelectedItem.Value;
            DateTime fechact = DateTime.Now;
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();            

            var cantidadExistente = (from existe in contexto.tblStock
                                     where existe.fkProducto == Int32.Parse(producto)
                                     select existe);


            
            foreach (tblStock ord in cantidadExistente)
            {
                var resta = ord.dblCantidad - Int32.Parse(txtCantidad.Text);

                if(resta >= 0)
                {
                   
                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.dblValAnt = ord.dblCantidad;
                    mov.dblValNvo = resta;
                    mov.fkStock = ord.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

                    ctrlAlm.InsertarMovimientoAlmacen(mov);
                    ord.dblCantidad = resta;
                    contexto.SubmitChanges();
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                    this.LimpiarCampos();
                }
                else
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
                }

                    
            }
        
    }

        protected void ddlAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProducto.Items.Clear();

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

        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlExistente.Items.Clear();
            var exitente = (from exi in contexto.tblStock

                            join prod in contexto.tblProducto
                            on exi.fkProducto
                            equals prod.idProducto

                            where exi.fkProducto == Convert.ToInt32(ddlProducto.SelectedValue)
                            select new { cantidad = exi.dblCantidad, id = exi.idStock }).ToList();

            ddlExistente.DataValueField = "id";
            ddlExistente.DataTextField = "cantidad";
            ddlExistente.DataSource = exitente;
            ddlExistente.DataBind();
        }
    }
}