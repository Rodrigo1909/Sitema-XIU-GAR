<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="HistorialAbono.aspx.cs" Inherits="ProjectPaslum.Venta.HistorialAbono" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    
    
    <div class="container">
       <div style="text-align:center">
            <h2>Historial de Abono</h2>
        </div>
      
        <%-- PENDIENTE: Orden de compra que no han sido aceptadas --%>
        <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsePendiente" >PENDIENTES
                        </a>
                    </h4>
                </div>
                <div id="collapsePendiente" class="panel-collapse collapse">
                    <div class="panel-body">
                        <section>
                         <div>
                             <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="idVenta" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                     RepeatColumns="4" ForeColor="#333333" OnItemCommand="DataList1_ItemCommand" >
                                    
                                    <AlternatingItemStyle BackColor="White" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True"  />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" />
                                    <ItemStyle BackColor="#E3EAEB" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="NUMERO DE CREDITO:" ForeColor="Black" Font-Size="12px"></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" ForeColor="Black" Font-Size="12px"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:" ForeColor="Black" Font-Size="12px"/>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbTotal" runat="server" Text="TOTAL DE VENTA: $" ForeColor="Black" Font-Size="12px"></asp:Label>    
                                        <asp:Label ID="Total_VentaLabel" runat="server" Text='<%# Eval("[Total Venta]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" ForeColor="Black" Font-Size="12px"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbFin" runat="server" Text="FIN DE CREDITO:" ForeColor="Black" Font-Size="12px"></asp:Label> 
                                        <asp:Label ID="Fin_del_CreditoLabel" runat="server" Text='<%# Eval("[Fin del Credito]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Abonar efectivo" CssClass="btn btn-success" />
                                        <br />

                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                 SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento,
                                        v.dblTotal as 'Total Venta', v.Fecha as 'Fecha de creación',v.FechaCredito as 'Fin del Credito' 
	                                        from tblVenta v
		                                        inner join tblCliente c
	                                        on c.idCliente = v.fkCliente                                                
		                                        where v.idActivo = '1' and (v.strEstado LIKE 'CREDITO' or  v.strEstado LIKE 'CREDITO (EN PROCESO)' or v.strEstado LIKE 'CREDITO (ENTREGADO)' OR
		                                        v.strEstado LIKE 'VENTA A CREDITO FINALIZADO')
		                                        order by v.Fecha asc;"></asp:SqlDataSource>


                        </div>
                    </section>
                  </div>
                </div>
        </div>

        <%-- FINALIZADO: Orden de compra finalizado --%>
        <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFinalizado" >FINALIZADO
                        </a>
                    </h4>
                </div>
                <div id="collapseFinalizado" class="panel-collapse collapse">
                    <div class="panel-body">
                        <section>
                         <div>
                                <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataKeyField="idVenta" DataSourceID="SqlDataSource2" CssClass="table table-responsive"
                                     RepeatColumns="4" ForeColor="#333333" OnItemCommand="DataList2_ItemCommand" >
                                    
                                    <AlternatingItemStyle BackColor="White" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True"  />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" />
                                    <ItemStyle BackColor="#E3EAEB" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="NUMERO DE CREDITO:" ForeColor="Black" Font-Size="12px"></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" ForeColor="Black" Font-Size="12px"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:" ForeColor="Black" Font-Size="12px"/>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbTotal" runat="server" Text="TOTAL DE VENTA:" ForeColor="Black" Font-Size="12px"></asp:Label>    
                                        <asp:Label ID="Total_VentaLabel" runat="server" Text='<%# Eval("[Total Venta]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" ForeColor="Black" Font-Size="12px"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Label ID="lbFin" runat="server" Text="FIN DE CREDITO:" ForeColor="Black" Font-Size="12px"></asp:Label> 
                                        <asp:Label ID="Fin_del_CreditoLabel" runat="server" Text='<%# Eval("[Fin del Credito]") %>' ForeColor="Black" Font-Size="12px"/>
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Desglose" CssClass="btn btn-success" />
                                        <br />

                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                 SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento,
                                                v.dblTotal as 'Total Venta', v.Fecha as 'Fecha de creación',v.FechaCredito as 'Fin del Credito' 
                                                from tblVenta v
                                                inner join tblCliente c
                                                on c.idCliente = v.fkCliente                                                 
                                                where v.strEstado = 'VENTA A CREDITO FINALIZADA' AND v.idActivo = '1'
                                                order by v.Fecha asc;"></asp:SqlDataSource>
                        
                        </div>
                    </section>
                    </div>
                </div>
            </div>

        
    </div>
</asp:Content>