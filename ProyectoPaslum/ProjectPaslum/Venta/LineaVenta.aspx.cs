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
    public partial class LineaVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                if (!this.IsPostBack)
                {
                    try
                    {
                        GridView1.DataSource = (from ven in contexto.tblVenta
                                                join cli in contexto.tblCliente
                                                on ven.fkCliente equals cli.idCliente
                                                where ven.strEstado == "PENDIENTE"
                                                select new
                                                {
                                                    Identificador = ven.idVenta,
                                                    Establecimiento = cli.strEstablecimiento,
                                                    Total = ven.dblTotal,
                                                    Fecha = ven.Fecha,
                                                    Estado = ven.strEstado.ToUpper(),
                                                }).ToList();


                        GridView1.DataBind();
                    }
                    catch (Exception)
                    {

                        throw;
                    }

                }
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }

        protected void detalle2_Click(object sender, EventArgs e)
        {
            
        }
    }
}