<%@ Page Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="PrincipalAdministrador.aspx.cs" Inherits="ProjectPaslum.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link href="css/modales.css" rel="stylesheet" />
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <div class="content">
                    <div class="women_main">
                        <!-- start content -->
                        <div class="grids">
                            <div class="progressbar-heading grids-heading">
                                <h2>XIU-GAR</h2>
                               
                            </div>
                            <div class="panel panel-widget forms-panel">
                                <div class="forms">
                                    <div class="form-grids widget-shadow" data-example-id="basic-forms">
                                       
                                        <div class="form-body">
                                           <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Ventas del día
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                    <asp:Label ID="lbFecha" runat="server" width="500px" visible="false"></asp:Label>

                    <asp:DataList ID="ListVentaHoy" runat="server" DataKeyField="idVenta" DataSourceID="SqlVentaHoy"
                        CssClass="table table-responsive" RepeatColumns="4" ForeColor="#333333"  OnItemCommand="ListVentaHoy_ItemCommand">
                                    <AlternatingItemStyle BackColor="White" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True"  />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" />
                                    <ItemStyle BackColor="#E3EAEB" />
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
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>

                    <asp:SqlDataSource ID="SqlVentaHoy" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                        SelectCommand="	select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, v.dblTotal,
	                                    v.Fecha as 'Fecha de creación'
	                                    from tblVenta v
	                                    left join tblCliente c
	                                    on c.idCliente = v.fkCliente                                                
	                                    where v.fecha = @lbFecha
	                                    order by v.Fecha asc;">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbFecha" Name="lbFecha" PropertyName="Text" />
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