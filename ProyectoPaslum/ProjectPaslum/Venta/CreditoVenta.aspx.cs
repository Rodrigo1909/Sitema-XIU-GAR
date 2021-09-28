using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using System.Data;

namespace ProjectPaslum.Venta
{
    public partial class CreditoVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        DataTable dtb;
        DataTable carrito = new DataTable();

        public void CargarDetalle()
        {
            if (Session["credito"] == null)
            {
                dtb = new DataTable("Carrito");
                dtb.Columns.Add("idProducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("strNombre", System.Type.GetType("System.String"));
                //dtb.Columns.Add("dblPrecio", System.Type.GetType("System.Double"));
                //dtb.Columns.Add("subtotal", System.Type.GetType("System.Double"));
                dtb.Columns.Add("canproducto", System.Type.GetType("System.Int32"));
                dtb.Columns.Add("preVenta", System.Type.GetType("System.Double"));
                dtb.Columns.Add("dblCosto", System.Type.GetType("System.Double"));
                //dtb.Columns.Add("intPresentacion", System.Type.GetType("System.Int32"));
                //dtb.Columns.Add("strNombre1", System.Type.GetType("System.String"));

                Session["credito"] = dtb;
                Session["prueba"] = dtb;
            }
            else
            {
                Session["credito"] = Session["prueba"];
            }


        }

        public void AgregarItem(string cod, string des)
        {
            int cantidad = 1;
            decimal precio2 = 0;
            decimal costo = 0;

            carrito = (DataTable)Session["credito"];
            DataRow fila = carrito.NewRow();
            fila[0] = cod;
            fila[1] = des;
            fila[2] = (int)cantidad;
            fila[3] = (double)precio2;
            fila[4] = (double)costo;

            carrito.Rows.Add(fila);
            Session["credito"] = carrito;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] != null)
            {
                if (!IsPostBack)
                {
                    if (Session["id"] != null)
                    {
                        txtVendedor.Text = (Session["CompletoNombre"].ToString());
                        this.LlenarCliente();

                        txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    }
                }
                if (Page.IsPostBack == false)
                {
                    CargarDetalle();
                }
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }

        private void LlenarCliente()
        {
            var clie = (from cli in contexto.tblCliente
                        orderby cli.strNombre ascending
                        select new
                        {
                            nombre = cli.strNombre + " " + cli.strApellidoP +
                        " " + cli.strApellidoM + " (" + cli.strEstablecimiento + ")",
                            id = cli.idCliente
                        }).ToList();

            ddlCliente.Items.Add("SELECCIONAR");
            ddlCliente.DataValueField = "id";
            ddlCliente.DataTextField = "nombre";
            ddlCliente.DataSource = clie;
            ddlCliente.DataBind();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Session["domicilio"] = ddlDomicilio.SelectedValue;
            Session["cliente"] = ddlCliente.SelectedValue;
            Session["FechaCredito"] = calFin.Text;            
            Response.Redirect("CobrarCreditoVenta.aspx", true);
        }

        protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDomicilio.Items.Clear();
            ddlLugar.Items.Clear();

            var cliente = (from cli in contexto.tblCliente

                               join dom in contexto.tblDireccion
                               on cli.fkDireccion
                               equals dom.idDireccion

                               where cli.idCliente == Convert.ToInt32(ddlCliente.SelectedValue)
                               select new { colonia = dom.strColonia + ", " + dom.strCalle + ", " + dom.intCodpost, establecimiento = cli.strEstablecimiento }).ToList();

                ddlDomicilio.DataValueField = "colonia";
                ddlDomicilio.DataTextField = "colonia";
                ddlDomicilio.DataSource = cliente;
                ddlDomicilio.DataBind();

