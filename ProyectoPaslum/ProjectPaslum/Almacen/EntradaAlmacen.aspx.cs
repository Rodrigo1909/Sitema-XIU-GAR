﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

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
                    txtAlmacenista.Text = (Session["nombre"].ToString());
                    lbEmpleado.Text = (Session["id"].ToString());
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

        private void LimpiarCampos()
        {
            txtCantidad.Text = "";
            ddlStock.Items.Clear();            
            

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

                var actualizar = 1;
                foreach (tblStock ord in cantidadExistente)
                {
                    actualizar += 1;
                    var suma = decimal.Parse(txtCantidad.Text,culture) + ord.dblCantidad;      

                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.dblValAnt = ord.dblCantidad;
                    mov.dblValNvo = suma;
                    mov.fkStock = ord.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

                    ord.dblCantidad = suma;

                    ctrlAlm.InsertarMovimientoAlmacen(mov);
                    contexto.SubmitChanges();
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                    this.LimpiarCampos();
                }
                if(actualizar == 1)
                {
                    tblStock stock = new tblStock();
                    stock.dblCantidad = decimal.Parse(txtCantidad.Text, culture);
                    stock.fkProducto = Int32.Parse(producto);
                    ctrlAlm.InsertarEntradaAlmacen(stock);

                    tblMovimiento mov = new tblMovimiento();
                    mov.strTipo = movimiento;
                    mov.fecha = fechact;
                    mov.dblValAnt = 0;
                    mov.dblValNvo = Int32.Parse(txtCantidad.Text);
                    mov.fkStock = stock.idStock;
                    mov.fkEmpleado = Int32.Parse(lbEmpleado.Text);

                    ctrlAlm.InsertarMovimientoAlmacen(mov);
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
                    this.LimpiarCampos();
            }
           
                
        }

        protected void ddlAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        {

            ddlProducto.Items.Clear();
            ddlStock.Items.Clear();
            var activo = 1;


            var producto = (from prod in contexto.tblProducto

                             join alm in contexto.tblAlmacen
                             on prod.fkAlmacen equals alm.idAlmacen

                            join uni in contexto.tblUnidadMedida
                            on prod.fkUnidadMedida equals uni.idUnidadMedida

                            where prod.fkAlmacen == Convert.ToInt32(ddlAlmacen.SelectedValue) && prod.idActivo == activo
                            select new { nombre = prod.strNombre + ", " + prod.intPresentacion + " " + uni.strAbreviatura, id = prod.idProducto }).ToList();



            ddlProducto.Items.Add("Seleccionar");
            ddlProducto.DataValueField = "id";
            ddlProducto.DataTextField = "nombre";
            ddlProducto.DataSource = producto;
            ddlProducto.DataBind();

           
        }

        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlStock.Items.Clear();

                var producto = ddlProducto.SelectedItem.Value;
                var cantidadExistente = (from existe in contexto.tblStock
                                         where existe.fkProducto == Int32.Parse(producto)
                                         select existe.dblCantidad).FirstOrDefault();

                var cantidadExistente2 = (from existe in contexto.tblStock
                                     where existe.fkProducto == Int32.Parse(producto)
                                     select existe.dblCantidad).ToList();

            if (cantidadExistente == null)
                {
                    ddlStock.Items.Add("0");
                }
                else
                {
                    
                    ddlStock.DataSource = cantidadExistente2;
                    ddlStock.DataBind();
               
                }             
        
        }
    }
}