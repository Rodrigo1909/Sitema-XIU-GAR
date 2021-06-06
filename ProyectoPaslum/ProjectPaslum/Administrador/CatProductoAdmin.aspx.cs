using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using System.Globalization;

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
                this.LlenarMarca();
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

        private void LlenarMarca()
        {
            ControllerProducto CtrlMarca = new ControllerProducto();
            List<tblMarca> marca = CtrlMarca.ConsultaMarca();
            ddlMarca.Items.Add("Seleccionar");
            ddlMarca.DataSource = marca;
            ddlMarca.DataValueField = "idMarca";
            ddlMarca.DataTextField = "strNombre";
            ddlMarca.DataBind();

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            CultureInfo culture = new CultureInfo("en-US");
            var almacen = ddlAlmacen.SelectedItem.Value;
            var unidad = ddlUnidadMedida.SelectedItem.Value;
            var marca = ddlMarca.SelectedItem.Value;
            var subMarca = ddlIngenio.SelectedItem.Value;

            tblProducto prod = new tblProducto();
            prod.strNombre = txtNombre.Text.ToUpper();
            prod.strDescripcion = txtDescrip.Text.ToUpper();
            prod.intPresentacion = Int32.Parse(txtPresentacion.Text);
            prod.dblPrecio = decimal.Parse(txtPrecio.Text, culture);
            prod.fkAlmacen = Int32.Parse(almacen);
            prod.fkUnidadMedida = Int32.Parse(unidad);
            prod.strCatalogo = cmbClasificacion.SelectedItem.Value;
            prod.fkMarca = Int32.Parse(marca);
            try
            {
                prod.fkSubMarca = Int32.Parse(subMarca);
            }
            catch
            {
                prod.fkSubMarca = null;
            }
            prod.idActivo = 1;

            //if (!string.IsNullOrEmpty(FileUpload1.FileName))
            //{
            //    FileUpload1.SaveAs(Server.MapPath("/ImagenesProductos/") + FileUpload1.FileName);

            //}
            //prod.strImagen = FileUpload1.FileName;
            ControllerProducto ctrlProd = new ControllerProducto();
            ctrlProd.InsertarProducto(prod);
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            this.LimpiarCampos();
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtDescrip.Text = "";
            txtPresentacion.Text = "";
            txtPrecio.Text = "";
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlIngenio.Items.Clear();
            var Ingenio = (from sub in contexto.tblSubMarca

                             join marca in contexto.tblMarca
                             on sub.fkMarca
                             equals marca.idMarca

                             where sub.fkMarca == Convert.ToInt32(ddlMarca.SelectedValue)
                             select new { nombre = sub.strNombre, id = sub.idSubMarca }).ToList();



            ddlIngenio.Items.Add("No aplica");
            ddlIngenio.DataValueField = "id";
            ddlIngenio.DataTextField = "nombre";
            ddlIngenio.DataSource = Ingenio;
            ddlIngenio.DataBind();
        }
    }
}