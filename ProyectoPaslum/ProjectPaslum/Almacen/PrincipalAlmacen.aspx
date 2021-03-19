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
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" AllowSorting="True">

                    <Columns>
                        <asp:BoundField DataField="dblCantidad" HeaderText="CANTIDAD EN EXISTENCIA" SortExpression="dblCantidad" />
                        <asp:BoundField DataField="strNombre" HeaderText="PRODUCTO" SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="DESCRIPCIÓN" SortExpression="strDescripcion" />                        
                        <asp:BoundField DataField="strNombre1" HeaderText="ALMACÉN" SortExpression="strNombre1" />
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

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                        SelectCommand="select s.dblCantidad, p.strNombre, p.strDescripcion, a.strNombre
                                        from tblStock s
                                        inner join tblProducto p
                                        on s.fkProducto = p.idProducto
                                        inner join tblAlmacen a
                                        on p.fkAlmacen = a.idAlmacen
                                        where a.idActivo = 1 and p.idActivo = 1"></asp:SqlDataSource>


            </div>
        </div>
    
    </div>
</asp:Content>
