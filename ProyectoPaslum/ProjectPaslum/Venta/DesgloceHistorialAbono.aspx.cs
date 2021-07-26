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
            loadGridItems(Convert.ToInt32(Session["desgloce"].ToString()));

            var ventas = (from venta in contexto.tblVenta
                           where venta.idVenta ==  int.Parse(Session["desgloce"].ToString())
                           select new { id = venta.idVenta,fecha = venta.Fecha, fin = venta.FechaCredito, total = venta.dblTotal }).FirstOrDefault();

            var resta = (from detalle in contexto.tblHistorialAbono
                         where detalle.fkVenta == int.Parse(Session["desgloce"].ToString())
                         orderby detalle.idHistorialAbono descending
                         select new {res = detalle.dblCantidadAnterior }).FirstOrDefault();

            txtFecha.Text = ventas.fecha.ToString().Substring(0, 10);
            txtFechaFin.Text = ventas.fin.ToString().Substring(0, 10);

            txtTotal.Text = "$" + Convert.ToDecimal(ventas.total).ToString("#,###.00");
            txtNumVen.Text = ventas.id.ToString();

            var faltante = ventas.total - resta.res ;

            txtRestante.Text = "$" + Convert.ToDecimal(faltante).ToString("#,###.00");
        }


        private void loadGridItems(int idDetalleVenta)
        {           
           try
            {
                var desglozar = (from detalle in contexto.tblDetalleVenta
                                    join producto in contexto.tblProducto 
                                    on detalle.fkProducto equals producto.idProducto
                                 where detalle.fkVenta == idDetalleVenta                                 
                                 select new
                                 {
                                     PRODUCTO = producto.strNombre,
                                     DESCRIPCIÓN = producto.strDescripcion,
                                     PRESENTACIÓN = producto.intPresentacion,
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

                        this.Response.Redirect("./AlertaExito.aspx", true);
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

                document.Open();

               String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

               var image = iTextSharp.text.Image.GetInstance(rutaLogo);

                // iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance("../images/avatar.png");
                //image1.ScalePercent(50f);

                image.ScaleAbsoluteWidth(240);
                image.ScaleAbsoluteHeight(110);
                image.SetAbsolutePosition(350, 720);
                document.Add(image);


                Font fontTitle = FontFactory.GetFont(FontFactory.COURIER_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 13);
                Font font7 = FontFactory.GetFont(FontFactory.TIMES, 12);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "N° Venta: " + int.Parse(Session["desgloce"].ToString()), font7));
                document.Add(new Paragraph(16, "Vendedor: " + clien.empl, font7));
                document.Add(new Paragraph(16, "Cliente: " + clien.cli, font7));
                document.Add(new Paragraph(16, "Domicilio: " + clien.dire, font7));
                document.Add(new Paragraph(16, "Fecha: " + clien.fecha.ToString().Substring(0, 10), font7));

                document.Add(new Chunk("\n"));


                PdfPTable table = new PdfPTable(5);
                PdfPTable table2 = new PdfPTable(5);

                table.AddCell("CODIGO");
                table.AddCell("DESCRIPCIÓN");
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

                Paragraph total = new Paragraph(16, "Total: $" + clien.total, font9);
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                total.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(table);
                document.Add(table2);
                document.Add(total);
                document.Add(gracias);

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "Debo(emos) y pagaré(mos) incondicionalmente por este PAGARE a la orden de FELIPA TORRES HERNÁNDEZ," +
                " precisamente en su domicilio ubicado en Carrretera Pachuca Cd. Sahagún km. 55 S/N Col. Industrial La Paz C.P. 42092 " +
                "Pachuca de Soto Hgo., o en cualquier otro lugar donde se me requiera el pago el dia " +
                (clien.fin.ToString().Substring(0, 2)) + " de " + (clien.fin.ToString().Substring(3, 2)) + " del " + 
                (clien.fin.ToString().Substring(6, 4)) +
                " la cantidad de $" + clien.total + " MXN, importe de mercancía recibida de conformidad por conducto de " + clien.cli +
                " reconociendo de deudor de forma solidaria haber recibido dicho importe y haber facultado a la persona que recibe, para que en su nombre se obligue " +
                "respecto de la cantidad referida, firmando este a su ruego. Si no se cubre su vencimiento la suma anterior causará " +
                "ínteres monetarios a la razón del " + clien.interes + "% mensual a partir de la fecha de su vencimiento durante todo el tiempo qué " +
                "estuviese insoluto sin que este considere prorroga el plazo para el cumplimiento de esta obligación, más los costos " +
                "y gastos que se generan en cobranza de este documento.", font7));

                document.Add(new Chunk("\n"));

                Paragraph linea = new Paragraph(string.Format("_________________________________"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20));
                Paragraph firma = new Paragraph(string.Format("Nombre y Firma"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 15));

                linea.Alignment = Element.ALIGN_CENTER;
                document.Add(linea);
                firma.Alignment = Element.ALIGN_CENTER;
                document.Add(firma);

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