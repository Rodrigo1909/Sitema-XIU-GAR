<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="ProjectPaslum.Venta.DetalleVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />


     <div style="text-align:center">
        <h2>Compras en linea</h2>
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
             
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" DataKeyNames="idVenta" >

                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FAFAD2; color: #284775;">strEstablecimiento:
                            <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                            <br />
                            idVenta:
                            <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                            <br />
                            Fecha:
                            <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                            <br />
                            dblTotal:
                            <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                            <br />
                            strEstado:
                            <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                            <br />
                            intCantidad:
                            <asp:Label ID="intCantidadLabel" runat="server" Text='<%# Eval("intCantidad") %>' />
                            <br />                            
                            dblPrecio:
                            <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>' />
                            <br />
                            strNombre:
                            <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>' />
                            <br />
                        </td>
                        
                    </AlternatingItemTemplate>
                        
                        <EditItemTemplate>
                            <td runat="server" style="background-color: #FFCC66;color: #000080;">strEstablecimiento:
                                <asp:TextBox ID="strEstablecimientoTextBox" runat="server" Text='<%# Bind("strEstablecimiento") %>' />
                                <br />
                                idVenta:
                                <asp:Label ID="idVentaLabel1" runat="server" Text='<%# Eval("idVenta") %>' />
                                <br />
                                Fecha:
                                <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                                <br />
                                dblTotal:
                                <asp:TextBox ID="dblTotalTextBox" runat="server" Text='<%# Bind("dblTotal") %>' />
                                <br />
                                strEstado:
                                <asp:TextBox ID="strEstadoTextBox" runat="server" Text='<%# Bind("strEstado") %>' />
                                <br />
                                intCantidad:
                                <asp:TextBox ID="intCantidadTextBox" runat="server" Text='<%# Bind("intCantidad") %>' />
                                <br />
                                dblPrecio:
                                <asp:TextBox ID="dblPrecioTextBox" runat="server" Text='<%# Bind("dblPrecio") %>' />
                                <br />
                                strNombre:
                                <asp:TextBox ID="strNombreTextBox" runat="server" Text='<%# Bind("strNombre") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                <br />
                            </td>
                        </EditItemTemplate>
                        
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
                        <InsertItemTemplate>
                            <td runat="server" style="">strEstablecimiento:
                                <asp:TextBox ID="strEstablecimientoTextBox" runat="server" Text='<%# Bind("strEstablecimiento") %>' />
                                <br />
                                Fecha:
                                <asp:TextBox ID="FechaTextBox" runat="server" Text='<%# Bind("Fecha") %>' />
                                <br />
                                dblTotal:
                                <asp:TextBox ID="dblTotalTextBox" runat="server" Text='<%# Bind("dblTotal") %>' />
                                <br />
                                strEstado:
                                <asp:TextBox ID="strEstadoTextBox" runat="server" Text='<%# Bind("strEstado") %>' />
                                <br />
                                intCantidad:
                                <asp:TextBox ID="intCantidadTextBox" runat="server" Text='<%# Bind("intCantidad") %>' />
                                <br />
                                dblPrecio:
                                <asp:TextBox ID="dblPrecioTextBox" runat="server" Text='<%# Bind("dblPrecio") %>' />
                                <br />
                                strNombre:
                                <asp:TextBox ID="strNombreTextBox" runat="server" Text='<%# Bind("strNombre") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color:#FFFBD6; color: #333333;">
                            strEstablecimiento:
                            <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />                            
                            <br />
                            idVenta:                            
                            <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                            <br />
                            Fecha:
                            <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                            <br />
                            dblTotal:
                            <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                            <br />
                            strEstado:
                            <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                            <br />
                            intCantidad:
                            <asp:Label ID="intCantidadLabel" runat="server" Text='<%# Eval("intCantidad") %>' />
                            <br />                            
                            dblPrecio:
                            <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>' />
                            <br />
                            strNombre:
                            <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>' />
                            <br />
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
                                <td runat="server" style="text-align: center;background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                                </td>
                            </tr>
                            
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                            <td runat="server" style="background-color:#FFCC66; font-weight: bold;color: #000080;">strEstablecimiento:
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                <br />
                                idVenta:
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                <br />
                                Fecha:
                                <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                <br />
                                dblTotal:
                                <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                <br />
                                strEstado:
                                <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                <br />
                                intCantidad:
                                <asp:Label ID="intCantidadLabel" runat="server" Text='<%# Eval("intCantidad") %>' />
                                <br />                                
                                dblPrecio:
                                <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>' />
                                <br />
                                strNombre:
                                <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    
                    </asp:ListView>
                      
                             
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                 SelectCommand="SELECT d.Fecha, d.intCantidad, d.dblPrecio, p.strNombre FROM tblDetalleVenta AS d INNER JOIN tblProducto 
                                                AS p ON p.idProducto = d.fkProducto WHERE (d.fkVenta = @idVenta)">
                                 <SelectParameters>
                                     <asp:Parameter Name="idVenta" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                      
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                 SelectCommand="SELECT c.strEstablecimiento, v.idVenta, v.Fecha, v.dblTotal, v.strEstado, d.intCantidad, d.dblPrecio, p.strNombre FROM tblDetalleVenta AS d INNER JOIN tblProducto AS p ON p.idProducto = d.fkProducto INNER JOIN tblVenta AS v ON v.idVenta = d.fkVenta AND d.fkVenta = v.idVenta INNER JOIN tblCliente AS c ON c.idCliente = v.fkCliente" DeleteCommand="UPDATE tblVenta SET strEstado = 'EN PROCESO' WHERE (idVenta = @idVenta)">
                        <DeleteParameters>
                            <asp:Parameter Name="idVenta" />
                        </DeleteParameters>
                             </asp:SqlDataSource>
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
                        
                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3" DataKeyNames="idVenta">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color:#FAF327;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="FINALIZADO" CssClass="btn btn-success"/>
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han encontrado ordenes de venta en proceso.</td>
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
                                <td runat="server" style="background-color:#FEF97C; color: #000000;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="FINALIZADO" CssClass="btn btn-success"/>
                                    <br />
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
                                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            
                            <SelectedItemTemplate>
                                <td runat="server" style="background-color:#FEF97C;font-weight: bold;color: #FFFFFF;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />
                                    Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />
                                    Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />
                                    Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />
                                    Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="FINALIZADO" CssClass="btn btn-success"/>
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                            
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="select c.strEstablecimiento,v.idVenta, v.Fecha, v.dblTotal, v.strEstado
                            from tblVenta v
                            inner join tblCliente c
                            on v.fkCliente = c.idCliente
                            where v.strEstado = 'EN PROCESO'" DeleteCommand="UPDATE tblVenta SET strEstado = 'FINALIZADO' WHERE (idVenta = @idVenta)">
                            <DeleteParameters>
                                <asp:Parameter Name="idVenta" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        
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

                        <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3" GroupItemCount="3" DataKeyNames="idVenta">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color:#9AFE7C;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <br />¿Desea poner la Orden de venta en proceso?
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="CONFIRMAR" CssClass="btn btn-warning" />
                                    <br />
                                </td>
                            </AlternatingItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                    <tr>
                                        <td>No se han encontrado ordenes de venta en proceso</td>
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
                                <td runat="server" style="background-color:#4BE71C; color: #000000;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <br />¿Desea poner la Orden de venta en proceso?
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="CONFIRMAR" CssClass="btn btn-warning" />
                                    <br />
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
                                        <td runat="server" style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            
                            <SelectedItemTemplate>
                                <td runat="server" style="background-color:#4BE71C; font-weight: bold;color: #FFFFFF;">Establecimiento:
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' />
                                    <br />
                                    Num. Venta:
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' />
                                    <br />
                                    Fecha:
                                    <asp:Label ID="FechaLabel" runat="server" Text='<%# Eval("Fecha") %>' />
                                    <br />
                                    Total:
                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>' />
                                    <br />
                                    Estado:
                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>' />
                                    <br />
                                    <br />¿Desea poner la Orden de venta en proceso?
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="CONFIRMAR" CssClass="btn btn-warning" />
                                    <br />
                                </td>
                            </SelectedItemTemplate>
                            
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="select c.strEstablecimiento,v.idVenta, v.Fecha, v.dblTotal, v.strEstado
                            from tblVenta v
                            inner join tblCliente c
                            on v.fkCliente = c.idCliente
                            where v.strEstado = 'FINALIZADO'" DeleteCommand="UPDATE tblVenta SET strEstado = 'EN PROCESO' WHERE (idVenta = @idVenta)">
                            <DeleteParameters>
                                <asp:Parameter Name="idVenta" />
                            </DeleteParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>  
        </div>    

         


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="left">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Detalle de la compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <asp:GridView ID="GridDetalle" runat="server"></asp:GridView>
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                                 <Columns>
                                     <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                     <asp:BoundField DataField="intCantidad" HeaderText="intCantidad" SortExpression="intCantidad" />
                                     <asp:BoundField DataField="dblPrecio" HeaderText="dblPrecio" SortExpression="dblPrecio" />
                                     <asp:BoundField DataField="strNombre" HeaderText="strNombre" SortExpression="strNombre" />
                                 </Columns>
                             </asp:GridView>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
        </div>
</div>
</asp:Content>
