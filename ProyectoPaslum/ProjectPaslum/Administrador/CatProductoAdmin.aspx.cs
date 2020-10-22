using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;

namespace ProjectPaslum.Administrador
{
    public partial class CatProductoAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LlenarAlmacen();
                this.LlenarUnidadMedida();
            }
        }

        private void LlenarAlmacen()
        {
            ControllerProducto CtrlAlmacen = new ControllerProducto();
            List<tblAlmacen> almacen = CtrlAlmacen.ConsultaAlmacen();
            ddlAlmacen.Items.Add("Seleccionar");
            ddlAlmacen.DataSource = almacen;
            ddlAlmacen.DataValueField = "idAlmacen";
            ddlAlmacen.DataTextField = "strNombre";
            ddlAlmacen.DataBind();

        }

        private void LlenarUnidadMedida()
        {
            ControllerProducto CtrlUnidadMedida = new ControllerProducto();
            List<tblUnidadMedida> unidad = CtrlUnidadMedida.ConsultaUnidadMedida();
            ddlUnidadMedida.Items.Add("Seleccionar");
            ddlUnidadMedida.DataSource = unidad;
            ddlUnidadMedida.DataValueField = "idUnidadMedida";
            ddlUnidadMedida.DataTextField = "strAbreviatura";
            ddlUnidadMedida.DataBind();

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            var almacen = ddlAlmacen.SelectedItem.Value;
            var unidad = ddlUnidadMedida.SelectedItem.Value;

            tblProducto prod = new tblProducto();
            prod.strNombre = txtNombre.Text.ToUpper();
            prod.strDescripcion = txtDescrip.Text.ToUpper();
            prod.intPresentacion = Int32.Parse(txtPresentacion.Text);
            prod.fkAlmacen = Int32.Parse(almacen);
            prod.fkUnidadMedida = Int32.Parse(unidad);
            prod.idActivo = 1;       
            ControllerProducto ctrlProd = new ControllerProducto();
            ctrlProd.InsertarProducto(prod);
            this.Response.Redirect("./CatProductoAdmin.aspx", true);
        }
    }
}