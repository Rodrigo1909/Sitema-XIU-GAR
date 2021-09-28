<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="CotizacionVenta.aspx.cs" Inherits="ProjectPaslum.Venta.CotizacionVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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

<div class="container">
  <div style="text-align:center">
    <h2>Cotización</h2>
  </div>
 
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Vendedor </label>
                                        <asp:TextBox ID="txtVendedor" runat="server" width="500px" Enabled="false" ></asp:TextBox>
                                    </div>    
                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Nombre del cliente </label><asp:DropDownList ID="ddlCliente" runat="server" AppendDataBoundItems="True"  width="500px"
                                            OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Domicilio </label><asp:DropDownList ID="ddlDomicilio" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Lugar </label><asp:DropDownList ID="ddlLugar" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>Fecha </label><asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" ></asp:TextBox>        
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <br />
                    <div class="panel panel-default">
                        <div class="panel-body">


						    <asp:DataList ID="DataList1" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource1" 
                                OnItemCommand="DataList1_ItemCommand" RepeatColumns="4" CssClass="table table-responsive"  >
                                <ItemTemplate>
                                    
                                    Codigo:                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'/>
                                    
                                    <br />
                                    Producto:
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'></asp:Label>                                    
                                    <br />
                                    Precio:                                    
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label>
                                    <br />
                                    Presentación:
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'></asp:Label>                                 
                                    <br />
                                    U. Medida:                                 
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'/>
                                    <br />       
                                    <asp:Button ID="btnCotizacion" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />                             
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>


						    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                SelectCommand="SELECT p.idProducto, p.strNombre, 
                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                FROM tblProducto p
                                                inner join tblUnidadMedida u
                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                where fkAlmacen = 3 and p.idActivo = 1;"></asp:SqlDataSource>

						

					
                             </div>
                           </div>
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            
                 </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Finalizar cotización" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="250px" OnClick="btnRegistrar_Click1" />
                </div>             
                        </div>
                      </div>
                    </div>

                     
</div>

    <script type="text/javascript">
        function exito() {
            swal({
                title: "Correcto",
                text: "Se agrego el producto con exito.",
                icon: "success",
            });
        }
    
    </script>
    </div>
</asp:Content>