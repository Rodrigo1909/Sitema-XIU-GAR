<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="MovimientoAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.MovimientoAlmacen" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>
    
    <div class="content">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Movimientos de mercancia</h2>
                    </div>
                </div>
            </div>

    </div>

       <%-- Consulta de movimientos --%>

    <div class="panel panel-default">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" AllowSorting="True">
                    <Columns>
                        
                        <asp:BoundField DataField="strTipo" HeaderText="Movimiento" SortExpression="strTipo" />
                        <asp:BoundField DataField="fecha" HeaderText="Fecha" SortExpression="fecha" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" SortExpression="strNombre" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="Apellido P." SortExpression="strApellidoP" />

                        <asp:BoundField DataField="strApellidoM" HeaderText="Apellido M." SortExpression="strApellidoM" />
                        <asp:BoundField DataField="strNombre1" HeaderText="Almacén" SortExpression="strNombre1" />
                        <asp:BoundField DataField="strNombre2" HeaderText="Producto" SortExpression="strNombre2" />

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
                    SelectCommand="select m.strTipo, m.fecha,
                                    e.strNombre, e.strApellidoP, e.strApellidoM,
                                    a.strNombre, p.strNombre
                                    from tblMovimiento m
                                    inner join tblEmpleado e
                                    on m.fkEmpleado = e.idEmpleado
                                    inner join tblStock s
                                    on m.fkStock = m.fkStock
                                    inner join tblProducto p
                                    on s.fkProducto = p.idProducto
                                    inner join tblAlmacen a
                                    on p.fkAlmacen = a.idAlmacen"></asp:SqlDataSource>

            </div>
        </div>
    

</asp:Content>