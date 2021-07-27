<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="MovimientoAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.MovimientoAlmacen" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>

    <div style="text-align:center">
        <h2>Resumen de almacén</h2>
    </div>
 
       <%-- filtro para movimientos --%>

        <%--ENTRADAS --%>
        <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" >ENTRADAS
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse" >
            <div class="panel-body">
                <div class="row">
                                        
           <div class="panel panel-default">
            <div class="panel-body">
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                    AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="3px" AllowSorting="True" >
                    <Columns>
                        
                        <asp:BoundField DataField="strTipo" HeaderText="MOVIMIENTO" SortExpression="strTipo" />
                        <asp:BoundField DataField="fecha" HeaderText="FECHA" SortExpression="fecha" />
                        <asp:BoundField DataField="Column1" HeaderText="EMPLEADO" SortExpression="Column1" ReadOnly="True" />
                        <asp:BoundField DataField="Column2" HeaderText="PRODUCTO" SortExpression="Column2" ReadOnly="True" />

                        <asp:BoundField DataField="strNombre" HeaderText="ALMACÉN" SortExpression="strNombre" />
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
                                                concat('(',p.idProducto, ') ' ,' ', p.strNombre,', ', p.intPresentacion , ' ' ,uni.strNombre),
                                                a.strNombre,m.dblValAnt, m.dblValNvo
	                                                from tblStock s
		                                                inner join tblProducto p
			                                                on s.fkProducto = p.idProducto
		                                                inner join tblUnidadMedida uni
			                                                on p.fkUnidadMedida = uni.idUnidadMedida
		                                                inner join tblMovimiento m
			                                                on m.fkStock = s.idStock
		                                                left join tblEmpleado e
			                                                on m.fkEmpleado = e.idEmpleado
		                                                inner join tblAlmacen a
			                                                on a.idAlmacen = p.fkAlmacen
		                                                where strTipo = 'ENTRADA' or strTipo = 'PRODUCCIÓN'
			                                                or strTipo = 'ENTRADA POR PRODUCCIÓN' or strTipo = 'ENTRADA POR DEVOLUCIÓN'
		                                                ORDER BY m.fecha DESC;"></asp:SqlDataSource>

            </div>
        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


        <%--SALIDAS --%>
        <div class="panel panel-default">
        <div class="panel-heading" >
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse">SALIDAS
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse" >
            <div class="panel-body">
                                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" 
                    AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="3px" AllowSorting="True">
                   <Columns>
                        
                        <asp:BoundField DataField="strTipo" HeaderText="MOVIMIENTO" SortExpression="strTipo" />
                        <asp:BoundField DataField="fecha" HeaderText="FECHA" SortExpression="fecha" />
                        <asp:BoundField DataField="Column1" HeaderText="EMPLEADO" SortExpression="Column1" ReadOnly="True" />

                        <asp:BoundField DataField="Column2" HeaderText="PRODUCTO" SortExpression="Column2" ReadOnly="True" />
                        <asp:BoundField DataField="strNombre" HeaderText="strNombre" SortExpression="strNombre" />

                        <asp:BoundField DataField="dblValAnt" HeaderText="VALOR ANTERIOR" SortExpression="dblValAnt" />
                        <asp:BoundField DataField="dblValNvo" HeaderText="VALOR NUEVO" SortExpression="dblValNvo" />


                        <asp:BoundField DataField="strNumVen" HeaderText="N. VENTA" SortExpression="strNumVen" />
                        <asp:BoundField DataField="strFactura" HeaderText="FACTURA" SortExpression="strFactura" />


                    </Columns>
                        <FooterStyle BackColor="White" ForeColor="#F74E4E" />
                        <HeaderStyle BackColor="#F74E4E" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <PagerStyle BackColor="White" ForeColor="#F74E4E" HorizontalAlign="Center" Font-Size="Medium" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />                    
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                   SelectCommand="select m.strTipo, m.fecha,
                                                e.strNombre + ' ' +  e.strApellidoP + ' ' + e.strApellidoM,
                                                concat('(',p.idProducto, ') ' ,' ', p.strNombre,' ', p.intPresentacion , ' ' ,uni.strNombre),
                                                a.strNombre,m.dblValAnt, m.dblValNvo, m.strNumVen, m.strFactura
	                                                from tblStock s
		                                                inner join tblProducto p
			                                                on s.fkProducto = p.idProducto
		                                                inner join tblUnidadMedida uni
			                                                on p.fkUnidadMedida = uni.idUnidadMedida
		                                                inner join tblMovimiento m
			                                                on m.fkStock = s.idStock
		                                                left join tblEmpleado e
			                                                on m.fkEmpleado = e.idEmpleado
		                                                inner join tblAlmacen a
			                                                on a.idAlmacen = p.fkAlmacen
		                                                where strTipo = 'SALIDA POR PRODUCCIÓN' or strTipo = 'SALIDA POR DEVOLUCIÓN'
                                                                or strTipo LIKE 'VENTA NUMERO%'
		                                                ORDER BY m.fecha DESC;"></asp:SqlDataSource>
                </div>
            </div>
        </div>




    

    

</asp:Content>