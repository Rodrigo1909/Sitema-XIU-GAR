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
    public partial class CobrarCreditoVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                cargarcarrito();
                txtVendedor.Text = (Session["CompletoNombre"].ToString());
                txtDomicilio.Text = (Session["domicilio"].ToString());

                txtFechaFin.Text = (Session["FechaCredito"].ToString().Substring(0, 10));
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

            lblIGV.Text = igv.ToString("0.00");
            lblSubTotal.Text = subtotal.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");
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
            Response.Redirect("CobrarCreditoVenta.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CultureInfo culture = new CultureInfo("en-US");
            var vacio = 0.0000;

            if (double.Parse(lblTotal.Text) == vacio)
            {
                this.Response.Redirect("./AlertaError.aspx", true);
            }

            else
            {
                DateTime fechact = DateTime.Now;
                ControllerCliente ctrlCli = new ControllerCliente();

                tblHistorialAbono HisAbo = new tblHistorialAbono();
                HisAbo.Fecha = fechact;
                HisAbo.dblCantidad = decimal.Parse(txtDinero.Text);
                HisAbo.dblCantidadAnterior = decimal.Parse(txtDinero.Text);                
                ctrlCli.InsertarHistorialAbono(GetVenta(HisAbo));

                foreach (GridViewRow row in GridView1.Rows)
                {

                    tblDetalleVenta detalle = new tblDetalleVenta();
                    detalle.Fecha = fechact;
                    detalle.intCantidad = int.Parse(((TextBox)row.Cells[4].FindControl("TextBox1")).Text);
                    detalle.dblPrecio = decimal.Parse(Convert.ToString(row.Cells[3].Text));
                    detalle.fkProducto = int.Parse(row.Cells[1].Text);                    
                    detalle.fkEmpleado = int.Parse(Session["id"].ToString());
                    detalle.fkVenta = HisAbo.fkVenta;
                    ctrlCli.InsertarDetalle(detalle);

                }

                this.Response.Redirect("./AlertaExito.aspx", true);

            }
            Response.Redirect("CreditoVenta.aspx");

        }

        protected tblHistorialAbono GetVenta(tblHistorialAbono HisVen)
        {
            DateTime fechact = DateTime.Now;
            ControllerCliente ctrlClie = new ControllerCliente();

            tblVenta ven = new tblVenta();
            ven.Fecha = fechact;
            ven.FechaCredito = Convert.ToDateTime(txtFechaFin.Text);
            ven.dblTotal = decimal.Parse(lblTotal.Text);
            ven.dblSubTotal = decimal.Parse(lblSubTotal.Text);
            ven.dblIGV = decimal.Parse(lblIGV.Text);
            ven.strEstado = "CREDITO";
            ven.fkCliente = int.Parse(Session["cliente"].ToString());
            ven.dblInteres = decimal.Parse(txtInteres.Text);
            ven.dblAbono = decimal.Parse(txtDinero.Text);

            HisVen.tblVenta = ven;

            

            return HisVen;

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
                Font font9 = FontFactory.GetFont(FontFactory.TIMES, 12);

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
                table.AddCell("PRODUCTO");
                table.AddCell("PRECIO");
                table.AddCell("SUBTOTAL");
                table.AddCell("CANTIDAD");

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

                    else
                    {

                        table.AddCell(new Phrase(c.ColumnName, font9));
                    }
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

                Paragraph total = new Paragraph(16, "Total: $" + decimal.Parse(lblTotal.Text), font9);
                Paragraph efectivo = new Paragraph(16, "Efectivo: $" + decimal.Parse(txtDinero.Text), font9);
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                total.Alignment = Element.ALIGN_RIGHT;
                efectivo.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(total);
                document.Add(efectivo);
                document.Add(gracias);

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "Debo(emos) y pagaré(mos) incondicionalmente por este PAGARE a la orden de FELIPA TORRES HERNÁNDEZ," + 
                    " precisamente en su domicilio ubicado en Carrretera Pachuca Cd. Sahagún km. 55 S/N Col. Industrial La Paz C.P. 42092 " +
                    "Pachuca de Soto Hgo., o en cualquier otro lugar donde se me requiera el pago el dia " + 
                    (Session["FechaCredito"].ToString().Substring(0, 2)) + " de " + (Session["FechaCredito"].ToString().Substring(3, 2)) + " del " + (
                    Session["FechaCredito"].ToString().Substring(6, 4)) +
                    " la cantidad de $"+ decimal.Parse(lblTotal.Text) + " MXN, importe de mercancía recibida" + "de conformidad por conducto de " + txtCliente.Text +
                    " reconociendo de deudor de forma solidaria haber recibido dicho importe y haber facultado a la persona que recibe, para que en su nombre se obligue " +
                    "respecto de la cantidad referida, firmando este a su ruego. Si no se cubre su vencimiento la suma anterior causará " +
                    "ínteres monetarios a la razón del "+ txtInteres.Text +"% mensual a partir de la fecha de su vencimiento durante todo el tiempo qué " +
                    "estuviese insoluto sin que este considere prorroga el plazo para el cumplimiento de esta obligación, más los costos " +
                    "y gastos que se generan en cobranza de este documento.", font9));

                document.Add(new Chunk("\n"));

                Paragraph linea = new Paragraph(string.Format("_________________________________"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20));
                Paragraph firma = new Paragraph(string.Format("Nombre y Firma"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 15));

                linea.Alignment = Element.ALIGN_CENTER;
                document.Add(linea);
                firma.Alignment = Element.ALIGN_CENTER;
                document.Add(firma);

            }

            document.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Credito_"+ txtCliente.Text + ".pdf");
            HttpContext.Current.Response.Write(document);
            Response.Flush();
            Response.End();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }
    }
}