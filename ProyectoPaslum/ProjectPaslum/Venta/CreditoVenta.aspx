<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="CreditoVenta.aspx.cs" Inherits="ProjectPaslum.Venta.CreditoVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />

<div class="container">
  <div style="text-align:center">
    <h2>Venta de Credito</h2>
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


                                    <div class="form-group">
                                         <label>Fin de credito</label>
                                        <asp:TextBox id="calFin" runat="server" TextMode="Date" required="required" width="500px" 
                                            style="text-align:center" Height="40px"></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
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
                    <tr>
                        <td>                                        
                            <asp:Label ID="lblAgregado" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>               
						

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
                                SelectCommand="SELECT [idProducto], [strNombre], [strDescripcion], [dblPrecio] FROM [tblProducto] where fkAlmacen = 2"></asp:SqlDataSource>

						

					
				</tbody>
			</table>
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
</asp:Content>