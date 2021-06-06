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
    public partial class UniMedidaAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.LlenarMarca();
            }
        }

        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtPresentacion.Text = "";
            txtNombreMarca.Text = "";
            txtNombreIngenio.Text = "";
            
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
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtPresentacion.Text))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
            else
            { 
            tblUnidadMedida UniMed = new tblUnidadMedida();
            UniMed.strNombre = txtNombre.Text.ToUpper();
            UniMed.strAbreviatura = txtPresentacion.Text.ToUpper();
            UniMed.idActivo = 1;

            ControllerUnidadMedida ctrlUniMed = new ControllerUnidadMedida();
            ctrlUniMed.InsertarUnidadMedida(UniMed);
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            this.LimpiarCampos();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombreMarca.Text) || string.IsNullOrWhiteSpace(FileUpload.FileName))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
            else
            {
                tblMarca marc = new tblMarca();
                marc.strNombre = txtNombreMarca.Text.ToUpper();

                if (!string.IsNullOrEmpty(FileUpload.FileName))
                {
                    FileUpload.SaveAs(Server.MapPath("/ImagenesProductos/") + FileUpload.FileName);

                }
                marc.imagen = FileUpload.FileName;
                marc.idActivo = 1;

                ControllerProducto ctrlProd = new ControllerProducto();
                ctrlProd.InsertarMarca(marc);
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                this.LimpiarCampos();
            }
        }

        protected void BtnIngenio_Click(object sender, EventArgs e)
        {
            var marca = ddlMarca.SelectedItem.Value;

            if (string.IsNullOrWhiteSpace(txtNombreIngenio.Text) || string.IsNullOrWhiteSpace(imagenIngenio.FileName))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "alerta()", true);
            }
            else
            {
                tblSubMarca SubMarc = new tblSubMarca();
                SubMarc.strNombre = txtNombreIngenio.Text.ToUpper();

                if (!string.IsNullOrEmpty(imagenIngenio.FileName))
                {
                    imagenIngenio.SaveAs(Server.MapPath("/ImagenesProductos/") + imagenIngenio.FileName);

                }
                SubMarc.imagen = imagenIngenio.FileName;
                SubMarc.fkMarca = int.Parse(marca);

                ControllerProducto ctrlProd = new ControllerProducto();
                ctrlProd.InsertarSubMarca(SubMarc);
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                this.LimpiarCampos();
            }
        }
    }
}