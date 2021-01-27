using System;
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

           
                document.Open();

                var image = iTextSharp.text.Image.GetInstance(@"C:\Users\RodrigoM\Desktop\Sitema-XIU-GAR\ProyectoPaslum\ProjectPaslum\Alumno\images\XIUGAR.jpg");
                // iTextSharp.text.Image image1 = iTextSharp.text.Image.GetInstance("../images/avatar.png");
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
            Paragraph FechaEntrega = new Paragraph(16, "Fecha de entrega: " + calEntrega.SelectedDate, font9);
            Paragraph Confirmo = new Paragraph(16, "Confirmo: " + txtConfirmo.Text, font9);

            document.Add(new Chunk("\n"));

            Paragraph Sub = new Paragraph(16, "Subtotal: " + txtImporte.Text, font9);
            Paragraph Desc = new Paragraph(16, "Descuento: " + txtDescuento.Text, font9);
            Paragraph DescFin = new Paragraph(16, "Desc. Fin: " + txtDescuento.Text, font9);
            Paragraph IEPS = new Paragraph(16, "ISR: -" , font9);
            Paragraph ISR = new Paragraph(16, "IVA: " + txtIVA.Text, font9);
            Paragraph IVA = new Paragraph(16, "I.V.A: -" , font9);

            document.Add(new Chunk("\n"));

            Paragraph Total = new Paragraph(16, "Total: " + txtImporte.Text, font9);
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