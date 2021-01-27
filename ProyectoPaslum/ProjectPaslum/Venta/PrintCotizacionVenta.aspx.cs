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

namespace ProjectPaslum.Venta
{
    public partial class PrintCotizacionVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();

        protected void Page_Load(object sender, EventArgs e)
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

        public void cargarcarrito()
        {
            GridView1.DataSource = Session["pedido"];
            GridView1.DataBind();
            Button1_Click(Button1, null);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int i;
            double total = 0, prec, subtotal = 0, igv;
            string cod, desc;
            int cant;

            var items = (DataTable)Session["pedido"];
            //DataRow fila = items.NewRow();
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);
                desc = (GridView1.Rows[i].Cells[2].Text);
                prec = System.Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox1")).Text);
                double prec1 = System.Convert.ToDouble(prec);
                subtotal = cant * prec1;
                GridView1.Rows[i].Cells[5].Text = subtotal.ToString();
                foreach (DataRow dr in items.Rows)
                {
                    if (dr["idProducto"].ToString() == cod.ToString())
                    {
                        dr["canproducto"] = cant;
                        dr["subtotal"] = subtotal;
                    }
                }

                total = total + subtotal;
            }

            igv = total * 0.18;
            subtotal = total - igv;

            //lblIGV.Text = igv.ToString("0.00");
            //lblSubTotal.Text = subtotal.ToString("0.00");
            //lblTotal.Text = total.ToString("0.00");
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
                ocar = (DataTable)Session["pedido"];
                ocar.Rows[index].Delete();
                //lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["pedido"];
            dt1.Rows[index].Delete();

            
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            Session["pedido"] = dt1;
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


        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);


            dt = (DataTable)Session["pedido"];
            if (dt.Rows.Count > 0)
            {

                document.Open();

                var image = iTextSharp.text.Image.GetInstance(@"C:\Users\RodrigoM\Desktop\Sitema-XIU-GAR\ProyectoPaslum\ProjectPaslum\Alumno\images\XIUGAR.jpg");
                // iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance("../images/avatar.png");
                //image1.ScalePercent(50f);
                image.ScaleAbsoluteWidth(270);
                image.ScaleAbsoluteHeight(110);
                image.Alignment = Element.ALIGN_CENTER;
                document.Add(image);


                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.TIMES, 14);

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

                foreach (DataColumn c in dt.Columns)
                {
                    table.AddCell(new Phrase(c.ColumnName, font9));
                }

                foreach (DataRow r in dt.Rows)
                {
                    if (dt.Rows.Count > 0)
                    {
                        for (int h = 0; h < dt.Columns.Count; h++)
                        {
                            table.AddCell(new Phrase(r[h].ToString(), font9));
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
    }
}