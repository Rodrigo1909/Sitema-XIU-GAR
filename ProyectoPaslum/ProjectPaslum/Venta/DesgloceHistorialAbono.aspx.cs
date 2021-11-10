using Modelo;
using ProjectPaslum.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace ProjectPaslum.Venta
{
    public partial class DesgloceHistorialAbono : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                loadGridItems(Convert.ToInt32(Session["desgloce"].ToString()));

                var ventas = (from venta in contexto.tblVenta
                              where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                              select new { id = venta.idVenta, fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

                var resta = (from detalle in contexto.tblHistorialAbono
                             where detalle.fkVenta == int.Parse(Session["desgloce"].ToString())
                             orderby detalle.idHistorialAbono descending
                             select new { res = detalle.dblCantidadAnterior }).FirstOrDefault();

                string ExtraccionYearText = ventas.fecha.ToString();
                var terminoExtraccionYear = ExtraccionYearText.Substring(0, ExtraccionYearText.IndexOf(" "));

                txtFecha.Text = terminoExtraccionYear;
                txtFechaFin.Text = ventas.fin.ToString().Substring(0, 10);

                txtTotal.Text = "$" + Convert.ToDecimal(ventas.total).ToString("#,###.00");
                txtNumVen.Text = ventas.id.ToString();

                var faltante = ventas.total - resta.res;

                txtRestante.Text = "$" + Convert.ToDecimal(faltante).ToString("#,###.00");
            }
            else
            {
                Response.Redirect("../IndexPaslum.aspx", true);
            }
        }


        private void loadGridItems(int idDetalleVenta)
        {           
           try
            {
                var desglozar = (from detalle in contexto.tblDetalleVenta
                                    join producto in contexto.tblProducto 
                                    on detalle.fkProducto equals producto.idProducto
                                    join unidad in contexto.tblUnidadMedida
                                    on producto.fkUnidadMedida equals unidad.idUnidadMedida
                                 where detalle.fkVenta == idDetalleVenta                                 
                                 select new
                                 {
                                     PRODUCTO = "(" + producto.idProducto+ ") " + producto.strNombre + " "+ producto.intPresentacion + " " + unidad.strAbreviatura ,
                                     DESCRIPCIÓN = producto.strDescripcion,
                                     PRESENTACIÓN = producto.intPresentacion + " " + unidad.strAbreviatura,
                                     PRECIO = detalle.dblPrecio,
                                     CANTIDAD = detalle.intCantidad                                    

                                 }).ToList();

                GridView1.DataSource = desglozar;
                GridView1.DataBind();

                var TablaAbono = (from abono in contexto.tblHistorialAbono
                                 join venta in contexto.tblVenta
                                    on abono.fkVenta equals venta.idVenta
                                  orderby abono.idHistorialAbono descending 
                               where abono.fkVenta == idDetalleVenta
                                  select new
                                 {
                                     FECHA = abono.Fecha,
                                     ABONO = "$" + abono.dblCantidad,
                                     TOTAL_DE_ABONO = "$" + abono.dblCantidadAnterior
                                 }).ToList();

                GridView2.DataSource = TablaAbono;
                GridView2.DataBind();


                var TablaArchivo = (from arch in contexto.tblVenta
                                  orderby arch.idVenta descending
                                  where arch.idVenta == idDetalleVenta
                                  select new
                                  {
                                      NOMBRE_DE_LA_NOTA = arch.archNota,
                                      NOMBRE_DE_LA_FACTURA = arch.archFactura
                                  }).ToList();

                GridView3.DataSource = TablaArchivo;
                GridView3.DataBind();


            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtAbono.Text))
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "vacio()", true);               
            }
            else { 

                    DateTime fechact = DateTime.Now;
                    ControllerCliente ctrlClie = new ControllerCliente();
                    tblVenta ven = new tblVenta();
                    ControllerAlmacen ctrlAlm = new ControllerAlmacen();

                    var ultimoregistro = (from ha in contexto.tblHistorialAbono
                                          where ha.fkVenta == int.Parse(Session["desgloce"].ToString())
                                          orderby ha.idHistorialAbono descending
                                          select ha).FirstOrDefault();

                    var ventas = (from venta in contexto.tblVenta
                                  where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                                  select new { fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

                    var suma = ultimoregistro.dblCantidadAnterior + decimal.Parse(txtAbono.Text);

                    if (suma < ventas.total)
                    {
                        tblHistorialAbono HisAbo = new tblHistorialAbono();
                        HisAbo.Fecha = fechact;
                        HisAbo.dblCantidad = decimal.Parse(txtAbono.Text);
                        HisAbo.dblCantidadAnterior = suma;
                        HisAbo.fkVenta = int.Parse(Session["desgloce"].ToString());
                        HisAbo.fkValidacionUsuario = int.Parse(Session["idUsuario"].ToString());

                        ctrlClie.InsertarHistorialAbono(HisAbo);
                        this.Response.Redirect("./AbonoExito.aspx", true);                
                    }
                    else if (suma == ventas.total){
                        tblHistorialAbono HisAbo = new tblHistorialAbono();
                        HisAbo.Fecha = fechact;
                        HisAbo.dblCantidad = decimal.Parse(txtAbono.Text);
                        HisAbo.dblCantidadAnterior = suma;
                        HisAbo.fkVenta = int.Parse(Session["desgloce"].ToString());
                        HisAbo.fkValidacionUsuario = int.Parse(Session["idUsuario"].ToString());

                        ctrlClie.InsertarHistorialAbono(HisAbo);
                        ven.idVenta = int.Parse(Session["desgloce"].ToString());
                        ven.strEstado = "VENTA A CREDITO FINALIZADA";

                        ctrlAlm.EditarFinalizadoCredito(ven);

                        this.Response.Redirect("./AbonoExito.aspx", true);    
                    }
                    else
                    {
                        this.Response.Redirect("./AlertaErrorAbono.aspx", true);
                    }
            }

        }

        protected void btnRegresa_Click(object sender, EventArgs e)
        {
            Response.Redirect("HistorialAbono.aspx");
        }

        protected void btnReimprimir_Click(object sender, EventArgs e)
        {
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);



            var deta = (from detalle2 in contexto.tblDetalleVenta
                        join producto in contexto.tblProducto
                           on detalle2.fkProducto equals producto.idProducto
                        join unidad in contexto.tblUnidadMedida
                           on producto.fkUnidadMedida equals unidad.idUnidadMedida
                        where detalle2.fkVenta == int.Parse(Session["desgloce"].ToString())
                        select new
                        {
                            PRODUCTO = producto.strNombre,
                            PRECIO = detalle2.dblPrecio,
                            CANTIDAD = detalle2.intCantidad,
                            DESCRIPCIÓN = producto.strDescripcion,
                            PRESENTACIÓN = producto.intPresentacion,
                            UNIDAD = unidad.strNombre
                        }).ToList();





           
                var clien = (from venta in contexto.tblVenta

                             join cliente in contexto.tblCliente
                                  on venta.fkCliente equals cliente.idCliente

                             join domicilio in contexto.tblDireccion
                                   on cliente.fkDireccion equals domicilio.idDireccion

                             join detalle2 in contexto.tblDetalleVenta
                                   on venta.idVenta equals detalle2.fkVenta

                             join empleado in contexto.tblEmpleado
                                   on detalle2.fkEmpleado equals empleado.idEmpleado

                             where venta.idVenta == int.Parse(Session["desgloce"].ToString())

                             select new
                             {
                                 fecha = venta.Fecha,
                                 total = venta.dblTotal,
                                 cli = cliente.strNombre + " " + cliente.strApellidoP + " " + cliente.strApellidoM ?? String.Empty,
                                 dire = domicilio.strColonia + ", " + domicilio.strCalle + ", " + domicilio.intCodpost,
                                 empl = empleado.strNombre + " " + empleado.strApellidoP + " " + empleado.strApellidoM,
                                 clie = venta.fkCliente,
                                 interes = venta.dblInteres,
                                 fin = venta.FechaCredito
                             }).FirstOrDefault();

                    //Esta funcion solo funciona para web, de alguna forma no obtiene los valores
                    //necesarios, y cambia la fecha en web.

                    string ExtraccionDia = clien.fecha.ToString();
                    var terminoDia = ExtraccionDia.Substring(0, ExtraccionDia.IndexOf("/"));

                    const string ExtraccionMes = "/";
                    var principioMes = clien.fecha.ToString().Substring(clien.fecha.ToString().IndexOf(ExtraccionMes) + ExtraccionMes.Length);
                    var terminoMes = principioMes.Substring(0, principioMes.IndexOf("/"));

                    string ExtraccionYear = terminoMes + "/";
                    var principioYear = clien.fecha.ToString().Substring(clien.fecha.ToString().IndexOf(ExtraccionYear) + ExtraccionYear.Length);
                    var terminoYear = principioYear.Substring(0, principioYear.IndexOf(" "));


            document.Open();
            
                String ruta = Server.MapPath("../ImagenesProductos/FondoCredito.jpg");

                var fondo = iTextSharp.text.Image.GetInstance(ruta);
                fondo.ScaleAbsoluteWidth(570);
                fondo.ScaleAbsoluteHeight(800);
                fondo.SetAbsolutePosition(0, 50);
                fondo.Alignment = iTextSharp.text.Image.UNDERLYING;

                document.Add(fondo);

                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 13);
                Font font7 = FontFactory.GetFont(FontFactory.TIMES, 12);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                document.Add(new Paragraph(16, " ", font7));
                document.Add(new Chunk("\n"));
                document.Add(new Chunk("\n"));
                document.Add(new Chunk("\n"));
                document.Add(new Chunk("\n"));
                document.Add(new Chunk("\n"));
                document.Add(new Chunk("\n"));

                PdfContentByte dia = writer.DirectContent;
                dia.BeginText();
                BaseFont f_cn = BaseFont.CreateFont("c:\\windows\\fonts\\calibri.ttf", BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
                dia.SetFontAndSize(f_cn, 16);
                dia.SetTextMatrix(410, 655);  //(xPos, yPos)
                dia.ShowText(terminoMes);
                dia.EndText();

                PdfContentByte mes = writer.DirectContent;
                mes.BeginText();
                mes.SetFontAndSize(f_cn, 16);
                mes.SetTextMatrix(450, 655);  //(xPos, yPos)
                mes.ShowText(terminoDia);
                mes.EndText();

                PdfContentByte year = writer.DirectContent;
                year.BeginText();
                year.SetFontAndSize(f_cn, 16);
                year.SetTextMatrix(490, 655);  //(xPos, yPos)
                year.ShowText(terminoYear);
                year.EndText();

                PdfContentByte folio = writer.DirectContent;
                folio.BeginText();
                folio.SetFontAndSize(f_cn, 16);
                folio.SetTextMatrix(450, 615);  //(xPos, yPos)
                folio.ShowText(Session["desgloce"].ToString());
                folio.EndText();

                document.Add(new Paragraph(16, "  Vendedor: " + clien.empl, font7));
                document.Add(new Chunk("\n"));
                document.Add(new Paragraph(16, "  Cliente: " + clien.cli, font7));
                document.Add(new Chunk("\n"));
                document.Add(new Paragraph(16, "  Domicilio: " + clien.dire, font8));
                

                document.Add(new Chunk("\n"));


                PdfPTable table = new PdfPTable(5);
                PdfPTable table2 = new PdfPTable(5);

                table.AddCell("CODIGO");
                table.AddCell("PRODUCTO");
                table.AddCell("CANTIDAD");
                table.AddCell("PRECIO");
                table.AddCell("TOTAL");

                List<tblDetalleVenta> detalle = contexto.tblDetalleVenta.Where(fin => fin.fkVenta == int.Parse(Session["desgloce"].ToString())).ToList();

                foreach (var item in detalle)
                {
                    var tot = item.intCantidad * item.dblPrecio;

                    table2.AddCell(new Paragraph(item.fkProducto.ToString(), font8));
                    table2.AddCell(new Paragraph(item.tblProducto.strNombre + " " + item.tblProducto.intPresentacion + " " + item.tblProducto.tblUnidadMedida.strNombre, font8));
                    table2.AddCell(new Paragraph(item.intCantidad.ToString(), font8));
                    table2.AddCell(new Paragraph(item.dblPrecio.ToString(), font8));
                    table2.AddCell(new Paragraph(tot.ToString(), font8));
                }

                table.WidthPercentage = 90;
                table2.WidthPercentage = 90;

                Paragraph total = new Paragraph(16, "Total: $" + clien.total + "        ", font9);
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                total.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(table);
                document.Add(table2);
                document.Add(total);
                document.Add(gracias);

                if (terminoDia == "1")
                {
                    terminoDia = "enero";
                }
                else if (terminoDia == "2")
                {
                    terminoDia = "febrero";
                }
                else if (terminoDia == "3")
                {
                    terminoDia = "marzo";
                }
                else if (terminoDia == "4")
                {
                    terminoDia = "abril";
                }
                else if (terminoDia == "5")
                {
                    terminoDia = "mayo";
                }
                else if (terminoDia == "6")
                {
                    terminoDia = "junio";
                }
                else if (terminoDia == "7")
                {
                    terminoDia = "julio";
                }
                else if (terminoDia == "8")
                {
                    terminoDia = "agosto";
                }
                else if (terminoDia == "9")
                {
                    terminoDia = "septiembre";
                }
                else if (terminoDia == "10")
                {
                    terminoDia = "agosto";
                }
                else if (terminoDia == "11")
                {
                    terminoDia = "noviembre";
                }
                else if (terminoDia == "12")
                {
                    terminoDia = "diciembre";
                }


            PdfContentByte pagare = writer.DirectContent;

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 285);  //(xPos, yPos)
                pagare.ShowText("Debo(emos) y pagaré(mos) incondicionalmente por este PAGARE a la orden de FELIPA TORRES HERNÁNDEZ, precisamente en su domicilio");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 275);  //(xPos, yPos)
                pagare.ShowText("ubicado en Carretera Pachuca Cd.Sahagún km. 55 S / N Col.Industrial La Paz C.P. 42092 Pachuca de Soto Hgo., o en cualquier otro lugar");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 265);  //(xPos, yPos)
                pagare.ShowText("donde se me requiera el pago el dia " + terminoMes + " de " + terminoDia + " del " +
                terminoYear + " la cantidad de $" + clien.total + " MXN, importe de mercancía recibida de");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 255);  //(xPos, yPos)
                pagare.ShowText("conformidad por conducto de " + clien.cli + " reconociendo de deudor de forma solidaria haber recibido");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 245);  //(xPos, yPos)
                pagare.ShowText("dicho importe y haber facultado a la persona que recibe, para que en su nombre se obligue respecto de la cantidad referida, firmando este");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 235);  //(xPos, yPos)
                pagare.ShowText("a su ruego. Si no se cubre su vencimiento la suma anterior causará ínteres monetarios a la razón del " + clien.interes + "% mensual a partir de la fecha de");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 225);  //(xPos, yPos)
                pagare.ShowText("su vencimiento durante todo el tiempo qué estuviese insoluto sin que este considere prorroga el plazo para el cumplimiento de esta");
                pagare.EndText();

                pagare.BeginText();
                pagare.SetFontAndSize(f_cn, 9);
                pagare.SetTextMatrix(37, 215);  //(xPos, yPos)
                pagare.ShowText("obligación, más los costos y gastos que se generan en cobranza de este documento.");
                pagare.EndText();

                PdfContentByte linea = writer.DirectContent;

                linea.BeginText();
                linea.SetFontAndSize(f_cn, 12);
                linea.SetTextMatrix(150, 160);  //(xPos, yPos)
                linea.ShowText("_____________________________________________");
                linea.EndText();

                PdfContentByte firma = writer.DirectContent;

                firma.BeginText();
                firma.SetFontAndSize(f_cn, 12);
                firma.SetTextMatrix(250, 130);  //(xPos, yPos)
                firma.ShowText("Nombre y Firma");
                firma.EndText();
            
                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Num. Venta: " + int.Parse(Session["desgloce"].ToString()) + "_" + clien.fecha + ".pdf");
                HttpContext.Current.Response.Write(document);
                Response.Flush();
                Response.End();
            
        }

        protected void btnDescargarFactura_Click(object sender, EventArgs e)
        {
            var ArchivoFactura = (from ve in contexto.tblVenta
                                  where ve.idVenta == int.Parse(Session["desgloce"].ToString())
                                  select new { factura = ve.archFactura }).FirstOrDefault();

            string NombreFactura = ArchivoFactura.factura;

            if (NombreFactura == "NO EXISTE")
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "bajar()", true);
            }
            else
            {

                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=" + NombreFactura);

                String ruta = Server.MapPath("../Venta/Archivos/" + NombreFactura);

                HttpContext.Current.Response.BinaryWrite(System.IO.File.ReadAllBytes(ruta));
                Response.Flush();
                Response.End();
            }
        }

        protected void btnSubirNota_Click(object sender, EventArgs e)
        {
            tblVenta ven = new tblVenta();
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();

            if (archivoNota.HasFile)
            {
                string path = Server.MapPath("~/Venta/Archivos/" + archivoNota.FileName);
                archivoNota.SaveAs(path);


                ven.idVenta = int.Parse(Session["desgloce"].ToString());
                ven.archNota = archivoNota.FileName;

                ctrlAlm.InsertarArchivoNota(ven);

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "subir()", true);
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "bajar()", true);
            }
        }

        protected void btnSubirFactura_Click(object sender, EventArgs e)
        {
            tblVenta ven = new tblVenta();
            ControllerAlmacen ctrlAlm = new ControllerAlmacen();

            if (archivoFactura.HasFile)
            {
                string path = Server.MapPath("~/Venta/Archivos/" + archivoFactura.FileName);
                archivoFactura.SaveAs(path);

                
                ven.idVenta = int.Parse(Session["desgloce"].ToString());                
                ven.archFactura = archivoFactura.FileName;

                ctrlAlm.InsertarArchivoFactura(ven);
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "subir()", true);
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "bajar()", true);
            }
        }

        protected void btnDescargarFirma_Click(object sender, EventArgs e)
        {
            var ArchivoNota = (from ve in contexto.tblVenta
                                  where ve.idVenta == int.Parse(Session["desgloce"].ToString())
                                  select new { Nota = ve.archNota }).FirstOrDefault();

            string NombreNota = ArchivoNota.Nota;

            if (NombreNota == "NO EXISTE")
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "bajar()", true);
            }
            else
            {
                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=" + NombreNota);

                String ruta = Server.MapPath("../Venta/Archivos/" + NombreNota);

                HttpContext.Current.Response.BinaryWrite(System.IO.File.ReadAllBytes(ruta));
                Response.Flush();
                Response.End();
            }
        }
    }
}