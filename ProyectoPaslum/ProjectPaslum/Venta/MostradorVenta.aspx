<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="MostradorVenta.aspx.cs" Inherits="ProjectPaslum.Venta.MostradorVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />
            
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="container">
  <div style="text-align:center">
    <h2>Venta de Contado</h2>
  </div>
 
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Vendedor </label>
                                        <asp:TextBox ID="txtVendedor" runat="server" width="500px" Enabled="false" ></asp:TextBox>
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Nombre del cliente </label><asp:DropDownList ID="ddlCliente" runat="server" AppendDataBoundItems="True"  width="500px" 
                                            OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Domicilio </label><asp:DropDownList ID="ddlDomicilio" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Establecimiento </label><asp:DropDownList ID="ddlLugar" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>Fecha </label><asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" ></asp:TextBox>        
                                    </div>

                                    <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Bodega </label><asp:DropDownList ID="ddlBodega" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>

                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>

    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            

                            <div class="container">
 
                           <div class="panel-group" id="accordion">
                               <%-- ESTANDAR --%>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">AZÚCAR ESTANDAR</a>
                                    </h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <asp:DataList ID="DataList2" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                            RepeatColumns="4" OnItemCommand="DataList2_ItemCommand"   >
                                        <ItemTemplate>
                                            Codigo:
                                            <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'></asp:Label>
                                            <br />
                                            Producto:
                                            <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'></asp:Label>  
                                            <br />
                                            Precio:
                                            <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label> 
                                            <br />
                                            Presentación: 
                                            <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'></asp:Label>                                        
                                            <br />                                        
                                            U. Medida:                                        
                                            <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'></asp:Label>
                                            <br />
                                            <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                            <br />

                                        </ItemTemplate>
                                    
                                    </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                        SelectCommand="SELECT p.idProducto, p.strNombre, 
                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                        FROM tblProducto p
                                                        inner join tblUnidadMedida u
                                                        on p.fkUnidadMedida = u.idUnidadMedida
                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR';"></asp:SqlDataSource>
                                    </div>
                                    </div>
                                </div>

                               <%-- REFINADA --%>
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">AZÚCAR REFINADA</a>
                                    </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        
						    <asp:DataList ID="DataList3" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource2" RepeatColumns="4" 
                                OnItemCommand="DataList3_ItemCommand"  CssClass="table table-responsive" >
                                <ItemTemplate>
                                    
                                    Codigo:
                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'></asp:Label>                                                                   
                                    <br />           
                                    Producto:                                                                   
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'/>
                                                                  
                                    <br />
                                    Precio:
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label>                                                                   
                                    <br />
                                    Presentación:                                                                   
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'/>
                                                                  
                                    <br />
                                    U. Medida:
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'></asp:Label>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                 SelectCommand="SELECT p.idProducto, p.strNombre, 
                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                FROM tblProducto p
                                                inner join tblUnidadMedida u
                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                where fkAlmacen = 2 and strCatalogo = 'REFINADA';
                                                "></asp:SqlDataSource>

                                    </div>
                                    </div>
                                </div>

                               <%-- MASCABADO --%> 
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">AZÚCAR MASCABADO</a>
                                    </h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                    <div class="panel-body">
                                                 <asp:DataList ID="DataList4" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource5" RepeatColumns="4" 
                                OnItemCommand="DataList4_ItemCommand"  CssClass="table table-responsive" >
                                <ItemTemplate>
                                    
                                    Codigo:
                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'></asp:Label>                                                                   
                                    <br />           
                                    Producto:                                                                   
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'/>
                                                                  
                                    <br />
                                    Precio:
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label>                                                                   
                                    <br />
                                    Presentación:                                                                   
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'/>
                                                                  
                                    <br />
                                    U. Medida:
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'></asp:Label>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>

                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                             SelectCommand="SELECT p.idProducto, p.strNombre, 
                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                        FROM tblProducto p
                                        inner join tblUnidadMedida u
                                        on p.fkUnidadMedida = u.idUnidadMedida
                                        where fkAlmacen = 2 and strCatalogo = 'MASCABADO';
                                        "></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>

                               <%-- GLAS --%>  
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">AZÚCAR GLAS</a>
                                    </h4>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                                <asp:DataList ID="DataList5" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource6" RepeatColumns="4" 
                                OnItemCommand="DataList5_ItemCommand"  CssClass="table table-responsive" >
                                <ItemTemplate>
                                    
                                    Codigo:
                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'></asp:Label>                                                                   
                                    <br />           
                                    Producto:                                                                   
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'/>
                                                                  
                                    <br />
                                    Precio:
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label>                                                                   
                                    <br />
                                    Presentación:                                                                   
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'/>
                                                                  
                                    <br />
                                    U.Medida:
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'></asp:Label>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>

                             <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                 SelectCommand="SELECT p.idProducto, p.strNombre, 
                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                    FROM tblProducto p
                                    inner join tblUnidadMedida u
                                    on p.fkUnidadMedida = u.idUnidadMedida
                                    where fkAlmacen = 2 and strCatalogo = 'GLAS';
                                    "></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>

                               <%-- EDULCORANTES --%> 
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">EDULCORANTES</a>
                                    </h4>
                                    </div>
                                    <div id="collapse5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                              <asp:DataList ID="DataList6" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource7" RepeatColumns="4" 
                                OnItemCommand="DataList6_ItemCommand"  CssClass="table table-responsive" >
                                <ItemTemplate>
                                    
                                    Codigo:
                                    
                                    <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>'></asp:Label>                                                                   
                                    <br />           
                                    Producto:                                                                   
                                    <asp:Label ID="strNombreLabel" runat="server" Text='<%# Eval("strNombre") %>'/>
                                                                  
                                    <br />
                                    Precio:
                                    <asp:Label ID="dblPrecioLabel" runat="server" Text='<%# Eval("dblPrecio") %>'></asp:Label>                                                                   
                                    <br />
                                    Presentación:                                                                   
                                    <asp:Label ID="intPresentacionLabel" runat="server" Text='<%# Eval("intPresentacion") %>'/>
                                                                  
                                    <br />
                                    U. Medida:
                                    <asp:Label ID="strNombre1Label" runat="server" Text='<%# Eval("strNombre1") %>'></asp:Label>
                                    <br />
                                    <asp:Button ID="Button1" runat="server" CommandName="Seleccionar" OnClick="Button1_Click" Text="Agregar" CssClass="btn btn-success" />
                                    <br />
                                </ItemTemplate>

                            </asp:DataList>

                           <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                               SelectCommand="SELECT p.idProducto, p.strNombre, 
                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                        FROM tblProducto p
                                        inner join tblUnidadMedida u
                                        on p.fkUnidadMedida = u.idUnidadMedida
                                        where fkAlmacen = 2 and strCatalogo = 'SUSTITUTO';
                                        "></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>

                               <br /><br />

                                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                                </div>
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <asp:Button ID="btnRegistrar" runat="server" Text="Finalizar venta" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnRegistrar_Click" />
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

    <script type="text/javascript">
        function exito() {
            swal({
                title: "Correcto",
                text: "Se agrego el producto con exito.",
                icon: "success",
            });
        }
    
    </script>
</asp:Content>

