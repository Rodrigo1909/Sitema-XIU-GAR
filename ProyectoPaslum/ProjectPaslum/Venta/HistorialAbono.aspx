<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="HistorialAbono.aspx.cs" Inherits="ProjectPaslum.Venta.HistorialAbono" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    
   <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>


    <div class="container">
       <div style="text-align:center">
            <h2>Historial de Abono</h2>
        </div>

        <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="jumbotron"  style="background-color:white">
				<table class="table-responsive">
				<tbody>        
					<asp:DataList ID="DataList1" runat="server" CellPadding="5" DataKeyField="idVenta" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                     RepeatColumns="3" ForeColor="#333333" OnItemCommand="DataList1_ItemCommand" >
                                    
                                    <AlternatingItemStyle BackColor="White" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle BackColor="#E3EAEB" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="NUMERO DE CREDITO:" Font-Size="16px" Font-Italic="true"></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" Font-Size="16px" Font-Italic="true"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:" Font-Size="16px" Font-Italic="true"></asp:Label>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                        <br />
                                        <asp:Label ID="lbTotal" runat="server" Text="TOTAL DE VENTA:" Font-Size="16px" Font-Italic="true"></asp:Label>    
                                        <asp:Label ID="Total_VentaLabel" runat="server" Text='<%# Eval("[Total Venta]") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" Font-Size="16px" Font-Italic="true"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#00cc00" Font-Size="15px"/>
                                        <br />
                                        <asp:Label ID="lbFin" runat="server" Text="FIN DE CREDITO:" Font-Size="16px" Font-Italic="true"></asp:Label> 
                                        <asp:Label ID="Fin_del_CreditoLabel" runat="server" Text='<%# Eval("[Fin del Credito]") %>' ForeColor="#00cc00" Font-Size="15px"/>
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
                                                where v.strEstado = 'CREDITO'
                                                order by v.Fecha asc;"></asp:SqlDataSource>
				</tbody>
			</table>
			                    
			                        </div>
                                </div>
                              </div>
                           </div>
                        </div>
                      </div>
                    </div>
                  </div>
</asp:Content>