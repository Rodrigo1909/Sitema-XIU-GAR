using Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ProjectPaslum.Controllers;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Globalization;


namespace ProjectPaslum.Venta
{
    public partial class DesgloceRequisicionVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                loadGridItems(Convert.ToInt32(Session["desgloce"].ToString()));

                var ventas = (from venta in contexto.tblVenta
                              where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                              select new { id = venta.idVenta, fecha = venta.Fecha, hora = venta.strHoraEntega, fin = venta.strFechaEntega }).FirstOrDefault();

                txtFecha.Text = ventas.fecha.ToString().Substring(0, 9);
                txtFechaFin.Text = ventas.fin.ToString();
                txtHoraEntrega.Text = ventas.hora.ToString();
                txtNumVen.Text = ventas.id.ToString();
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
                                     PRODUCTO = producto.strNombre,
                                     DESCRIPCIÓN = producto.strDescripcion,
                                     PRESENTACIÓN = producto.intPresentacion,
                                     CANTIDAD = detalle.intCantidad,
                                     UNIDAD = unidad.strNombre
                                 }).ToList();

                GridView1.DataSource = desglozar;
                GridView1.DataBind();

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

        protected void btnRegresa_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebVenta.aspx");
        }

        protected void btnReimprimir_Click(object sender, EventArgs e)
        {
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);          

            var ventas = (from venta in contexto.tblVenta

                          join detalle in contexto.tblDetalleVenta
                                on venta.idVenta equals detalle.fkVenta

                          join empleado in contexto.tblEmpleado
                                on detalle.fkEmpleado equals empleado.idEmpleado

                          where venta.idVenta == int.Parse(Session["desgloce"].ToString())
                                
                          select new { fecha = venta.Fecha,       
                                       total = venta.dblTotal,      
                                       efe = venta.dblAbono,                                                                 
                                       empl = empleado.strNombre + " " + empleado.strApellidoP + " " + empleado.strApellidoM,
                                       clie = venta.fkCliente}).FirstOrDefault();

                var deta = (from detalle in contexto.tblDetalleVenta
                            join producto in contexto.tblProducto
                               on detalle.fkProducto equals producto.idProducto
                            join unidad in contexto.tblUnidadMedida
                               on producto.fkUnidadMedida equals unidad.idUnidadMedida
                            where detalle.fkVenta == int.Parse(Session["desgloce"].ToString())
                            select new
                            {
                                PRODUCTO = producto.strNombre,
                                PRECIO = detalle.dblPrecio,
                                CANTIDAD = detalle.intCantidad,
                                DESCRIPCIÓN = producto.strDescripcion,
                                PRESENTACIÓN = producto.intPresentacion,
                                UNIDAD = unidad.strNombre
                            }).ToList();





            if (ventas.clie == null)
                {

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
                Font font7 = FontFactory.GetFont(FontFactory.TIMES, 13);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);
                

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "N° Venta: " + int.Parse(Session["desgloce"].ToString()), font7));
                document.Add(new Paragraph(16, "Vendedor: " + ventas.empl, font7));
                document.Add(new Paragraph(16, "Cliente: MOSTRADOR", font7));
                document.Add(new Paragraph(16, "Domicilio: Oficina XIU-GAR", font7));
                document.Add(new Paragraph(16, "Fecha: " + ventas.fecha.ToString().Substring(0,9), font7));

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

                Paragraph total = new Paragraph(16, "Total: $" + ventas.total, font9);
                Paragraph efectivo = new Paragraph(16, "Efectivo: $" + ventas.efe, font9);
                Paragraph cambio = new Paragraph(16, "Cambio: $" + (ventas.efe - ventas.total), font9);
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                total.Alignment = Element.ALIGN_RIGHT;
                efectivo.Alignment = Element.ALIGN_RIGHT;
                cambio.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(table);
                document.Add(table2);
                document.Add(total);
                document.Add(efectivo);
                document.Add(cambio);
                document.Add(gracias);
                



                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Num. Venta: " + int.Parse(Session["desgloce"].ToString()) + "_" + ventas.fecha + ".pdf");
                HttpContext.Current.Response.Write(document);
                Response.Flush();
                Response.End();
                }

                else
                {
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
                                   clie = venta.fkCliente
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
                Font font7 = FontFactory.GetFont(FontFactory.TIMES, 13);
                Font font8 = FontFactory.GetFont(FontFactory.TIMES, 9);

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "N° Venta: " + int.Parse(Session["desgloce"].ToString()), font7));
                document.Add(new Paragraph(16, "Vendedor: " + clien.empl, font7));
                document.Add(new Paragraph(16, "Cliente: " + clien.cli, font7));
                document.Add(new Paragraph(16, "Domicilio: " + clien.dire, font7));
                document.Add(new Paragraph(16, "Fecha: " + clien.fecha.ToString().Substring(0, 9), font7));

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

                Paragraph total = new Paragraph(16, "Total: $" + ventas.total, font9);
                Paragraph efectivo = new Paragraph(16, "Efectivo: $" + ventas.efe, font9);
                Paragraph cambio = new Paragraph(16, "Cambio: $" + (ventas.efe - ventas.total), font9);
                document.Add(new Chunk("\n"));
                Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                total.Alignment = Element.ALIGN_RIGHT;
                efectivo.Alignment = Element.ALIGN_RIGHT;
                cambio.Alignment = Element.ALIGN_RIGHT;
                gracias.Alignment = Element.ALIGN_CENTER;

                document.Add(table);
                document.Add(table2);
                document.Add(total);
                document.Add(efectivo);
                document.Add(cambio);
                document.Add(gracias);
                



                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Num. Venta: " + int.Parse(Session["desgloce"].ToString()) + "_" + ventas.fecha + ".pdf");
                HttpContext.Current.Response.Write(document);
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
    }
}