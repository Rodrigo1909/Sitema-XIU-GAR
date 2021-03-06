﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="WebVenta.aspx.cs" Inherits="ProjectPaslum.Venta.WebVenta" %>
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
                                     RepeatColumns="3" ForeColor="#FB2D59" OnItemCommand="DataList1_ItemCommand"  AutoPostBack="true" >
                                    
                         
                                    <AlternatingItemStyle BackColor="#FB5679" />
                                    <FooterStyle BackColor="#FB2D59" Font-Bold="True" ForeColor="White"/>
                                    <HeaderStyle BackColor="#FB2D59" Font-Bold="True" ForeColor="White"/>
                                    <ItemStyle BackColor="#FB2D59" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black"></asp:Label>  
                                        <br />
                                        <asp:Label ID="Label1" runat="server" Text="CLIENTE:" ForeColor="Black"></asp:Label> 
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" ></asp:Label>                                        
                                        <br />                                        
                                        <asp:Label ID="Label2" runat="server" Text="ESTABLECIMIENTO:" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" ></asp:Label>                             
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Text="TOTAL: $"  ForeColor="Black"></asp:Label>
                                        <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' ForeColor="Black" />
                                        <br />
                                         <asp:Label ID="Label4" runat="server" Text="FECHA:" ForeColor="Black"></asp:Label>
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black" ></asp:Label>  
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
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseProceso" >EN PROCESO
                        </a>
                    </h4>
                </div>
                <div id="collapseProceso" class="panel-collapse collapse">
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
                                <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="Black" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="CLIENTE:" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="Black" />
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="ESTABLECIMIENTO:" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="Black" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label7" runat="server" Text="TOTAL: $" ForeColor="Black"></asp:Label>   
                                <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' ForeColor="Black" />
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="FECHA:" ForeColor="Black"></asp:Label>  
                                <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="Black"></asp:Label>  
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
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFinalizado" >FINALIZADO
                        </a>
                    </h4>
                </div>
                    <div id="collapseFinalizado" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFinalizado">
                <div class="panel panel-default">
                    <div class="panel-body">


                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="idVenta" DataSourceID="SqlDataSource3" GroupItemCount="3" OnItemCommand="ListView1_ItemCommand">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color:#9AFE7C;">
                                    <asp:Label ID="lbNum12" runat="server" Text="VENTA:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label12" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" CommandArgument='<%# Eval("idVenta") %>' />
                                </td>
                            </AlternatingItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han devuelto datos.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <EmptyItemTemplate>
                                <td runat="server" />
                            </EmptyItemTemplate>
                            <GroupTemplate>
                                <tr id="itemPlaceholderContainer" runat="server">
                                    <td id="itemPlaceholder" runat="server"></td>
                                </tr>
                            </GroupTemplate>                            
                            <ItemTemplate>
                                <td runat="server" style="background-color:#4BE71C;color: #4BE71C;">
                                    <asp:Label ID="lbNum12" runat="server" Text="VENTA:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000"/>
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000"/>
                                    <br />
                                    <asp:Label ID="Label12" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>'  ForeColor="#000000" />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" CommandArgument='<%# Eval("idVenta") %>' />
                                </td>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr id="groupPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, 
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'FINALIZADO'
                                                order by v.Fecha desc;"></asp:SqlDataSource>




                    </div>
                </div>
            </div>  
        </div>    

        
</asp:Content>