                ddlLugar.DataValueField = "establecimiento";
                ddlLugar.DataTextField = "establecimiento";
                ddlLugar.DataSource = cliente;
                ddlLugar.DataBind();
            }


        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void ListEstandarElHigo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarElHigo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarElHigo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarElHigo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarElHigo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarElHigo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarSanCristobal_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarSanCristobal.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarSanCristobal.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarSanCristobal.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarSanCristobal.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarSanCristobal.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarAtencingo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarAtencingo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarAtencingo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarAtencingo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarAtencingo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarAtencingo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarZulka_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarZulka.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarZulka.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarZulka.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarZulka.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarZulka.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarNaranjo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarNaranjo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarNaranjo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarNaranjo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarNaranjo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarNaranjo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarZapata_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarZapata.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarZapata.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarZapata.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarZapata.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarZapata.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarCasasano_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarCasasano.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarCasasano.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarCasasano.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarCasasano.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarCasasano.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarProvidencia_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarProvidencia.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarProvidencia.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarProvidencia.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarProvidencia.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarProvidencia.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarMiguelito_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarMiguelito.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarMiguelito.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarMiguelito.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarMiguelito.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarMiguelito.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarHuixtla_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarHuixtla.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarHuixtla.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarHuixtla.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarHuixtla.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarHuixtla.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarSanPedro_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarSanPedro.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarSanPedro.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarSanPedro.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarSanPedro.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarSanPedro.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarModelo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarModelo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarModelo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarModelo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarModelo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarModelo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarMotzorongo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarMotzorongo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarMotzorongo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarMotzorongo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarMotzorongo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarMotzorongo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarCovarrubias_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarCovarrubias.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarCovarrubias.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarCovarrubias.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarCovarrubias.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarCovarrubias.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarPedernales_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarPedernales.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarPedernales.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarPedernales.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarPedernales.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarPedernales.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarAlianza_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarAlianza.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarAlianza.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarAlianza.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarAlianza.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarAlianza.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarMargarita_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarMargarita.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarMargarita.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarMargarita.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarMargarita.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarMargarita.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarGloria_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarGloria.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarGloria.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarGloria.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarGloria.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarGloria.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarTala_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarTala.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarTala.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarTala.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarTala.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarTala.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarLazaro_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarLazaro.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarLazaro.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarLazaro.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarLazaro.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarLazaro.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarBenito_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarBenito.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarBenito.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarBenito.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarBenito.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarBenito.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarCalipam_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarCalipam.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarCalipam.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarCalipam.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarCalipam.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarCalipam.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarElCarmen_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarElCarmen.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarElCarmen.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarElCarmen.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarElCarmen.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarElCarmen.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarCentral_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarCentral.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarCentral.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarCentral.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarCentral.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarCentral.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListBlancoPuga_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListBlancoPuga.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListBlancoPuga.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListBlancoPuga.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListBlancoPuga.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListBlancoPuga.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListBlancoBenito_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListBlancoBenito.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListBlancoBenito.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListBlancoBenito.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListBlancoBenito.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListBlancoBenito.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaPotrero_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaPotrero.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaPotrero.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaPotrero.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaPotrero.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaPotrero.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaAyala_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaAyala.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaAyala.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaAyala.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaAyala.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaAyala.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaTamazula_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaTamazula.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaTamazula.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaTamazula.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaTamazula.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaTamazula.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaXicotencatl_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaXicotencatl.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaXicotencatl.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaXicotencatl.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaXicotencatl.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaXicotencatl.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaMante_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaMante.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaMante.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaMante.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaMante.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaMante.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaBenito_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaBenito.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaBenito.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaBenito.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaBenito.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaBenito.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaAdolfo_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaAdolfo.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaAdolfo.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaAdolfo.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaAdolfo.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaAdolfo.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaValles_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaValles.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaValles.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaValles.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaValles.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaValles.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaSanLuis_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaSanLuis.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaSanLuis.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaSanLuis.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaSanLuis.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaSanLuis.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaCarmen_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaCarmen.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaCarmen.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaCarmen.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaCarmen.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaCarmen.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaPuga_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaPuga.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaPuga.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaPuga.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaPuga.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaPuga.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaDomino_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaDomino.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaDomino.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaDomino.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaDomino.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaDomino.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEstandarXiugar_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEstandarXiugar.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEstandarXiugar.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEstandarXiugar.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEstandarXiugar.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEstandarXiugar.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListRefinadaXiugar_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListRefinadaXiugar.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListRefinadaXiugar.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListRefinadaXiugar.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListRefinadaXiugar.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListRefinadaXiugar.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListMascabadoXiugar_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListMascabadoXiugar.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListMascabadoXiugar.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListMascabadoXiugar.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListMascabadoXiugar.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListMascabadoXiugar.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListGlasXiugar_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListGlasXiugar.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListGlasXiugar.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListGlasXiugar.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListGlasXiugar.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListGlasXiugar.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

        protected void ListEndulcoranteXiugar_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string cod;
            string des = null;
            if (e.CommandName == "Seleccionar")
            {
                ListEndulcoranteXiugar.SelectedIndex = e.Item.ItemIndex;

                cod = ((Label)this.ListEndulcoranteXiugar.SelectedItem.FindControl("idProductoLabel")).Text;
                des = ((Label)this.ListEndulcoranteXiugar.SelectedItem.FindControl("strNombreLabel")).Text + " " +
                    int.Parse(((Label)this.ListEndulcoranteXiugar.SelectedItem.FindControl("intPresentacionLabel")).Text) + " " +
                    ((Label)this.ListEndulcoranteXiugar.SelectedItem.FindControl("strNombre1Label")).Text;

                AgregarItem(cod, des);


                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
        }

    }
}