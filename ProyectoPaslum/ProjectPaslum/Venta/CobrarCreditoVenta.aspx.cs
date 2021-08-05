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

                var venta = (from ven in contexto.tblVenta
                             orderby ven.idVenta descending
                             select new { ultimo = ven.idVenta }).FirstOrDefault();

                var nuevo = venta.ultimo + 1;

                txtNumVen.Text = nuevo.ToString();


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
            GridView1.DataSource = Session["credito"];
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
                ocar = (DataTable)Session["credito"];
                ocar.Rows[index].Delete();
                lblTotal.Text = TotalCarrito(ocar).ToString();
                GridView1.DataSource = ocar;
                GridView1.DataBind();
                cargarcarrito();
            }

        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditoVenta.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            CultureInfo culture = new CultureInfo("en-US");
            var vacio = 0.0000;
            this.Calcular();

            if (double.Parse(lblTotal2.Text) == vacio)
            {
                this.Response.Redirect("./AlertaError.aspx", true);
            }

            else
            {
                DateTime fechact = DateTime.Now;
                ControllerCliente ctrlCli = new ControllerCliente();

                tblHistorialAbono HisAbo = new tblHistorialAbono();
                HisAbo.Fecha = fechact;
                HisAbo.dblCantidad = decimal.Parse(txtDinero.Text, culture);
                HisAbo.dblCantidadAnterior = decimal.Parse(txtDinero.Text, culture);   
                ctrlCli.InsertarHistorialAbono(GetVenta(HisAbo));

                foreach (GridViewRow row in GridView1.Rows)
                {

                    tblDetalleVenta detalle = new tblDetalleVenta();
                    detalle.Fecha = fechact;
                    detalle.intCantidad = int.Parse(((TextBox)row.Cells[3].FindControl("TextBox1")).Text, culture);
                    detalle.dblPrecio = decimal.Parse(((TextBox)row.Cells[4].FindControl("TextBox2")).Text, culture);
                    detalle.fkProducto = int.Parse(row.Cells[1].Text);                    
                    detalle.fkEmpleado = int.Parse(Session["id"].ToString());
                    detalle.fkVenta = HisAbo.fkVenta;
                    ctrlCli.InsertarDetalle(detalle);

                    ControllerAlmacen ctrlAlmPrecio = new ControllerAlmacen();
                    tblProducto PrePro = new tblProducto();

                    PrePro.idProducto = int.Parse(row.Cells[1].Text);
                    PrePro.dblPrecio = decimal.Parse(((TextBox)row.Cells[4].FindControl("TextBox2")).Text, culture);
                    ctrlAlmPrecio.EditarPrecioProducto(PrePro);

                }

                this.Response.Redirect("./AlertaExito.aspx", true);

            }
            Response.Redirect("CreditoVenta.aspx");

        }

        protected tblHistorialAbono GetVenta(tblHistorialAbono HisVen)
        {
            CultureInfo culture = new CultureInfo("en-US");
            DateTime fechact = DateTime.Now;
            ControllerCliente ctrlClie = new ControllerCliente();

            tblVenta ven = new tblVenta();
            ven.Fecha = fechact;
            ven.FechaCredito = Convert.ToDateTime(txtFechaFin.Text);
            ven.dblTotal = decimal.Parse(lblTotal2.Text);
            ven.strEstado = "CREDITO";
            ven.fkCliente = int.Parse(Session["cliente"].ToString());
            ven.dblInteres = decimal.Parse(txtInteres.Text);
            ven.dblAbono = decimal.Parse(txtDinero.Text, culture);
            ven.strFechaEntega = fechaEntrega.Text;
            ven.strHoraEntega = txtHora.Text;
            ven.archNota = "NO EXISTE";
            ven.archFactura = "NO EXISTE";

            HisVen.tblVenta = ven;

            

            return HisVen;

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;
            DataTable dt1 = new DataTable();
            dt1 = (DataTable)Session["credito"];
            dt1.Rows[index].Delete();

            lblTotal.Text = TotalCarrito(dt1).ToString();
            GridView1.DataSource = dt1;
            GridView1.DataBind();
            Session["credito"] = dt1;
            Button1_Click(Button1, null);
        }

        protected void Button4_Click(object sender, EventArgs e)
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

            dt = (DataTable)Session["credito"];
            if (dt.Rows.Count > 0)
            {

                document.Open();
                String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                image.ScaleAbsoluteWidth(220);
                image.ScaleAbsoluteHeight(90);
                image.SetAbsolutePosition(350, 720);
                document.Add(image);


                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.TIMES, 12);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                PdfPTable table = new PdfPTable(dt.Columns.Count);

                //Paragraph title = new Paragraph(string.Format("XIU-GAR"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                //title.Alignment = Element.ALIGN_CENTER;
                //document.Add(title);

                //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "N° Venta: " + nuevo.ToString(), font9));
                document.Add(new Paragraph(16, "Vendedor: " + (Session["CompletoNombre"].ToString()), font9));
                document.Add(new Paragraph(16, "Cliente: " + txtCliente.Text, font9));
                document.Add(new Paragraph(16, "Domicilio: " + (Session["domicilio"].ToString()), font9));
                document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));

                document.Add(new Chunk("\n"));

                float[] widths = new float[dt.Columns.Count];
                for (int i = 0; i < dt.Columns.Count; i++)
                    widths[i] = 4f;

                table.SetWidths(widths);
                table.WidthPercentage = 100;

                PdfPCell cell = new PdfPCell(new Phrase("columns"));
                cell.Colspan = dt.Columns.Count;

                table.AddCell("CODIGO");
                table.AddCell("PRODUCTO");
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

                Paragraph total = new Paragraph(16, "Total: $" + decimal.Parse(lblTotal2.Text), font9);
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
                    " precisamente en su domicilio ubicado en Carretera Pachuca Cd. Sahagún km. 55 S/N Col. Industrial La Paz C.P. 42092 " +
                    "Pachuca de Soto Hgo., o en cualquier otro lugar donde se me requiera el pago el dia " + 
                    (Session["FechaCredito"].ToString().Substring(8, 2)) + " de " + (Session["FechaCredito"].ToString().Substring(5, 2)) + " del " + (
                    Session["FechaCredito"].ToString().Substring(0, 4)) +
                    " la cantidad de $"+ decimal.Parse(lblTotal2.Text) + " MXN, importe de mercancía recibida de conformidad por conducto de " + txtCliente.Text +
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
        private void Calcular()
        {
            int i;
            double total = 0, subtotal = 0, subtotal2 = 0, monto = 0, intereses = 0;
            string cod, desc;
            int cant;
            double precio, total2 = 0;
            CultureInfo culture = new CultureInfo("en-US");

            var items = (DataTable)Session["credito"];

            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                cod = (GridView1.Rows[i].Cells[1].Text);

                var producto = (from p in contexto.tblProducto
                                join m in contexto.tblMarca
                                    on p.fkMarca equals m.idMarca
                                where p.idProducto == int.Parse(cod)
                                select new { aprox = p.dblPrecio, marca = m.strNombre }).FirstOrDefault();

                var subMarca = (from p in contexto.tblProducto
                                join sub in contexto.tblSubMarca
                                    on p.fkSubMarca equals sub.idSubMarca
                                where p.idProducto == int.Parse(cod)
                                select new { subM = sub.strNombre }).FirstOrDefault();


                desc = (GridView1.Rows[i].Cells[2].Text);
                cant = System.Convert.ToInt16(((TextBox)this.GridView1.Rows[i].Cells[3].FindControl("TextBox1")).Text, culture);
                precio = System.Convert.ToDouble(((TextBox)this.GridView1.Rows[i].Cells[4].FindControl("TextBox2")).Text, culture);
                subtotal2 = cant * precio;
                GridView1.Rows[i].Cells[5].Text = subtotal2.ToString();
                GridView1.Rows[i].Cells[6].Text = producto.aprox.ToString();

                if (subMarca == null)
                {
                    GridView1.Rows[i].Cells[7].Text = producto.marca.ToString() + "(No aplica)";
                }
                else
                {
                    GridView1.Rows[i].Cells[7].Text = producto.marca.ToString() + "(" + subMarca.subM.ToString() + ")";
                }

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

                //try
                //{
                //     monto = 1 + double.Parse(txtInteres.Text, culture);
                //    monto*= total2;
                //    intereses = monto - double.Parse(txtDinero.Text); 
                //}
                //catch
                //{
                //    var interes = 0;
                //    monto = total2 * (1 + interes);
                //}


                
                //total2 = monto;

            }

            lblTotal2.Text = total2.ToString("0.00");
            lblTotal.Text = total.ToString("0.00");
        }
    }
}