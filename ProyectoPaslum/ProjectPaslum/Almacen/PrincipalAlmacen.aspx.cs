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
    public partial class PrincipalAlmacen : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Session["id"] != null)
            //    {
            //        this.LlenarAlmacen();
            //    }
            //}
        }

        //private void LlenarAlmacen()
        //{
        //    ControllerAlmacen CtrlAlmacen = new ControllerAlmacen();
        //    List<tblAlmacen> almacen = CtrlAlmacen.ConsultaAlmacen();
        //    ddlAlmacen.Items.Add("Seleccionar");
        //    ddlAlmacen.DataSource = almacen;
        //    ddlAlmacen.DataValueField = "idAlmacen";
        //    ddlAlmacen.DataTextField = "strNombre";
        //    ddlAlmacen.DataBind();

        //}

        //private void LlenarMarca()
        //{
        //    ControllerProducto CtrlProducto = new ControllerProducto();
        //    List<tblMarca> marca = CtrlProducto.ConsultaMarca();
        //    ddlMarca.Items.Add("Seleccionar");
        //    ddlMarca.DataSource = marca;
        //    ddlMarca.DataValueField = "idMarca";
        //    ddlMarca.DataTextField = "strNombre";
        //    ddlMarca.DataBind();

        //}

        //protected void ddlAlmacen_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    this.LlenarMarca();
        //}

        //protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    //try
        //    //{
        //    //    var almacenValor = ddlAlmacen.SelectedItem.Value;
        //    //    var marcaValor = ddlMarca.SelectedItem.Value;

        //    //    var desglozar = (from stock in contexto.tblStock
        //    //                         join producto in contexto.tblProducto
        //    //                            on stock.fkProducto equals producto.idProducto
        //    //                         join almacen in contexto.tblAlmacen
        //    //                            on producto.fkAlmacen equals almacenValor
        //    //                         join marca in contexto.tblMarca
        //    //                                on producto.fkMarca = marcaValor
        //    //                         join sub in contexto.tblSubMarca
        //    //                              on producto.fkSubMarca = sub.idSubMarca
        //    //                     where almacen.idActivo == 1 && producto.idActivo == 1
        //    //                     select new
        //    //                     {
        //    //                         PRODUCTO = producto.strNombre,
        //    //                         DESCRIPCIÓN = producto.strDescripcion,
        //    //                         CANTIDAD = detalle.intCantidad,
        //    //                         PRESENTACIÓN = producto.intPresentacion,
        //    //                         UNIDAD = unidad.strNombre
        //    //                     }).ToList();

        //    //    GridView1.DataSource = desglozar;
        //    //    GridView1.DataBind();



        //    //}
        //    //catch (Exception)
        //    //{

        //    //    throw;
        //    //}
        //}
    }
}