<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="MostradorVenta.aspx.cs" Inherits="ProjectPaslum.Venta.MostradorVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />
            
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="container">
  <div style="text-align:center">
    <h2>Venta de Mostrador</h2>
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
                                            OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
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

						    <asp:DataList ID="DataList1" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource2" RepeatColumns="4" 
                                OnItemCommand="DataList1_ItemCommand"  >
                                <ItemTemplate>
                                    
                                    <asp:Label ID="Label1" runat="server" Text="CODIGO:" Font-Size="16px" Font-Italic="true"></asp:Label>                                                                   
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                                                  
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text="PRODUCTO:" Font-Size="16px" Font-Italic="true"></asp:Label>                                                                   
                                    <asp:Label ID="idNombreLabel" runat="server" Text='<%# Eval("strNombre") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                                                  
                                    <br />
                                    <asp:Label ID="precio" runat="server" Text="PRECIO:" Font-Size="16px" Font-Italic="true"></asp:Label>
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />
                                    <asp:Label ID="presentacion" runat="server" Text="PRESENTACIÓN:" Font-Size="16px" Font-Italic="true"></asp:Label>
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>' ForeColor="#00cc00" Font-Size="16px" ></asp:Label>                                 
                                    <br />
                                    <asp:Label ID="unidad" runat="server" Text="U. MEDIDA:" Font-Size="16px" Font-Italic="true"></asp:Label>
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                    <br />           
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />                         
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>



						    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto, p.strNombre, 
                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                FROM tblProducto p
                                                inner join tblUnidadMedida u
                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                where fkAlmacen = 2"></asp:SqlDataSource>
			

				
			
			</div>


                            </div>
                         </div>
                       </div>
                    </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                 </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Finalizar venta" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnRegistrar_Click" />
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

