<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="CobrarCreditoVenta.aspx.cs" Inherits="ProjectPaslum.Venta.CobrarCreditoVenta" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>


    <div class="container">
       <div style="text-align:center">
            <h2>Productos seleccionados para comprar a credito</h2>
        </div>

        <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                  <div class="form-group">
                                        <label>N° Venta </label>
                                        <asp:TextBox ID="txtNumVen" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Fecha Inicio</label>
                                        <asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                
                                    <div class="form-group">
                                        <label>Fecha Fin </label>
                                        <asp:TextBox ID="txtFechaFin" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Vendedor </label>
                                        <asp:TextBox ID="txtVendedor" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                    </div>
                                    
                                 
                                    <div class="form-group">
                                         <label>Cliente </label>
                                        <asp:TextBox ID="txtCliente" runat="server" width="500px" Enabled="false" style="text-align:center" ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp
                                     <div class="form-group">
                                         <label>Domicilio </label>
                                        <asp:TextBox ID="txtDomicilio" runat="server" width="500px" Enabled="false" style="text-align:center" ></asp:TextBox>
                                    </div>

                                 <div class="form-group">
                                         <label>Asignar fecha de entrega</label>
                                        <asp:TextBox id="fechaEntrega" runat="server" TextMode="Date" width="500px" 
                                            style="text-align:center" Height="40px"></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                    <div class="form-group">
                                         <label>Asignar hora de entrega </label>
                                        <asp:TextBox ID="txtHora" runat="server" width="500px" style="text-align:center" ></asp:TextBox>
                                    </div>
                                
                                    <div class="form-group">
                                         <label>Abono </label>
                                        <asp:TextBox ID="txtDinero" runat="server" width="500px" style="text-align:center" required="true" ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp
                                <div class="form-group">
                                         <label>Interes </label>
                                        <asp:TextBox ID="txtInteres" runat="server" width="500px" style="text-align:center" required="true" ></asp:TextBox>
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>


        <div class="row">
            <div class="col">
                <div class="table-responsive">

           <table class="table">
            <tr>
            <td style="width: 80px">
                &nbsp;</td>
            <td colspan="3">
                
            <div class="panel panel-default">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" 
                    AllowPaging="True" 
                    OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="BORRAR" />
                        <asp:BoundField DataField="idProducto" HeaderText="CODIGO" />
                        <asp:BoundField DataField="strNombre" HeaderText="DESCRIPCIÓN" />
                        <asp:TemplateField HeaderText="CANTIDAD">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="73px">1</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRECIO VENTA">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="19px" Width="73px">0.0</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="COSTO">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="19px" Width="73px" Enabled="false" >0</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRECIO SUGERIDO">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Height="19px" Width="73px" Enabled="false" ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MARCA">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Height="19px" Width="73px" Enabled="false" ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>  
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />                    
                </asp:GridView>
            </div>
            </div>
            </td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <%--<tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                SubTotal S/ :&nbsp;
                <asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>--%>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                Total final:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$
                <asp:Label ID="lblTotal2" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                Total con el precio sugerido: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                <asp:Button ID="Button2" runat="server" Text="Regresar" OnClick="Button2_Click" CssClass="btn btn-primary" />
                <asp:Button ID="Button1" runat="server" Text="Calcular" style="margin-left: 111px" Width="157px" OnClick="Button1_Click" CssClass="btn btn-primary" />
                 </td>
            <td>
                <asp:Button ID="Button3" runat="server" style="margin-left: 34px" Text="Completar Venta" Width="170px"  OnClick="Button3_Click" CssClass="btn btn-primary" />
                <asp:Button ID="Button4" runat="server" style="margin-left: 34px" Text="Visualizar PDF" Width="150px"  OnClick="Button4_Click" CssClass="btn btn-primary" />
            </td>
        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

   <script type="text/javascript">
        function fallo() {
            swal({
                title: "Error",
                text: "El efectivo para completar la compra no es el necesario.",
                icon: "info",
            });
        }

        function exito() {
            swal({
                title: "Correcto",
                text: "Se realizo la venta con exito.",
                icon: "success",
            });
        }

        function vacio() {
            swal({
                title: "Incorrecto",
                text: "Existen campos vacios que son necesarios para continuar.",
                icon: "error",
            });
        }
        function falloCantidad() {
            swal({
                title: "ERROR",
                text: "No existe cantidad disponible para dar continuidad a la venta",
                icon: "error",
            });
        }
        function alerta() {
            swal({
                title: "ERROR",
                text: "La cantidad de salida excede la cantidad en stock",
                icon: "error",
            });
        }
    
    </script>

</asp:Content>
