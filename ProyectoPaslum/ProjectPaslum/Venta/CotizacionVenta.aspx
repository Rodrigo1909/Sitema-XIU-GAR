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
                            <div class="form-inline">

                                <div class="jumbotron"  style="background-color:white">
				<table class="table-responsive">
				<tbody>     

						    <asp:DataList ID="DataList1" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource1" RepeatColumns="4" 
                                OnItemCommand="DataList1_ItemCommand" CssClass="table table-responsive"  >
                                <ItemTemplate>
                                    
                                    <br />
                                    <asp:Label ID="codigo" runat="server" Text="CODIGO:" Font-Size="16px" Font-Italic="true"></asp:Label>                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />
                                    <asp:Label ID="nombre" runat="server" Text="NOMBRE:" Font-Size="16px" Font-Italic="true"></asp:Label>                                 
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />                                    
                                    <asp:Label ID="descripcion" runat="server" Text="DESCRIPCIÓN:" Font-Size="16px" Font-Italic="true"></asp:Label>
                                    <asp:Label ID="strDescripcionLabel" runat="server" Text='<%# Eval("strDescripcion") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />
                                    <asp:Label ID="precio" runat="server" Text="PRECIO:" Font-Size="16px" Font-Italic="true"></asp:Label>
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>


						    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                SelectCommand="SELECT [idProducto], [strNombre], [strDescripcion], [dblPrecio] FROM [tblProducto] where fkAlmacen = 3"></asp:SqlDataSource>

						

					
				</tbody>
			</table>
			</div>


                                    
                                </div>
                               </div>
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
</asp:Content>