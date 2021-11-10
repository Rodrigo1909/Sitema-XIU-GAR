<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="PrincipalVendedor.aspx.cs" Inherits="ProjectPaslum.Venta.PrincipalVendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="css/modales.css" rel="stylesheet" />
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <div class="content">
        <div class="women_main">
            <!-- start content -->
            <div class="grids">
                <div class="panel panel-widget forms-panel">
                    <div class="forms">
                        <div class="form-grids widget-shadow" data-example-id="basic-forms">
                                       
                            <div class="form-body">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading">
                                        <h4 class="panel-title">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Ventas de la semana
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body">
                                            
                                            <asp:Label ID="lbLunes" runat="server" width="500px" visible="false"></asp:Label>
                                            <asp:Label ID="lbDomingo" runat="server" width="500px" visible="false"></asp:Label>

                                                <asp:DataList ID="ListVentaHoy" runat="server" DataKeyField="idVenta" DataSourceID="SqlVentaHoy"
                                                    CssClass="table table-responsive" RepeatColumns="3" ForeColor="#333333" OnItemCommand="ListVentaHoy_ItemCommand">
                                                                <AlternatingItemStyle BackColor="White" />
                                                                <FooterStyle BackColor="#1C5E55" Font-Bold="True"  />
                                                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" />
                                                                <ItemStyle BackColor="#E3EAEB" />
                                                            <ItemTemplate>
                                                                    <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="Black"></asp:Label>
                                                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" Text="ESTADO:" ForeColor="Black"></asp:Label>
                                                                    <asp:Label ID="strEstadoLabel" runat="server" Text='<%# Eval("strEstado") %>'></asp:Label>  
                                                                    <br />
                                                                    <asp:Label ID="Label2" runat="server" Text="CLIENTE:" ForeColor="Black"></asp:Label> 
                                                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>'></asp:Label> 
                                                                    <br />
                                                                    <asp:Label ID="Label4" runat="server" Text="ESTABLECIMIENTO:" ForeColor="Black"></asp:Label>
                                                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ></asp:Label>                                        
                                                                    <br />                                        
                                                                    <asp:Label ID="Label6" runat="server" Text="TOTAL: $"  ForeColor="Black"></asp:Label>                          
                                                                    <asp:Label ID="dblTotalLabel" runat="server" Text='<%# Eval("dblTotal") %>'></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label8" runat="server" Text="FECHA:" ForeColor="Black"></asp:Label>
                                                                    <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ></asp:Label>                             
                                                                    <br />
                                                                    <asp:Button ID="btnDesgloce" runat="server" CommandName="Seleccionar" Text="Desgloce" CssClass="btn btn-success" />
                                                                    <br />

                                                                </ItemTemplate>
                                                    <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>

                                                <asp:SqlDataSource ID="SqlVentaHoy" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                    SelectCommand="select v.idVenta,v.strEstado, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, 
                                                                    c.strEstablecimiento, v.dblTotal, 
                                                                    v.Fecha as 'Fecha de creación'
	                                                                    from tblVenta v
		                                                                    left join tblCliente c
			                                                                    on c.idCliente = v.fkCliente                                                
	                                                                    where v.fecha BETWEEN @FechaInicio and @FechaFin and v.idActivo = 1
	                                                                    order by v.Fecha asc;">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lbLunes" Name="FechaInicio" PropertyName="Text" />
                                                        <asp:ControlParameter ControlID="lbDomingo" Name="FechaFin" PropertyName="Text" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>


                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
    </asp:Content>
