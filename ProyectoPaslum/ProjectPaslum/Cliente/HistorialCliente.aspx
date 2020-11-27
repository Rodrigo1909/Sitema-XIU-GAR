<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="HistorialCliente.aspx.cs" Inherits="ProjectPaslum.Cliente.HistorialCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>

    <div style="text-align:center">
        <h2>Historial de compras</h2>
        <asp:Label ID="lbCliente" runat="server" Text="Label" Visible="false"></asp:Label>
    </div>
 
       <%-- Consulta de movimientos --%>

    <div class="panel panel-default">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                    AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="3px" AllowSorting="True">
                    <Columns>
                        
                        <asp:BoundField DataField="Fecha" HeaderText="FECHA" SortExpression="Fecha" />
                        <asp:BoundField DataField="dblTotal" HeaderText="TOTAL" SortExpression="dblTotal" />
                        <asp:BoundField DataField="strEstado" HeaderText="ESTADO" SortExpression="strEstado" />

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
                    SelectCommand="SELECT [Fecha], [dblTotal], [strEstado] FROM [tblVenta] WHERE ([fkCliente] = @fkCliente) ORDER BY [Fecha] DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lbCliente" Name="fkCliente" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    

</asp:Content>
