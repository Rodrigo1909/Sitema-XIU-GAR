<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="LineaVenta.aspx.cs" Inherits="ProjectPaslum.Venta.LineaVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2>Compras en linea</h2>
                    </hgroup>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" DataKeyNames="idVenta">

                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">ESTABLECIMIENTO:
                            <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                            <asp:Label ID="idVentaLabel" runat="server" visible="false" Text='<%# Eval("idVenta") %>' />
                            <br />FECHA:
                            <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                            <br />TOTAL:
                            <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                            <br />
                            ESTADO:
                            <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                            <br />
                            <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Finalizar" CssClass="btn btn-success" />
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Detalle" CssClass="btn btn-info" />      
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
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">ESTABLECIMIENTO:
                            <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />                            
                            <asp:Label ID="idVentaLabel" runat="server" Visible="false" Text='<%# Eval("idVenta") %>' />
                            <br />FECHA:
                            <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                            <br />TOTAL:
                            <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                            <br />
                            ESTADO:
                            <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                            <br />
                            <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Finalizar" CssClass="btn btn-success" />
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Detalle" CssClass="btn btn-info" />      
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
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    
                    </asp:ListView>
                
            <hgroup>
                
            </hgroup>

            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                SelectCommand="select c.strEstablecimiento, v.idVenta,v.Fecha, v.dblTotal, v.strEstado
                                from tblVenta v
                                inner join tblCliente c
                                on v.fkCliente = c.idCliente
                                where v.strEstado = 'PENDIENTE'
                                ORDER BY v.Fecha DESC"></asp:SqlDataSource>
        </div>
    </section>
</asp:Content>