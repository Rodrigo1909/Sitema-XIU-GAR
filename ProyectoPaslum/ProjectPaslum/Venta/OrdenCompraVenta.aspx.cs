﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using ProjectPaslum.Controllers;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Globalization;

namespace ProjectPaslum.Venta
{
    public partial class OrdenCompraVenta : System.Web.UI.Page
    {
        PaslumBaseDatoDataContext contexto = new PaslumBaseDatoDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] != null)
                {
                    txtComprador.Text = (Session["CompletoNombre"].ToString());
                    //lbEmpleado.Text = (Session["id"].ToString());                    
                    this.LlenarProveedor();

                    txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
                }
                else
                {
                    Response.Redirect("../IndexPaslum.aspx", true);
                }                
            }
        }

        private void LlenarProveedor()
        {


            var provee = (from pro in contexto.tblProveedor
                        select new { nombre = pro.strNombre + " " + pro.strApellidoP + " " + pro.strApellidoM, id = pro.idProveedor }).ToList();

            ddlProveedor.Items.Add("SELECCIONAR");
            ddlProveedor.DataValueField = "id";
            ddlProveedor.DataTextField = "nombre";
            ddlProveedor.DataSource = provee;
            ddlProveedor.DataBind();


        }

        protected void ddlProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDomicilio.Items.Clear();
            ddlTelefono.Items.Clear();
            ddlCorreo.Items.Clear();

            var proveedor = (from prov in contexto.tblProveedor

                           join dom in contexto.tblDireccion
                           on prov.fkDireccion
                           equals dom.idDireccion

                            join tel in contexto.tblTelefono
                            on prov.fkTelefono
                            equals tel.idTelefono

                            where prov.idProveedor == Convert.ToInt32(ddlProveedor.SelectedValue)                            

                           select new { colonia = dom.strColonia + ", " + dom.strCalle + ", " + dom.intCodpost,
                                        telefono = "(" + tel.strCelular + ") " + "(" + tel.strTelCasa + ") " + "(" + tel.strOtro + ")",
                                        correo = prov.strCorreo
                           }).ToList();

            ddlDomicilio.DataValueField = "colonia";
            ddlDomicilio.DataTextField = "colonia";
            ddlDomicilio.DataSource = proveedor;
            ddlDomicilio.DataBind();

            ddlTelefono.DataValueField = "telefono";
            ddlTelefono.DataTextField = "telefono";
            ddlTelefono.DataSource = proveedor;
            ddlTelefono.DataBind();

            ddlCorreo.DataValueField = "correo";
            ddlCorreo.DataTextField = "correo";
            ddlCorreo.DataSource = proveedor;
            ddlCorreo.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);
            DateTime fechact = DateTime.Now;
            CultureInfo culture = new CultureInfo("en-US");




            //Si no tiene iva ni descuento entra aqui
            if (string.IsNullOrWhiteSpace(txtIVA.Text) == true && (string.IsNullOrWhiteSpace(txtDescuento.Text)) == true)
            {
                document.Open();

                String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                image.ScaleAbsoluteWidth(270);
                image.ScaleAbsoluteHeight(160);
                image.SetAbsolutePosition(300, 650);
                document.Add(image);


                Font fontTitle = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 10);


                Paragraph title = new Paragraph(string.Format("ORDEN DE COMPRA\nXiugar S. de R.L d C.V."), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                title.Alignment = Element.ALIGN_LEFT;
                document.Add(title);

                //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "Proveedor: " + txtComprador.Text, font9));
                document.Add(new Paragraph(16, "Dirección: " + ddlDomicilio.Text, font9));
                document.Add(new Paragraph(16, "Teléfono: " + ddlTelefono.Text, font9));
                document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));
                document.Add(new Paragraph(16, "Correo: " + ddlCorreo.Text, font9));
                document.Add(new Paragraph(16, "Entregar a: " + txtEntregar.Text, font9));
                document.Add(new Chunk("\n"));

                PdfPTable table = new PdfPTable(5);
                table.WidthPercentage = 100;
                // Esta es la primera fila
                table.AddCell("Cantidad");
                table.AddCell("Producto");
                table.AddCell("Descripción");
                table.AddCell("Costo Unitario");
                table.AddCell("Importe");
                // Segunda fila
                table.AddCell(txtCantidad.Text);
                table.AddCell(txtProducto.Text);
                table.AddCell(txtDescripcion.Text);
                table.AddCell(txtCostoUni.Text);
                table.AddCell(txtImporte.Text);


                document.Add(table);

                //Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: $" + (calEntrega.ToString().Substring(0, 2)) + " de " + (calEntrega.ToString().Substring(3, 2)) + " del " + (
                //        calEntrega.ToString().Substring(6, 4)) , font9);
                Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: " + calEntregas.Text, font9);
                Paragraph Confirmo = new Paragraph(16, "Confirmo: " + txtConfirmo.Text, font9);

                document.Add(new Chunk("\n"));

                Paragraph Sub = new Paragraph(16, "Subtotal: $" + txtImporte.Text, font9);
                Paragraph Desc = new Paragraph(16, "Descuento: $0", font9);
                Paragraph IEPS = new Paragraph(16, "ISR: -", font9);
                Paragraph ISR = new Paragraph(16, "IVA: 0%    $0", font9);
                Paragraph IVA = new Paragraph(16, "I.V.A: -", font9);

                document.Add(new Chunk("\n"));

                Paragraph Total = new Paragraph(16, "Total: $" + txtImporte.Text, font9);
                //Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                FechaEntrega.Alignment = Element.ALIGN_LEFT;
                Confirmo.Alignment = Element.ALIGN_LEFT;


                Sub.Alignment = Element.ALIGN_RIGHT;
                Desc.Alignment = Element.ALIGN_RIGHT;
                IEPS.Alignment = Element.ALIGN_RIGHT;
                ISR.Alignment = Element.ALIGN_RIGHT;
                IVA.Alignment = Element.ALIGN_RIGHT;
                document.Add(new Chunk("\n"));
                Total.Alignment = Element.ALIGN_RIGHT;

                document.Add(FechaEntrega);
                document.Add(Confirmo);

                document.Add(Sub);
                document.Add(Desc);
                document.Add(IEPS);
                document.Add(ISR);
                document.Add(IVA);
                document.Add(new Chunk("\n"));
                document.Add(Total);

                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=OrdenCompra_" + fechact + ".pdf");
                HttpContext.Current.Response.Write(document);
                Response.Flush();
                Response.End();
            }

            //Si contiene iva y descuento
            else if (string.IsNullOrWhiteSpace(txtIVA.Text) == false && (string.IsNullOrWhiteSpace(txtDescuento.Text)) == false)
            {
                //Aqui cae si se tiene descuento e Iva
                var Descuen = (decimal.Parse(txtImporte.Text, culture) - decimal.Parse(txtDescuento.Text, culture));
                var iva = ((decimal.Parse(txtImporte.Text, culture) * int.Parse(txtIVA.Text)) / 100);
                var TotalF = (Descuen + iva);

                document.Open();

                String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                //image1.ScalePercent(50f);
                image.ScaleAbsoluteWidth(270);
                image.ScaleAbsoluteHeight(160);
                image.SetAbsolutePosition(300, 650);
                document.Add(image);


                Font fontTitle = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 25);
                Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 10);



                Paragraph title = new Paragraph(string.Format("ORDEN DE COMPRA\nXiugar S. de R.L d C.V."), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                title.Alignment = Element.ALIGN_LEFT;
                document.Add(title);

                //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                document.Add(new Chunk("\n"));

                document.Add(new Paragraph(16, "Proveedor: " + txtComprador.Text, font9));
                document.Add(new Paragraph(16, "Dirección: " + ddlDomicilio.Text, font9));
                document.Add(new Paragraph(16, "Teléfono: " + ddlTelefono.Text, font9));
                document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));
                document.Add(new Paragraph(16, "Correo: " + ddlCorreo.Text, font9));
                document.Add(new Paragraph(16, "Entregar a: " + txtEntregar.Text, font9));
                document.Add(new Chunk("\n"));

                PdfPTable table = new PdfPTable(5);
                table.WidthPercentage = 100;
                // Esta es la primera fila
                table.AddCell("Cantidad");
                table.AddCell("Producto");
                table.AddCell("Descripción");
                table.AddCell("Costo Unitario");
                table.AddCell("Importe");
                // Segunda fila
                table.AddCell(txtCantidad.Text);
                table.AddCell(txtProducto.Text);
                table.AddCell(txtDescripcion.Text);
                table.AddCell(txtCostoUni.Text);
                table.AddCell(txtImporte.Text);


                document.Add(table);

                //Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: $" + (calEntrega.ToString().Substring(0, 2)) + " de " + (calEntrega.ToString().Substring(3, 2)) + " del " + (
                //        calEntrega.ToString().Substring(6, 4)) , font9);
                Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: " + calEntregas.Text, font9);
                Paragraph Confirmo = new Paragraph(16, "Confirmo: " + txtConfirmo.Text, font9);

                document.Add(new Chunk("\n"));

                Paragraph Sub = new Paragraph(16, "Subtotal: $" + txtImporte.Text, font9);
                Paragraph Desc = new Paragraph(16, "Descuento: $" + txtDescuento.Text, font9);
                Paragraph DescFin = new Paragraph(16, "Desc. Fin: $" + Descuen, font9);
                Paragraph IEPS = new Paragraph(16, "ISR: -", font9);
                Paragraph ISR = new Paragraph(16, "IVA: " + txtIVA.Text + "%    $" + iva, font9);
                Paragraph IVA = new Paragraph(16, "I.V.A: -", font9);

                document.Add(new Chunk("\n"));

                Paragraph Total = new Paragraph(16, "Total: $" + TotalF, font9);
                //Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                FechaEntrega.Alignment = Element.ALIGN_LEFT;
                Confirmo.Alignment = Element.ALIGN_LEFT;


                Sub.Alignment = Element.ALIGN_RIGHT;
                Desc.Alignment = Element.ALIGN_RIGHT;
                DescFin.Alignment = Element.ALIGN_RIGHT;
                IEPS.Alignment = Element.ALIGN_RIGHT;
                ISR.Alignment = Element.ALIGN_RIGHT;
                IVA.Alignment = Element.ALIGN_RIGHT;
                document.Add(new Chunk("\n"));
                Total.Alignment = Element.ALIGN_RIGHT;

                document.Add(FechaEntrega);
                document.Add(Confirmo);

                document.Add(Sub);
                document.Add(Desc);
                document.Add(DescFin);
                document.Add(IEPS);
                document.Add(ISR);
                document.Add(IVA);
                document.Add(new Chunk("\n"));
                document.Add(Total);

                document.Close();

                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=OrdenCompra_" + fechact + ".pdf");
                HttpContext.Current.Response.Write(document);
                Response.Flush();
                Response.End();
            }

            else
            {


                //if para comprobar si esta lleno el campo de descuento
                if (string.IsNullOrWhiteSpace(txtDescuento.Text))
                {

                }
                //si tiene descuento cae aqui
                else
                {
                    var Descuen = (decimal.Parse(txtImporte.Text, culture) - decimal.Parse(txtDescuento.Text, culture));

                    document.Open();

                    String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                    var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                    image.ScaleAbsoluteWidth(270);
                    image.ScaleAbsoluteHeight(160);
                    image.SetAbsolutePosition(300, 650);
                    document.Add(image);


                    Font fontTitle = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 25);
                    Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 10);



                    Paragraph title = new Paragraph(string.Format("ORDEN DE COMPRA\nXiugar S. de R.L d C.V."), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                    title.Alignment = Element.ALIGN_LEFT;
                    document.Add(title);

                    //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                    document.Add(new Chunk("\n"));

                    document.Add(new Paragraph(16, "Proveedor: " + txtComprador.Text, font9));
                    document.Add(new Paragraph(16, "Dirección: " + ddlDomicilio.Text, font9));
                    document.Add(new Paragraph(16, "Teléfono: " + ddlTelefono.Text, font9));
                    document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));
                    document.Add(new Paragraph(16, "Correo: " + ddlCorreo.Text, font9));
                    document.Add(new Paragraph(16, "Entregar a: " + txtEntregar.Text, font9));
                    document.Add(new Chunk("\n"));

                    PdfPTable table = new PdfPTable(5);
                    table.WidthPercentage = 100;
                    // Esta es la primera fila
                    table.AddCell("Cantidad");
                    table.AddCell("Producto");
                    table.AddCell("Descripción");
                    table.AddCell("Costo Unitario");
                    table.AddCell("Importe");
                    // Segunda fila
                    table.AddCell(txtCantidad.Text);
                    table.AddCell(txtProducto.Text);
                    table.AddCell(txtDescripcion.Text);
                    table.AddCell(txtCostoUni.Text);
                    table.AddCell(txtImporte.Text);


                    document.Add(table);

                    //Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: $" + (calEntrega.ToString().Substring(0, 2)) + " de " + (calEntrega.ToString().Substring(3, 2)) + " del " + (
                    //        calEntrega.ToString().Substring(6, 4)) , font9);
                    Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: " + calEntregas.Text, font9);
                    Paragraph Confirmo = new Paragraph(16, "Confirmo: " + txtConfirmo.Text, font9);

                    document.Add(new Chunk("\n"));

                    Paragraph Sub = new Paragraph(16, "Subtotal: $" + txtImporte.Text, font9);
                    Paragraph Desc = new Paragraph(16, "Descuento: $" + txtDescuento.Text, font9);
                    Paragraph DescFin = new Paragraph(16, "Desc. Fin: $" + Descuen, font9);
                    Paragraph IEPS = new Paragraph(16, "ISR: -", font9);
                    Paragraph ISR = new Paragraph(16, "IVA: 0%", font9);
                    Paragraph IVA = new Paragraph(16, "I.V.A: -", font9);

                    document.Add(new Chunk("\n"));

                    Paragraph Total = new Paragraph(16, "Total: $" + Descuen, font9);
                    //Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                    FechaEntrega.Alignment = Element.ALIGN_LEFT;
                    Confirmo.Alignment = Element.ALIGN_LEFT;


                    Sub.Alignment = Element.ALIGN_RIGHT;
                    Desc.Alignment = Element.ALIGN_RIGHT;
                    DescFin.Alignment = Element.ALIGN_RIGHT;
                    IEPS.Alignment = Element.ALIGN_RIGHT;
                    ISR.Alignment = Element.ALIGN_RIGHT;
                    IVA.Alignment = Element.ALIGN_RIGHT;
                    document.Add(new Chunk("\n"));
                    Total.Alignment = Element.ALIGN_RIGHT;

                    document.Add(FechaEntrega);
                    document.Add(Confirmo);

                    document.Add(Sub);
                    document.Add(Desc);
                    document.Add(DescFin);
                    document.Add(IEPS);
                    document.Add(ISR);
                    document.Add(IVA);
                    document.Add(new Chunk("\n"));
                    document.Add(Total);

                    document.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=OrdenCompra_" + fechact + ".pdf");
                    HttpContext.Current.Response.Write(document);
                    Response.Flush();
                    Response.End();
                }


                //if para comprobar si esta lleno el campo de Iva
                if (string.IsNullOrWhiteSpace(txtIVA.Text))
                {

                }
                //si tiene IVA cae aqui
                else
                {

                    //Aqui cae si no se se tiene descuento pero si Iva
                    var iva = ((decimal.Parse(txtImporte.Text, culture) * int.Parse(txtIVA.Text)) / 100);
                    var TotalInicio = (decimal.Parse(txtImporte.Text, culture) + iva);


                    document.Open();
                    String rutaLogo = Server.MapPath("../Alumno/images/XIUGAR.jpg");

                    var image = iTextSharp.text.Image.GetInstance(rutaLogo);
                    //image1.ScalePercent(50f);
                    image.ScaleAbsoluteWidth(270);
                    image.ScaleAbsoluteHeight(160);
                    image.SetAbsolutePosition(300, 650);
                    document.Add(image);


                    Font fontTitle = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 25);
                    Font font9 = FontFactory.GetFont(FontFactory.HELVETICA, 10);



                    Paragraph title = new Paragraph(string.Format("ORDEN DE COMPRA\nXiugar S. de R.L d C.V."), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 20, iTextSharp.text.Font.BOLD));
                    title.Alignment = Element.ALIGN_LEFT;
                    document.Add(title);

                    //document.Add(new Paragraph(20, "Ticket XIU-GAR", fontTitle));

                    document.Add(new Chunk("\n"));

                    document.Add(new Paragraph(16, "Proveedor: " + txtComprador.Text, font9));
                    document.Add(new Paragraph(16, "Dirección: " + ddlDomicilio.Text, font9));
                    document.Add(new Paragraph(16, "Teléfono: " + ddlTelefono.Text, font9));
                    document.Add(new Paragraph(16, "Fecha: " + DateTime.Now.Date.ToString().Substring(0, 10), font9));
                    document.Add(new Paragraph(16, "Correo: " + ddlCorreo.Text, font9));
                    document.Add(new Paragraph(16, "Entregar a: " + txtEntregar.Text, font9));
                    document.Add(new Chunk("\n"));
                    
                    PdfPTable table = new PdfPTable(5);
                    table.WidthPercentage = 100;
                    // Esta es la primera fila
                    table.AddCell("Cantidad");
                    table.AddCell("Producto");
                    table.AddCell("Descripción");
                    table.AddCell("Costo Unitario");
                    table.AddCell("Importe");
                    // Segunda fila
                    table.AddCell(txtCantidad.Text);
                    table.AddCell(txtProducto.Text);
                    table.AddCell(txtDescripcion.Text);
                    table.AddCell(txtCostoUni.Text);
                    table.AddCell(txtImporte.Text);


                    document.Add(table);

                    //Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: $" + (calEntrega.ToString().Substring(0, 2)) + " de " + (calEntrega.ToString().Substring(3, 2)) + " del " + (
                    //        calEntrega.ToString().Substring(6, 4)) , font9);
                    Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: " + calEntregas.Text, font9);
                    Paragraph Confirmo = new Paragraph(16, "Confirmo: " + txtConfirmo.Text, font9);

                    document.Add(new Chunk("\n"));

                    Paragraph Sub = new Paragraph(16, "Subtotal: $" + txtImporte.Text, font9);
                    Paragraph Desc = new Paragraph(16, "Descuento: $" + txtDescuento.Text, font9);
                    Paragraph DescFin = new Paragraph(16, "Desc. Fin: $0.00", font9);
                    Paragraph IEPS = new Paragraph(16, "ISR: -", font9);
                    Paragraph ISR = new Paragraph(16, "IVA: " + txtIVA.Text + "%    $" + iva, font9);
                    Paragraph IVA = new Paragraph(16, "I.V.A: -", font9);

                    document.Add(new Chunk("\n"));

                    Paragraph Total = new Paragraph(16, "Total: $" + TotalInicio, font9);
                    //Paragraph gracias = new Paragraph(18, "Gracias por su compra, vuelva pronto.", font9);


                    FechaEntrega.Alignment = Element.ALIGN_LEFT;
                    Confirmo.Alignment = Element.ALIGN_LEFT;


                    Sub.Alignment = Element.ALIGN_RIGHT;
                    Desc.Alignment = Element.ALIGN_RIGHT;
                    DescFin.Alignment = Element.ALIGN_RIGHT;
                    IEPS.Alignment = Element.ALIGN_RIGHT;
                    ISR.Alignment = Element.ALIGN_RIGHT;
                    IVA.Alignment = Element.ALIGN_RIGHT;
                    document.Add(new Chunk("\n"));
                    Total.Alignment = Element.ALIGN_RIGHT;

                    document.Add(FechaEntrega);
                    document.Add(Confirmo);

                    document.Add(Sub);
                    document.Add(Desc);
                    document.Add(DescFin);
                    document.Add(IEPS);
                    document.Add(ISR);
                    document.Add(IVA);
                    document.Add(new Chunk("\n"));
                    document.Add(Total);

                    document.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=OrdenCompra_" + fechact + ".pdf");
                    HttpContext.Current.Response.Write(document);
                    Response.Flush();
                    Response.End();
                }
            }



        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            txtDescuento.Enabled = CheckBox1.Checked;
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            txtIVA.Enabled = CheckBox2.Checked;
        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {
            txtIVA2.Enabled = CheckBox3.Checked;
        }

        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {
            txtISR.Enabled = CheckBox4.Checked;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime fechact = DateTime.Now;
            ControllerCliente ctrlCli = new ControllerCliente();
            CultureInfo culture = new CultureInfo("en-US");    

            tblOrdenCompra ord = new tblOrdenCompra();
            ord.Fecha = fechact;
            ord.strNumOrden = null;
            ord.strLugar = txtEntregar.Text;
            ord.strCantidad = txtCantidad.Text;
            ord.strProducto = txtProducto.Text;
            ord.strDescripcion = txtDescripcion.Text;
            ord.strConfirmo = txtConfirmo.Text;
            ord.fechaEntrega = Convert.ToDateTime(calEntregas.Text); ;            
            ord.fkEmpleado = int.Parse(Session["id"].ToString());
            ord.fkProveedor = Convert.ToInt32(ddlProveedor.SelectedValue);

            //Si no tiene iva ni descuento entra aqui
            if (string.IsNullOrWhiteSpace(txtIVA.Text) == true && (string.IsNullOrWhiteSpace(txtDescuento.Text)) == true)
            {
                ord.dblCostoUnitario = (decimal.Parse(txtCostoUni.Text, culture));
                ord.dblImporte = (decimal.Parse(txtImporte.Text, culture));
                ord.dblTotal = decimal.Parse(txtImporte.Text, culture);
            }

            else if  (string.IsNullOrWhiteSpace(txtIVA.Text) == false && (string.IsNullOrWhiteSpace(txtDescuento.Text)) == false)
            {
                var Descuen = (decimal.Parse(txtImporte.Text, culture) - decimal.Parse(txtDescuento.Text, culture));
                var iva = (Descuen * int.Parse(txtIVA.Text) / 100);
                var TotalInicio = (Descuen + iva);
                

                ord.dblCostoUnitario = (decimal.Parse(txtCostoUni.Text, culture));
                ord.dblDescuento = decimal.Parse(txtDescuento.Text, culture);
                ord.dblDescuentoFin = Descuen;
                ord.intIva = int.Parse(txtIVA.Text);
                ord.dblImporte = (decimal.Parse(txtImporte.Text, culture));
                ord.dblTotal = TotalInicio;
            }

            else
            { 


            if (string.IsNullOrWhiteSpace(txtDescuento.Text))
            {
                ord.dblDescuento = null;
            }
                 //si tiene descuento cae aqui
                else
                {
                    var Descuen = (decimal.Parse(txtImporte.Text, culture) - decimal.Parse(txtDescuento.Text, culture));

                    ord.dblCostoUnitario = decimal.Parse(txtCostoUni.Text, culture);
                    ord.dblDescuento = decimal.Parse(txtDescuento.Text, culture);
                    ord.dblDescuentoFin = Descuen;
                    ord.dblImporte = (decimal.Parse(txtImporte.Text, culture));
                    ord.dblTotal = Descuen;

                }
            
            if (string.IsNullOrWhiteSpace(txtIVA.Text))
            {
                ord.intIva = null;
            }
                //si tiene IVA cae aqui
                else
                {
                    var iva = ((decimal.Parse(txtImporte.Text, culture) * int.Parse(txtIVA.Text)) / 100);
                    var TotalInicio = (decimal.Parse(txtImporte.Text, culture) + iva);

                    ord.intIva = int.Parse(txtIVA.Text);
                    ord.dblCostoUnitario = (decimal.Parse(txtCostoUni.Text, culture));                    
                    ord.dblImporte = (decimal.Parse(txtImporte.Text, culture));
                    ord.dblTotal = TotalInicio;

                }
            }

            ctrlCli.InsertarOrdenCompra(ord);
            contexto.SubmitChanges();

            this.Response.Redirect("./AlertaExito2.aspx", true);
        }
    }
}