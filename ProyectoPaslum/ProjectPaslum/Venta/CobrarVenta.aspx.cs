using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using System.Data;
using ProjectPaslum.Controllers;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Globalization;

namespace ProjectPaslum.Venta
{
    public partial class CobrarVenta : System.Web.UI.Page
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

                var venta = (from ven in contexto.tblVenta                             
                             orderby ven.idVenta descending
                             select new { ultimo = ven.idVenta }).FirstOrDefault();

                var nuevo = venta.ultimo + 1;

                txtNumVen.Text = nuevo.ToString();
                
                if((Session["cliente"].ToString() == "MOSTRADOR"))
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
                ocar = (DataTable)Session["pedido"];
                ocar.Rows[index].Delete();
                lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostradorVenta.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            var vacio = 0.0000;
            CultureInfo culture = new CultureInfo("en-US");
            this.Calcular();

            if (double.Parse(lblTotal.Text) == vacio)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "fallo()", true);
            }

            else if (string.IsNullOrWhiteSpace(txtDinero.Text) ||
                     string.IsNullOrWhiteSpace(txtHora.Text) ||
                     string.IsNullOrWhiteSpace(fechaEntrega.Text))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "vacio()", true);
            }

            else if(double.Parse(lblTotal.Text) >= double.Parse(txtDinero.Text)){
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "fallo()", true);
            }
            

            else
            {
                DateTime fechact = DateTime.Now;
                ControllerCliente ctrlCli = new ControllerCliente();

                tblVenta ven = new tblVenta();


                if ((Session["cliente"].ToString() == "MOSTRADOR"))
                {
                    ven.Fecha = fechact;
                    ven.dblTotal = decimal.Parse(lblTotal.Text);
                    //ven.dblSubTotal = decimal.Parse(lblSubTotal.Text);
                    //ven.dblIGV = decimal.Parse(lblIGV.Text);
                    ven.strEstado = "FINALIZADO";
                    ven.dblAbono = decimal.Parse(txtDinero.Text, culture); ;
                    ven.dblInteres = null;
                    ven.strFechaEntega = fechaEntrega.Text;
                    ven.strHoraEntega = txtHora.Text;
                    ven.fkCliente = null;
                }
                else
                {
                    ven.Fecha = fechact;
                    ven.dblTotal = decimal.Parse(lblTotal.Text);
                    //ven.dblSubTotal = decimal.Parse(lblSubTotal.Text);
                    //ven.dblIGV = decimal.Parse(lblIGV.Text);
                    ven.strEstado = "PENDIENTE";
                    ven.dblAbono = decimal.Parse(txtDinero.Text, culture); ;
                    ven.dblInteres = null;
                    ven.strFechaEntega = fechaEntrega.Text;
                    ven.strHoraEntega = txtHora.Text;
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
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "exito()", true);
            }
            

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["pedido"];
            dt1.Rows[index].Delete();

            lblTotal.Text = TotalCarrito(dt1).ToString();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            Session["pedido"] = dt1;
            Button1_Click(Button1, null);
        }

        protected void SendEmail(object sender, EventArgs e)
        {



        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDinero.Text))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "vacio()", true);
            }
            else
            {

                DataTable dt = new DataTable();
                Document document = new Document();
                PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);
                DateTime fechact = DateTime.Now;
                this.Calcular();

                var venta = (from ven in contexto.tblVenta
                             orderby ven.idVenta descending
                             select new { ultimo = ven.idVenta }).FirstOrDefault();

                var nuevo = venta.ultimo + 1;
                

                dt = (DataTable)Session["pedido"];
                if (dt.Rows.Count > 0)
                {

                    document.Open();

                    var image = iTextSharp.text.Image.GetInstance(@"C:\Users\RodrigoM\Desktop\Sitema-XIU-GAR\ProyectoPaslum\ProjectPaslum\Alumno\images\XIUGAR.jpg");

                    // iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance("../images/avatar.png");
                    //image1.ScalePercent(50f);
                    image.ScaleAbsoluteWidth(270);
                    image.ScaleAbsoluteHeight(110);
                    image.SetAbsolutePosition(300, 720);
                    document.Add(image);


                    Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                    Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 13);
                    Font font7 = FontFactory.GetFont(FontFactory.TIMES, 13);
                    Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                    PdfPTable table = new PdfPTable(dt.Columns.Count);

                    //Paragraph title = new Paragraph(string.Format("XIU-GAR"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                    //title.Alignment = Element.ALIGN_CENTER;
                    //document.Add(title);

                    //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                    document.Add(new Chunk("\n"));

                    document.Add(new Paragraph(16, "N° Venta: " + nuevo.ToString(), font7));
                    document.Add(new Paragraph(16, "Vendedor: " + (Session["CompletoNombre"].ToString()), font7));
                    document.Add(new Paragraph(16, "Cliente: " + txtCliente.Text, font7));
                    document.Add(new Paragraph(16, "Domicilio: " + (Session["domicilio"].ToString()), font7));
                    document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font7));

                    document.Add(new Chunk("\n"));

                    float[] widths = new float[dt.Columns.Count];
                    for (int i = 0; i < dt.Columns.Count; i++)
                        widths[i] = 4f;

                    table.SetWidths(widths);
                    table.WidthPercentage = 90;

                    PdfPCell cell = new PdfPCell(new Phrase("columns"));
                    cell.Colspan = dt.Columns.Count;

                    table.AddCell("CODIGO");
                    table.AddCell("PRODUCTO");
                    table.AddCell("PRECIO");
                    table.AddCell("TOTAL");
                    table.AddCell("CANTIDAD");
                    table.AddCell("PRESENTACIÓN");
                    table.AddCell("U.MEDIDA");

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
                        else if (c.ColumnName == "intPresentacion")
                        {

                        }
                        else if (c.ColumnName == "strNombre1")
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

                    Paragraph total = new Paragraph(16, "Total: $" + decimal.Parse(lblTotal2.Text), font9);
                    Paragraph efectivo = new Paragraph(16, "Efectivo: $" + decimal.Parse(txtDinero.Text), font9);
                    Paragraph cambio = new Paragraph(16, "Cambio: $" + (decimal.Parse(txtDinero.Text) - decimal.Parse(lblTotal2.Text)), font9);
                    document.Add(new Chunk("\n"));
                    Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                    total.Alignment = Element.ALIGN_RIGHT;
                    efectivo.Alignment = Element.ALIGN_RIGHT;
                    cambio.Alignment = Element.ALIGN_RIGHT;
                    gracias.Alignment = Element.ALIGN_CENTER;

                    document.Add(total);
                    document.Add(efectivo);
                    document.Add(cambio);
                    document.Add(gracias);


                }

                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Ticket" + fechact + ".pdf");
                HttpContext.Current.Response.Write(document);
                Response.Flush();
                Response.End();

            }
        }
        private void Calcular()
        {
            int i;
            double total = 0, prec, subtotal = 0, subtotal2 = 0/* igv*/;
            string cod, desc;
            int cant;
            double precio, total2 = 0;


            var items = (DataTable)Session["pedido"];
            //DataRow fila = items.NewRow();
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);

                var producto = (from p in contexto.tblProducto
                                join unidad in contexto.tblUnidadMedida
                                    on p.fkUnidadMedida equals unidad.idUnidadMedida
                                where p.idProducto == int.Parse(cod)
                                select new { uni = unidad.strNombre, presentacion = p.intPresentacion }).FirstOrDefault();

                desc = (GridView1.Rows[i].Cells[2].Text);
                prec = System.Convert.ToDouble(GridView1.Rows[i].Cells[3].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox1")).Text);
                double prec1 = System.Convert.ToDouble(prec);
                subtotal = cant * prec1;
                GridView1.Rows[i].Cells[5].Text = subtotal.ToString();
                precio = System.Convert.ToDouble(((TextBox)this.GridView1.Rows[i].Cells[6].FindControl("TextBox2")).Text);
                subtotal2 = cant * precio;
                GridView1.Rows[i].Cells[7].Text = subtotal2.ToString();
                GridView1.Rows[i].Cells[8].Text = producto.uni;
                GridView1.Rows[i].Cells[9].Text = producto.presentacion.ToString();

                foreach (DataRow dr in items.Rows)
                {
                    if (dr["idProducto"].ToString() == cod.ToString())
                    {
                        dr["canproducto"] = cant;
                        dr["subtotal"] = subtotal;
                    }
                }

                total2 = total2 + subtotal2;
                total = total + subtotal;
            }

            //igv = total * 0.18;
            //subtotal = total - igv;

            //lblIGV.Text = igv.ToString("0.00");
            lblTotal2.Text = total2.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");
        }
    }
}