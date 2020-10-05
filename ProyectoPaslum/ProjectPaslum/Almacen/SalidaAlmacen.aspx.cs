using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controller;

namespace ProjectPaslum.Almacen
{
    public partial class SalidaAlmacen : System.Web.UI.Page
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
                    this.LlenarExistente();
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

        private void LlenarExistente()
        {
            var exitente = (from exi in contexto.tblStock
                            select exi.dblCantidad).FirstOrDefault();

            exitente = Int32.Parse(LabExiste.Text);

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

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            var almacen = ddlAlmacen.SelectedItem.Value;
            var producto = ddlProducto.SelectedItem.Value;
            var movimiento = ddlMovimiento.SelectedItem.Value;
            DateTime fechact = DateTime.Now;
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();
            var entrar = 0;

            var cantidadExistente = (from existe in contexto.tblStock
                                     where existe.fkProducto == Int32.Parse(producto)
                                     select existe);

            if (entrar == 0)
            {
                var actualizar = 1;
                foreach (tblStock ord in cantidadExistente)
                {
                    actualizar += 1;
                    decimal resta;
                    resta = ord.dblCantidad - Int32.Parse(txtCantidad.Text);
                    ord.dblCantidad = resta;
                    contexto.SubmitChanges();

                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.fkStock = ord.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

                    ctrlAlm.InsertarMovimientoAlmacen(mov);

                }
                if (actualizar == 1)
                {
                    tblStock stock = new tblStock();
                    stock.dblCantidad = Int32.Parse(txtCantidad.Text);
                    stock.fkProducto = Int32.Parse(producto);
                    ctrlAlm.InsertarEntradaAlmacen(stock);


                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.fkStock = stock.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

                    ctrlAlm.InsertarMovimientoAlmacen(mov);
                }
            }

            this.Response.Redirect("./SalidaAlmacen.aspx", true);
        }
    }
}