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
    public partial class AlmacenAdmin : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LlenarEncargado();
            }
        }

        private void LlenarEncargado()
        {
            ControllerAlmacen CtrlAlmacen = new ControllerAlmacen();
            var encargado = (from enca in contexto.tblEmpleado

                             join usu in contexto.tblUsuario
                             on enca.fkLogin
                             equals usu.idUsuario

                             where usu.strTipousuario == "ALMACEN"
                             select new { completo = enca.strNombre + " " + enca.strApellidoP + " " + enca.strApellidoM, id = enca.idEmpleado }).ToList();

            ddlEncargado.Items.Add("Seleccionar");
            ddlEncargado.DataSource = encargado;
            ddlEncargado.DataValueField = "id";
            ddlEncargado.DataTextField = "completo";
            ddlEncargado.DataBind();

        }

        protected void btnaceptar_Click(object sender, EventArgs e)
        {
            var encargado = ddlEncargado.SelectedItem.Value;

            tblAlmacen alm = new tblAlmacen();
            alm.strNombre = txtNombre.Text.ToUpper();
            alm.strDescripcion = txtDescrip.Text.ToUpper();
            alm.intCapacidad = Int32.Parse(txtCapacidad.Text);
            alm.fkEncargado = Int32.Parse(encargado);
            alm.idActivo = 1;

            ControllerAlmacen ctrlAlm = new ControllerAlmacen();
            ctrlAlm.InsertarAlmacen(alm);
            this.Response.Redirect("./AlmacenAdmin.aspx", true);
        }
    }
}