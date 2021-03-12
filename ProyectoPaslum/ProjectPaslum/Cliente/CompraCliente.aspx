<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="CompraCliente.aspx.cs" Inherits="ProjectPaslum.Cliente.CompraCliente" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

    
    <div style="text-align:center">
    <h2>Lista de Productos</h2>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                <div class="jumbotron"  style="background-color:white">
				<table class="table-responsive">
				<tbody>     
                    <tr>
                        <td>                                        
                            <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>               
						

						    <asp:DataList ID="DataList1" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource1" RepeatColumns="4" 
                                OnItemCommand="DataList1_ItemCommand" CssClass="table table-responsive"  >
                                <ItemTemplate>
                                    <asp:Image ID="Image1" width="140" height="170" runat="server" ImageUrl='<%# "~/images/"+Eval("strNombre")+".jpg" %>' CssClass="img-fluid" />
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
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar al Carrito" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>

						    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT [idProducto], [strNombre], [strDescripcion], [dblPrecio] FROM [tblProducto] where fkAlmacen = '1'"></asp:SqlDataSource>

						

					
				</tbody>
			</table>
			</div>
            </div>
            </div>
            </div>
        </div>
     </div>
   </div>
</div>
</asp:Content>
