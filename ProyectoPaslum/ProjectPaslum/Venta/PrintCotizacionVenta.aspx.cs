using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Modelo;
using System.Data;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using ProjectPaslum.Controllers;
using System.Globalization;

namespace ProjectPaslum.Venta
{
    public partial class PrintCotizacionVenta : System.Web.UI.Page
    {
        CultureInfo culture = new CultureInfo("en-US");
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                if (Page.IsPostBack == false)
                {
                    cargarcarrito();
                    txtVendedor.Text = (Session["CompletoNombre"].ToString());
                    txtDomicilio.Text = (Session["domicilio"].ToString());
                    txtFecha.Text = DateTime.Now.Date.ToString().Substring(0, 10);

                    if ((Session["cliente"].ToString() == "MOSTRADOR"))
                    {
                        txtCliente.Text = (Session["cliente"].ToString());
                    }
                    else
                    {
                        var cliente = (from cli in contexto.tblCliente
                                       where cli.idCliente == int.Parse(Session["cliente"].ToString())
                                       select new { nombre = cli.strNombre + " " + cli.strApellidoP + " " + cli.strApellidoM }).FirstOrDefault();

                        txtCliente.Text = cliente.nombre;
                    }
                }
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }           
        }

        public void cargarcarrito()
        {
            GridView1.DataSource = Session["cotizacion"];
            GridView1.DataBind();
            Button1_Click(Button1, null);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.Calcular();  
        }

        public double TotalCarrito(DataTable dt)
        {
            double tot = 0;
            foreach (DataRow item in dt.Rows)
            {
                tot += Convert.ToDouble(item[4]);
            }
            return tot;
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Borrar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DataTable ocar = new DataTable();
                ocar = (DataTable)Session["cotizacion"];
                ocar.Rows[index].Delete();
                lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["cotizacion"];
            dt1.Rows[index].Delete();

            lblTotal.Text = TotalCarrito(dt1).ToString();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            Session["cotizacion"] = dt1;
            Button1_Click(Button1, null);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CotizacionVenta.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
        

           
                DateTime fechact = DateTime.Now;
                ControllerCliente ctrlCli = new ControllerCliente();

                tblVenta ven = new tblVenta();
                ven.Fecha = fechact;
                //ven.dblTotal = decimal.Parse(lblTotal.Text);
                //ven.dblSubTotal = decimal.Parse(lblSubTotal.Text);
                //ven.dblIGV = decimal.Parse(lblIGV.Text);
                ven.strEstado = "FINALIZADO";
                ven.dblAbono = null;
                ven.dblInteres = null;

                if ((Session["cliente"].ToString() == "MOSTRADOR"))
                {
                    ven.fkCliente = null;
                }
                else
                {
                    ven.fkCliente = int.Parse(Session["cliente"].ToString());
                }
                ctrlCli.InsertarVenta(ven);



                foreach (GridViewRow row in GridView1.Rows)
                {
                    ControllerCliente ctrlClie = new ControllerCliente();
                    tblDetalleVenta detalle = new tblDetalleVenta();
                    detalle.Fecha = fechact;
                    detalle.intCantidad = int.Parse(((TextBox)row.Cells[4].FindControl("TextBox1")).Text);
                    detalle.dblPrecio = decimal.Parse(Convert.ToString(row.Cells[3].Text));
                    detalle.fkProducto = int.Parse(row.Cells[1].Text);
                    detalle.fkVenta = ven.idVenta;
                    detalle.fkEmpleado = int.Parse(Session["id"].ToString());
                    ctrlClie.InsertarDetalle(detalle);

                }
                Response.Redirect("AlertaExito.aspx");
            
            Response.Redirect("MostradorVenta.aspx");
        }        

        protected void Button4_Click(object sender, EventArgs e)
        {
            this.Calcular();
            DataTable dt = new DataTable();
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);


            dt = (DataTable)Session["cotizacion"];
            if (dt.Rows.Count > 0)
            {

                document.Open();

                String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                //var image = iTextSharp.text.Image.GetInstance(@"C:\Users\RodrigoM\Desktop\Sitema-XIU-GAR\ProyectoPaslum\ProjectPaslum\Alumno\images\XIUGAR.jpg");

                // iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance("../../images/avatar.png");
                //image1.ScalePercent(50f);
                image.ScaleAbsoluteWidth(220);
                image.ScaleAbsoluteHeight(90);
                image.SetAbsolutePosition(350, 720);
                document.Add(image);



                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.TIMES, 14);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                //Paragraph title = new Paragraph(string.Format("XIU-GAR"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                //title.Alignment = Element.ALIGN_CENTER;
                //document.Add(title);

                //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "Vendedor: " + (Session["CompletoNombre"].ToString()), font9));
                document.Add(new Paragraph(16, "Cliente: " + txtCliente.Text, font9));
                document.Add(new Paragraph(16, "Domicilio: " + (Session["domicilio"].ToString()), font9));
                document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));

                document.Add(new Chunk("\n"));

                float[] widths = new float[dt.Columns.Count];
                for (int i = 0; i < dt.Columns.Count; i++)
                    widths[i] = 4f;

                table.SetWidths(widths);
                table.WidthPercentage = 90;

                PdfPCell cell = new PdfPCell(new Phrase("columns"));
                cell.Colspan = dt.Columns.Count;
                table.AddCell("CODIGO");
                table.AddCell("DESCRIPCIÓN");
                table.AddCell("CANTIDAD");
                table.AddCell("PRECIO");
                table.AddCell("TOTAL");


                foreach (DataColumn c in dt.Columns)
                {
                    if (c.ColumnName == "idProducto")
                    {

                    }
                    else if (c.ColumnName == "strNombre")
                    {

                    }
                    else if (c.ColumnName == "dblPrecio")
                    {

                    }
                    else if (c.ColumnName == "subtotal")
                    {

                    }
                    else if (c.ColumnName == "canproducto")
                    {

                    }
                    else if (c.ColumnName == "preVenta")
                    {

                    }
                    else if (c.ColumnName == "dblCosto")
                    {

                    }

                    else
                    {

                        table.AddCell(new Phrase(c.ColumnName, font8));
                    }
                }

                foreach (DataRow r in dt.Rows)
                {
                    if (dt.Rows.Count > 0)
                    {
                        for (int h = 0; h < dt.Columns.Count; h++)
                        {
                            table.AddCell(new Phrase(r[h].ToString(), font8));

                        }
                    }
                }

                document.Add(table);
                document.Add(new Chunk("\n"));

                Paragraph Condiciones = new Paragraph(16, "Condiciones: " + txtCondiciones.Text, font9);
                Paragraph Carlos = new Paragraph(16, "Lic. Carlos A. Mac Gregor Torres\nDirector General\n(044) 771-747-3620", font9);
                
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Precio autorizado: Lic. Carlos A. Mac Gregor Torres.", font9);

                document.Add(new Chunk("\n"));

                Condiciones.Alignment = Element.ALIGN_LEFT;
                Carlos.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(Condiciones);
                document.Add(Carlos);

                document.Add(gracias);


            }

            document.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Cotizacion_"+ txtCliente.Text + ".pdf");
            HttpContext.Current.Response.Write(document);
            Response.Flush();
            Response.End();
        }

        private void Calcular()
        {
            int i;
            double total = 0, subtotal = 0, subtotal2 = 0;
            string cod, desc;
            int cant;
            double precio, total2 = 0;

            var items = (DataTable)Session["cotizacion"];
            //DataRow fila = items.NewRow();
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);
                var producto = (from p in contexto.tblProducto
                                where p.idProducto == int.Parse(cod)
                                select new { aprox = p.dblPrecio }).FirstOrDefault();

                
                desc = (GridView1.Rows[i].Cells[2].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[3].FindControl("TextBox1")).Text);
                precio = System.Convert.ToDouble(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox2")).Text, culture);
                subtotal2 = cant * precio;
                GridView1.Rows[i].Cells[5].Text = subtotal2.ToString();
                GridView1.Rows[i].Cells[6].Text = producto.aprox.ToString();

                double prec1 = System.Convert.ToDouble(producto.aprox.ToString());
                subtotal = cant * prec1;

                foreach (DataRow dr in items.Rows)
                {
                    if (dr["idProducto"].ToString() == cod.ToString())
                    {
                        dr["canproducto"] = cant;
                        dr["preVenta"] = precio;
                        dr["dblCosto"] = subtotal2;
                    }
                }

                total2 = total2 + subtotal2;
                total = total + subtotal;
            }

            lblTotal2.Text = total2.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");
        }
    }
}