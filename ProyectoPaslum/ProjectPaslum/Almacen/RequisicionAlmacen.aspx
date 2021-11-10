<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="RequisicionAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.RequisicionAlmacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

     <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    
       <div style="text-align:center">
            <h2>Requerimiento de producto</h2>
           <asp:Label ID="lbEmpleado" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>

       <div class="panel-group" id="accordion">
          
       <%-- Requisiciones Pendientes --%>
        <div class="panel panel-default">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseXiugar">PENDIENTES</a>                                        
            </h4>
            </div>

            <div id="collapseXiugar" class="panel-collapse collapse">

                <div class="panel-body">

                    <div class="panel-group" id="accordionMarcaXiugar" role="tablist" aria-multiselectable="true">
                                              
                        <%-- Online --%>
                        <%-- ONLINE: Orden de compra que se pidieron de forma web --%>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingXiugarEstandar">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarEstandar" aria-expanded="false" aria-controls="collapseXiugarEstandar">ONLINE
                                    </a>
                                </h4>
                            </div>
                            <div style="height: 0px;" aria-expanded="false" id="collapseXiugarEstandar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarEstandar">
                                <div>
                                                               <asp:DataList ID="DataList4" runat="server" DataKeyField="idVenta" DataSourceID="SqlDataSource4" CssClass="table table-responsive"
                                     RepeatColumns="4" ForeColor="#FB2D59" OnItemCommand="DataList4_ItemCommand" >
                                    
                         
                                    <AlternatingItemStyle BackColor="#FB5679" />
                                    <FooterStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <HeaderStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <ItemStyle BackColor="#FB2D59" />
                                    
                                     <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="VENTA:"  ForeColor="#000000" ></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:"  ForeColor="#000000"></asp:Label>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000"/>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                                        <asp:Button ID="Button2" runat="server" CommandName="Finalizar" Text="Proceso" CssClass="btn btn-success" OnClientClick="Confirm()"  />                                        
                                        <br />

                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#FB2D59" Font-Bold="True" ForeColor="#FB5679" />
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                 SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento,
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'PENDIENTE ONLINE' and v.idActivo = '1'
                                                order by v.Fecha asc;"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                                            
                        <%-- Contado --%>
                        <%-- PENDIENTE: Orden de compra que no han sido aceptadas --%>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingXiugarRefinada">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarRefinada" aria-expanded="false" aria-controls="collapseXiugarRefinada">CONTADO
                                    </a>
                                </h4>
                            </div>
                            <div style="height: 0px;" aria-expanded="false" id="collapseXiugarRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarRefinada">
                                <div>
                                                               <asp:DataList ID="DataList1" runat="server" DataKeyField="idVenta" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                     RepeatColumns="4" ForeColor="#FB2D59" OnItemCommand="DataList1_ItemCommand" >
                                    
                         
                                    <AlternatingItemStyle BackColor="#FB5679" />
                                    <FooterStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <HeaderStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <ItemStyle BackColor="#FB2D59" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="#000000" ></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000"/>
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000" />
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                                        <asp:Button ID="Button2" runat="server" CommandName="Finalizar" Text="Proceso" CssClass="btn btn-success" OnClientClick="Confirm()"  />                                        
                                        <br />

                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#FB2D59" Font-Bold="True" ForeColor="#FB5679" />
                                </asp:DataList>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=SQL5061.site4now.net;Initial Catalog=db_a7a655_rodrigom1909;User ID=db_a7a655_rodrigom1909_admin;Password=solamente19"
                                 SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento,
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'PENDIENTE' and v.idActivo = '1'
                                                order by v.Fecha asc;" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <%-- Credito --%>
                        <%-- PENDIENTE CREDITO: Orden de compra que no han sido aceptadas --%>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingXiugarMascabado">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarMascabado" aria-expanded="false" aria-controls="collapseXiugarMascabado">CREDITO
                                    </a>
                                </h4>
                            </div>
                            <div style="height: 0px;" aria-expanded="false" id="collapseXiugarMascabado" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarMascabado">
                                <div>
                                                                <asp:DataList ID="ListCreditoPendiente" runat="server" DataKeyField="idVenta" DataSourceID="SqlCreditoPendiente" CssClass="table table-responsive"
                                         RepeatColumns="4" ForeColor="#FB2D59" OnItemCommand="ListCreditoPendiente_ItemCommand" >
                                    
                         
                                    <AlternatingItemStyle BackColor="#FB5679" />
                                    <FooterStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <HeaderStyle BackColor="#FB2D59" Font-Bold="True" />
                                    <ItemStyle BackColor="#FB2D59" />
                                    
                                    <ItemTemplate>
                                        <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="#000000" ></asp:Label>                                        
                                        <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000"/>
                                        <br />
                                        <asp:Label ID="lbCliente" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>   
                                        <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbEstablecimiento" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>                                        
                                        <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" />
                                        <br />
                                        <asp:Label ID="lbFecha" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label> 
                                        <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000" />
                                        <br />
                                        <br />
                                        <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                                        <asp:Button ID="Button2" runat="server" CommandName="Finalizar" Text="Proceso" CssClass="btn btn-success" OnClientClick="Confirm()"  />                                        
                                        <br />

                                    </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlCreditoPendiente" runat="server" ConnectionString="Data Source=SQL5061.site4now.net;Initial Catalog=db_a7a655_rodrigom1909;User ID=db_a7a655_rodrigom1909_admin;Password=solamente19" 
                                SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento,
                                                                v.Fecha as 'Fecha de creación'
                                                                from tblVenta v
                                                                left join tblCliente c
                                                                on c.idCliente = v.fkCliente                                                
                                                                where v.strEstado = 'CREDITO' and v.idActivo = '1'
                                                                order by v.Fecha asc;" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                    </div>

            </div>
        </div>
        </div> 

        <%-- Requisicion en proceso --%>
        <div class="panel panel-default">
            <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">EN PROCESO</a>
            </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
            <div class="panel-body">

                    <div class="panel-group" id="accordionMarcaRefinada" role="tablist" aria-multiselectable="true">
                                              
                        <%-- CONTADO --%>
                        <%-- EN PROCESO: Orden de compra en proceso de elaboración --%>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingBSMRefinada">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseBSMRefinada" aria-expanded="false" aria-controls="collapseBSMRefinada">CONTADO
                                    </a>
                                </h4>
                            </div>
                            <div style="height: 0px;" aria-expanded="false" id="collapseBSMRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBSMRefinada">
                                <div>
                           <asp:DataList ID="DataList2" runat="server" DataKeyField="idVenta" DataSourceID="SqlDataSource2" CssClass="table table-responsive" 
                            RepeatColumns="4" ForeColor="#FAF327" AutoPostBack="true" OnItemCommand="DataList2_ItemCommand">
                            <AlternatingItemStyle BackColor="#FAF327" />
                            <FooterStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <HeaderStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <ItemStyle BackColor="#FEF97C" />
                            <ItemTemplate>
                                <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label> 
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000" />
                                <br />
                                <br />
                                <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                                <asp:Button ID="Button2" runat="server" CommandName="Finalizar" Text="Finalizar" CssClass="btn btn-success" OnClientClick="Finish()" /> 
                                <asp:Button ID="Button3" runat="server" CommandName="Pendiente" Text="Pendiente" CssClass="btn badge-secondary" OnClientClick="Return()"/> 
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#FEF97C"  Font-Bold="True" ForeColor="#FEF97C" />
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=SQL5061.site4now.net;Initial Catalog=db_a7a655_rodrigom1909;User ID=db_a7a655_rodrigom1909_admin;Password=solamente19" 
                            SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, 
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'EN PROCESO' and v.idActivo = '1'
                                                order by v.Fecha asc;" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <%-- CREDITO --%>
                        <%-- EN PROCESO CREDITO: Orden de compra en proceso de elaboración --%>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingSantosRefinada">
                                <h4 class="panel-title">
                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseSantosRefinada" aria-expanded="false" aria-controls="collapseSantosRefinada">CREDITO
                                    </a>
                                </h4>
                            </div>
                            <div style="height: 0px;" aria-expanded="false" id="collapseSantosRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSantosRefinada">
                                <div>
                                    <asp:DataList ID="ListCreditoProceso" runat="server" DataKeyField="idVenta" DataSourceID="SqlCreditoProceso" CssClass="table table-responsive" 
                            RepeatColumns="4" ForeColor="#FAF327" AutoPostBack="true" OnItemCommand="ListCreditoProceso_ItemCommand">
                            <AlternatingItemStyle BackColor="#FAF327" />
                            <FooterStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <HeaderStyle BackColor="#FEF97C" Font-Bold="True"  />
                            <ItemStyle BackColor="#FEF97C" />
                            <ItemTemplate>
                                <asp:Label ID="lbNum" runat="server" Text="VENTA:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label5" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label> 
                                <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" ></asp:Label>  
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="FECHA:" ForeColor="#000000"></asp:Label>  
                                <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000" />
                                <br />
                                <br />
                                <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" Text="Detalle" CssClass="btn btn-primary" />
                                <asp:Button ID="Button2" runat="server" CommandName="Finalizar" Text="Finalizar" CssClass="btn btn-success" OnClientClick="Finish()" /> 
                                <asp:Button ID="Button3" runat="server" CommandName="Pendiente" Text="Pendiente" CssClass="btn badge-secondary" OnClientClick="Return()"/> 
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#FEF97C"  Font-Bold="True" ForeColor="#FEF97C" />
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlCreditoProceso" runat="server" ConnectionString="Data Source=SQL5061.site4now.net;Initial Catalog=db_a7a655_rodrigom1909;User ID=db_a7a655_rodrigom1909_admin;Password=solamente19" 
                                SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, 
                                                            v.Fecha as 'Fecha de creación'
                                                            from tblVenta v
                                                            left join tblCliente c
                                                            on c.idCliente = v.fkCliente                                                
                                                            where v.strEstado = 'CREDITO (EN PROCESO)' and v.idActivo = '1'
                                                            order by v.Fecha asc;" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            </div>                                    
        </div>

        <%-- FINALIZADO: Ordendes de compra terminado --%>  
        <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFinalizado">FINALIZADO
                        </a>
                    </h4>
                </div>
                    <div id="collapseFinalizado" class="panel-collapse collapse">
                <div class="panel panel-default">
                    <div class="panel-body">

                        
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="idVenta" DataSourceID="SqlDataSource3" GroupItemCount="4" OnItemCommand="ListView1_ItemCommand">
                            <AlternatingItemTemplate>
                                <td runat="server" style="background-color:#9AFE7C;">
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
                                    <asp:Label ID="lbNum12" runat="server" Text="VENTA:" ForeColor="#000000" ></asp:Label>
                                    <asp:Label ID="idVentaLabel" runat="server" Text='<%# Eval("idVenta") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="CLIENTE:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Text="ESTABLECIMIENTO:" ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="strEstablecimientoLabel" runat="server" Text='<%# Eval("strEstablecimiento") %>' ForeColor="#000000" />
                                    <br />
                                    <asp:Label ID="Label12" runat="server" Text="FECHA:"  ForeColor="#000000"></asp:Label>
                                    <asp:Label ID="Fecha_de_creaciónLabel" runat="server" Text='<%# Eval("[Fecha de creación]") %>' ForeColor="#000000"/>
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
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=SQL5061.site4now.net;Initial Catalog=db_a7a655_rodrigom1909;User ID=db_a7a655_rodrigom1909_admin;Password=solamente19" 
                            SelectCommand="select v.idVenta, c.strNombre + ' ' + c.strApellidoM + ' '+ c.strApellidoP, c.strEstablecimiento, 
                                                v.Fecha as 'Fecha de creación'
                                                from tblVenta v
                                                left join tblCliente c
                                                on c.idCliente = v.fkCliente                                                
                                                where v.strEstado = 'FINALIZADO' and v.idActivo = '1'
                                                order by v.Fecha desc;" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                    </div>
                </div>
            </div>  
        </div>  

        </div>

    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");

            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            if (confirm("¿Desea poner en proceso la requisición?")) {
                confirm_value.value = "Si";
            }
            else {
                confirm_value.value = "No";
            }

            document.forms[0].appendChild(confirm_value);
        }

        function Return() {
            var confirm_value = document.createElement("INPUT");

            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            if (confirm("¿Desea regresar a estado pendiente la requisición?")) {
                confirm_value.value = "Si";
            }
            else {
                confirm_value.value = "No";
            }

            document.forms[0].appendChild(confirm_value);
        }

        function Finish() {
            var confirm_value = document.createElement("INPUT");

            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";

            if (confirm("¿Desea finalizar la requisición? Una vez que se finaliza no se podra regresar al estado PENDIENTE")) {

                confirm_value.value = "Si";
            }
            else {
                confirm_value.value = "No";
            }

            document.forms[0].appendChild(confirm_value);
        }



    </script>


</asp:Content>
