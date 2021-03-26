<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="WebVenta.aspx.cs" Inherits="ProjectPaslum.Venta.WebVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />


     <div style="text-align:center">
        <h2>REQUISICIONES</h2>
    </div>

        <%-- PENDIENTE: Orden de compra que no han sido aceptadas --%>
        <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingPendiente">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsePendiente" aria-expanded="true" aria-controls="collapsePendiente">PENDIENTES
                        </a>
                    </h4>
                </div>
                <div id="collapsePendiente" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingPendiente">
                    <div class="panel-body">
                        <section>
                         <div>
                            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="idVenta" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                     RepeatColumns="3" ForeColor="#FB2D59" OnItemCommand="DataList1_ItemCommand"  AutoPostBack="true" >
                                    
                         
                                    <AlternatingItemStyle BackColor="#FB5679" />
                                    <FooterStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <HeaderStyle BackColor="#FB2D59" Font-Bold="True"  />
                                    <ItemStyle BackColor="#FB2D59" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="VENTA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" Font-Size="15px"></asp:Label>  
                                        <br />
                                        <asp:Label ID="Label1" runat="server" Text="CLIENTE:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label> 
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" Font-Size="15px"></asp:Label>                                        
                                        <br />                                        
                                        <asp:Label ID="Label2" runat="server" Text="ESTABLECIMIENTO:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" Font-Size="15px"></asp:Label>                             
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="TOTAL:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' ForeColor="Black" Font-Size="15px"/>
                                        <br />
                                         <asp:Label ID="Label4" runat="server" Text="FECHA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" Font-Size="15px"></asp:Label>  
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />

                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#FB2D59" Font-Bold="True" ForeColor="#FB5679" />
                                </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                 SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, v.dblTotal,
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'PENDIENTE'
                                                order by v.Fecha asc;"></asp:SqlDataSource>

                        </div>
                    </section>
                  </div>
                </div>
        </div>

        <%-- EN PROCESO: Orden de compra en proceso de elaboración --%>
        <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingProceso">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseProceso" aria-expanded="true" aria-controls="collapseProceso">EN PROCESO
                        </a>
                    </h4>
                </div>
                <div id="collapseProceso" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingProceso">
                    <div class="panel-body">
                        <section>
                         <div>
                       
                        <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataKeyField="idVenta" DataSourceID="SqlDataSource2" 
                            CssClass="table table-responsive" RepeatColumns="3" ForeColor="#FAF327" AutoPostBack="true" OnItemCommand="DataList2_ItemCommand">
                            <AlternatingItemStyle BackColor="#FAF327" />
                            <FooterStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <HeaderStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <ItemStyle BackColor="#FEF97C" />
                            <ItemTemplate>
                                <asp:Label ID="lbNum" runat="server" Text="VENTA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" Font-Size="15px"></asp:Label>  
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="CLIENTE:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="ESTABLECIMIENTO:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" Font-Size="15px"></asp:Label>  
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="TOTAL:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>   
                                <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="FECHA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" Font-Size="15px"></asp:Label>  
                                <br />
                                <br />
                                <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#FEF97C"  Font-Bold="True" ForeColor="#FEF97C" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                            SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, v.dblTotal,
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'EN PROCESO'
                                                order by v.Fecha asc;"></asp:SqlDataSource>
                        
                        </div>
                    </section>
                    </div>
                </div>
            </div>

        <%-- FINALIZADO: Ordendes de compra terminado --%>  
        <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFinalizado">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFinalizado" aria-expanded="true" aria-controls="collapseFinalizado">FINALIZADO
                        </a>
                    </h4>
                </div>
                    <div id="collapseFinalizado" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFinalizado">
                <div class="panel panel-default">
                    <div class="panel-body">


                        <asp:DataList ID="DataList3" runat="server" CellPadding="4" DataKeyField="idVenta" DataSourceID="SqlDataSource3" CssClass="table table-responsive"
                                     RepeatColumns="3" ForeColor="#9AFE7C"  AutoPostBack="true" OnItemCommand="DataList3_ItemCommand">
                            <AlternatingItemStyle BackColor="#4BE71C" />
                            <FooterStyle BackColor="#9AFE7C" Font-Bold="True" />
                            <HeaderStyle BackColor="#9AFE7C" Font-Bold="True" />
                            <ItemStyle BackColor="#9AFE7C"  />
                            <ItemTemplate>
                                <asp:Label ID="lbNum12" runat="server" Text="VENTA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" Font-Size="15px" />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="CLIENTE:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="ESTABLECIMIENTO:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <asp:Label ID="Label11" runat="server" Text="TOTAL:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <asp:Label ID="Label12" runat="server" Text="FECHA:" Font-Size="16px" Font-Italic="true" ForeColor="Black"></asp:Label>
                                <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" Font-Size="15px"/>
                                <br />
                                <br />
                                <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#9AFE7C" Font-Bold="True" ForeColor="#9AFE7C" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, v.dblTotal,
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'FINALIZADO'
                                                order by v.Fecha asc;"></asp:SqlDataSource>


                    </div>
                </div>
            </div>  
        </div>    

        
</asp:Content>
