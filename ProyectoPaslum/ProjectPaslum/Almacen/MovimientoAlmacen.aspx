<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="MovimientoAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.MovimientoAlmacen" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>

    <div style="text-align:center">
        <h2>Resumen de almacén</h2>
    </div>
 
       <%-- Consulta de movimientos --%>

    <div class="panel panel-default">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                    AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="3px" AllowSorting="True">
                    <Columns>
                        
                        <asp:BoundField DataField="strTipo" HeaderText="MOVIMIENTO" SortExpression="strTipo" />
                        <asp:BoundField DataField="fecha" HeaderText="FECHA" SortExpression="fecha" />
                        <asp:BoundField DataField="Column1" HeaderText="NOMBRE" SortExpression="Column1" ReadOnly="True" />
                        <asp:BoundField DataField="strNombre" HeaderText="PRODUCTO" SortExpression="strNombre" />

                        <asp:BoundField DataField="strNombre1" HeaderText="ALMACÉN" SortExpression="strNombre1" />
                        <asp:BoundField DataField="dblValAnt" HeaderText="VALOR ANTERIOR" SortExpression="dblValAnt" />
                        <asp:BoundField DataField="dblValNvo" HeaderText="VALOR NUEVO" SortExpression="dblValNvo" />

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
                                    e.strNombre + ' ' +  e.strApellidoP + ' ' + e.strApellidoM,
                                    p.strNombre, a.strNombre,m.dblValAnt, m.dblValNvo
                                    from tblStock s
                                    inner join tblProducto p
                                    on s.fkProducto = p.idProducto
                                    inner join tblMovimiento m
                                    on m.fkStock = s.idStock
                                    left join tblEmpleado e
                                    on m.fkEmpleado = e.idEmpleado
                                    inner join tblAlmacen a
                                    on a.idAlmacen = p.fkAlmacen
                                    ORDER BY m.fecha DESC;
                                    "></asp:SqlDataSource>

            </div>
        </div>
    

</asp:Content>