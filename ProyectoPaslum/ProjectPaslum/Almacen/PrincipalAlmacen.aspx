<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="PrincipalAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.PrincipalAlmacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

<div class="container">
  <div style="text-align:center">
    <h2>Existencia en almacén</h2>
  </div>

       <%-- Consulta de movimientos --%>
            <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Almacenista </label><asp:Label ID="lbEmpleado" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <asp:TextBox ID="txtAlmacenista" runat="server" width="500px" Enabled="false"  ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Almacén </label><asp:DropDownList ID="ddlAlmacen" runat="server" AppendDataBoundItems="True"  
                                             width="500px" AutoPostBack="true"></asp:DropDownList> 
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" AllowSorting="True">
                    <Columns>
                        
                        <asp:BoundField DataField="intPresentacion" HeaderText="PRESENTACIÓN" SortExpression="intPresentacion" />
                        <asp:BoundField DataField="strNombre" HeaderText="PRODUCTO" SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="DESCRIPCIÓN" SortExpression="strDescripcion" />
                        <asp:BoundField DataField="dblCantidad" HeaderText="CANTIDAD" SortExpression="dblCantidad" />

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

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                    SelectCommand="select p.intPresentacion, p.strNombre, p.strDescripcion, s.dblCantidad
                                    from tblStock s
                                    inner join tblProducto p
                                    on s.fkProducto = p.idProducto
                                    where p.fkAlmacen = 1"></asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
