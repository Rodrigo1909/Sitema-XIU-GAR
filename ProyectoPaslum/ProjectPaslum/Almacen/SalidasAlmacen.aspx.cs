using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using System.Globalization;

namespace ProjectPaslum.Almacen
{
    public partial class SalidasAlmacen : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] != null)
            {
                txtAlmacenista.Text = (Session["nombre"].ToString());
                lbEmpleado.Text = (Session["id"].ToString());
                this.LlenarAlmacen();
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }

        private void LimpiarCampos()
        {
            txtCantidad.Text = "";
            txtFactura.Text = "";
            txtOrdenCompra.Text = "";            
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

        private void LlenarMarca()
        {
            ControllerProducto CtrlProducto = new ControllerProducto();
            List<tblMarca> marca = CtrlProducto.ConsultaMarca();
            ddlMarca.Items.Add("Seleccionar");
            ddlMarca.DataSource = marca;
            ddlMarca.DataValueField = "idMarca";
            ddlMarca.DataTextField = "strNombre";
            ddlMarca.DataBind();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var almacen = ddlAlmacen.SelectedItem.Value;
            var producto = ddlProducto.SelectedItem.Value;
            var movimiento = ddlMovimiento.SelectedItem.Value;
            DateTime fechact = DateTime.Now;
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();
            CultureInfo culture = new CultureInfo("en-US");

            var cantidadExistente = (from existe in contexto.tblStock
                                     where existe.fkProducto == Int32.Parse(producto)
                                     select existe);

            var existente = (from existe in contexto.tblStock
                            where existe.fkProducto == Int32.Parse(producto)
                            select existe).FirstOrDefault();


            if (existente == null)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "fallo()", true);
            }
            else { 
            foreach (tblStock ord in cantidadExistente)
            {
                var resta = ord.dblCantidad - decimal.Parse(txtCantidad.Text,culture);

                if(resta >= 0)
                {
                   
                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.dblValAnt = ord.dblCantidad;
                    mov.dblValNvo = resta;
                    mov.fkStock = ord.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);
                    mov.strNumVen = txtOrdenCompra.Text;
                    mov.strFactura = txtFactura.Text;

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
        }

        protected void ddlAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.LlenarMarca();
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

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProducto.Items.Clear();            
            ddlIngenio.Items.Clear();

            var activo = 1;

            var productoSuBMarca = (from sub in contexto.tblSubMarca

                                    join marc in contexto.tblMarca
                                    on sub.fkMarca equals marc.idMarca

                                    where sub.fkMarca == Convert.ToInt32(ddlMarca.SelectedValue)
                                    select new { subM = sub.strNombre, id = sub.idSubMarca }).ToList();

            ddlIngenio.Items.Add("No aplica");
            ddlIngenio.DataValueField = "id";
            ddlIngenio.DataTextField = "subM";
            ddlIngenio.DataSource = productoSuBMarca;
            ddlIngenio.DataBind();


            if (ddlIngenio.Items.Count == 1)
            {
                var producto = (from prod in contexto.tblProducto

                                join alm in contexto.tblAlmacen
                                on prod.fkAlmacen equals alm.idAlmacen

                                join uni in contexto.tblUnidadMedida
                                on prod.fkUnidadMedida equals uni.idUnidadMedida

                                join mar in contexto.tblMarca
                                on prod.fkMarca equals mar.idMarca

                                where prod.fkAlmacen == Convert.ToInt32(ddlAlmacen.SelectedValue) && prod.idActivo == activo && prod.fkMarca == Convert.ToInt32(ddlMarca.SelectedValue)
                                select new { nombre = "(" + prod.idProducto + ") " + prod.strNombre + ", " + prod.intPresentacion + " " + uni.strAbreviatura, id = prod.idProducto }).ToList();



                ddlProducto.Items.Add("Seleccionar");
                ddlProducto.DataValueField = "id";
                ddlProducto.DataTextField = "nombre";
                ddlProducto.DataSource = producto;
                ddlProducto.DataBind();
            }

        }

        protected void ddlIngenio_SelectedIndexChanged(object sender, EventArgs e)
        {
            var activo = 1;
            ddlProducto.Items.Clear();           

            var producto = (from prod in contexto.tblProducto

                            join alm in contexto.tblAlmacen
                            on prod.fkAlmacen equals alm.idAlmacen

                            join uni in contexto.tblUnidadMedida
                            on prod.fkUnidadMedida equals uni.idUnidadMedida

                            join mar in contexto.tblSubMarca
                            on prod.fkSubMarca equals mar.idSubMarca

                            where prod.fkAlmacen == Convert.ToInt32(ddlAlmacen.SelectedValue) && prod.idActivo == activo && prod.fkSubMarca == Convert.ToInt32(ddlIngenio.SelectedValue)
                            select new { nombre = "(" + prod.idProducto + ") " + prod.strNombre + ", " + prod.intPresentacion + " " + uni.strAbreviatura, id = prod.idProducto }).ToList();



            ddlProducto.Items.Add("Seleccionar");
            ddlProducto.DataValueField = "id";
            ddlProducto.DataTextField = "nombre";
            ddlProducto.DataSource = producto;
            ddlProducto.DataBind();
        }
    }
}
