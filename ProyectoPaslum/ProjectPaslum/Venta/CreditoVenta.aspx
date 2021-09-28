<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="CreditoVenta.aspx.cs" Inherits="ProjectPaslum.Venta.CreditoVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js">
    </script><script src="../../Scripts/sweetalert.js">
    </script><script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <div class="container">
      <div style="text-align:center">
        <h2>Venta de Credito</h2>
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
                                            OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true" required="required" onmouseover="this.size=5;" onmouseout="this.size=1;"  style="max-height:100px; overflow:auto;"></asp:DropDownList>   
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


                                    <div class="form-group">
                                         <label>Fin de credito</label>
                                        <asp:TextBox id="calFin" runat="server" TextMode="Date" required="required" width="500px" 
                                            style="text-align:center" Height="40px"></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
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

                                    <div id="collapse1" class="panel-collapse collapse">

                                      <div class="panel-body">

                                          <div class="panel-group" id="accordionMarca" role="tablist" aria-multiselectable="true">
                                              
                                              <%-- Zulka --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingZucar">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseZucar" aria-expanded="false" aria-controls="collapseZucar">Zucarmex
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseZucar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingZucar">
                                                      <div>
                                                         <div id="collapseSubZucarmex" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionZucarmex" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- El higo --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingHigo">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionZucarmex" href="#collapseHigo" aria-expanded="false" aria-controls="collapseHigo">El Higo
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseHigo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingHigo">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarElHigo" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarElHigo"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarElHigo_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarElHigo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'EL HIGO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- San Cristobal --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingCristobal">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionZucarmex" href="#collapseCristobal" aria-expanded="false" aria-controls="collapseCristobal">San Cristobal
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseCristobal" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCristobal">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarSanCristobal" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarSanCristobal"
                                                                                         CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarSanCristobal_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                   
                                                                                <asp:SqlDataSource ID="SqlEstandarSanCristobal" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                                                                     SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'SAN CRISTOBAL' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Atencingo --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingAtencingo">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionZucarmex" href="#collapseAtencingo" aria-expanded="false" aria-controls="collapseAtencingo">Atencingo
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseAtencingo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAtencingo">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarAtencingo" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarAtencingo"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarAtencingo_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                       </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlEstandarAtencingo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'ATENCINGO' and p.idActivo = '1';
                                                                                                        "></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Zulka --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingZulka">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionZucarmex" href="#collapseZulka" aria-expanded="false" aria-controls="collapseZulka">Zulka
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseZulka" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingZulka">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarZulka" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarZulka"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarZulka_ItemCommand" >
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                       </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarZulka" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'ZULKA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>
                                            
                                              <%-- Beta San Miguel --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingBeta">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseBeta" aria-expanded="false" aria-controls="collapseBeta">Beta San Miguel
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseBeta" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBeta">
                                                      <div>
                                                         <div id="collapseSubBeta" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionBeta" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- San Miguel del Naranjo--%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingMiguel">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBeta" href="#collapseMiguel" aria-expanded="false" aria-controls="collapseMiguel">San Miguel del Naranjo
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseMiguel" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMiguel">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarNaranjo" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarNaranjo"
                                                                                          CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarNaranjo_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                 <asp:SqlDataSource ID="SqlEstandarNaranjo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                     SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                    FROM tblProducto p
	                                                                                    inner join tblUnidadMedida u
	                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                    inner join tblSubMarca sub
	                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'SAN MIGUEL DEL NARANJO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Emiliano Zapata --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingZapata">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBeta" href="#collapseZapata" aria-expanded="false" aria-controls="collapseZapata">Emiliano Zapata
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseZapata" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingZapata">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarZapata" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarZapata"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarZapata_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                     </asp:DataList>

                                                                                <asp:SqlDataSource ID="SqlEstandarZapata" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                    FROM tblProducto p
	                                                                                    inner join tblUnidadMedida u
	                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                    inner join tblSubMarca sub
	                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'EMILIANO ZAPATA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Casasano --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingCasasano">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBeta" href="#collapseCasasano" aria-expanded="false" aria-controls="collapseCasasano">Casasano
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseCasasano" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCasasano">
                                                                                <div>
                                                                                     <asp:DataList ID="ListEstandarCasasano" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarCasasano"
                                                                                         CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarCasasano_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                      </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlEstandarCasasano" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                                                                         SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'CASASANO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- La Providencia --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingProvidencia">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBeta" href="#collapseProvidencia" aria-expanded="false" aria-controls="collapseProvidencia">La Providencia
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseProvidencia" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingProvidencia">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarProvidencia" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarProvidencia"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarProvidencia_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                            <asp:SqlDataSource ID="SqlEstandarProvidencia" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                FROM tblProducto p
	                                                                                                inner join tblUnidadMedida u
	                                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                inner join tblSubMarca sub
	                                                                                                on sub.idSubMarca = p.fkSubMarca
                                                                                                where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'LA PROVIDENCIA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- San Miguelito --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingMiguelito">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBeta" href="#collapseMiguelito" aria-expanded="false" aria-controls="collapseMiguelito">San Miguelito
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseMiguelito" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMiguelito">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarMiguelito" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarMiguelito"
                                                                                          CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarMiguelito_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                   
                                                                            <asp:SqlDataSource ID="SqlEstandarMiguelito" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                FROM tblProducto p
	                                                                                                inner join tblUnidadMedida u
	                                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                inner join tblSubMarca sub
	                                                                                                on sub.idSubMarca = p.fkSubMarca
                                                                                                where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'SAN MIGUELITO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Porres --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPorres">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapsePorres" aria-expanded="false" aria-controls="collapsePorres">Porres
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePorres" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPorres">
                                                      <div>
                                                         <div id="collapseSubPorres" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionPorres" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Huixtla--%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingHuixtla">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPorres" href="#collapseHuixtla" aria-expanded="false" aria-controls="collapseHuixtla">Huixtla
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseHuixtla" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingHuixtla">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarHuixtla" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarHuixtla"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarHuixtla_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarHuixtla" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'HUIXTLA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- San Pedro --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingPedro">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPorres" href="#collapsePedro" aria-expanded="false" aria-controls="collapsePedro">San Pedro
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapsePedro" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPedro">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarSanPedro" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarSanPedro"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarSanPedro_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarSanPedro" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'SAN PEDRO' and p.idActivo = '1';"></asp:SqlDataSource>       
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Modelo --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingModelo">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPorres" href="#collapseModelo" aria-expanded="false" aria-controls="collapseModelo">Modelo
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseModelo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingModelo">
                                                                                <div>
                                                                                  <asp:DataList ID="ListEstandarModelo" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarModelo"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarModelo_ItemCommand" >
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarModelo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'MODELO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Motzorongo --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingMotzorongo">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseMotzorongo" aria-expanded="false" aria-controls="collapseMotzorongo">Central Motzorongo
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseMotzorongo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMotzorongo">
                                                      <div>
                                                         <div id="collapseSubMotzorongo" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionMotzorongo" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Motz--%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingMotz">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionMotzorongo" href="#collapseMotz" aria-expanded="false" aria-controls="collapseMotz">Motzorongo
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseMotz" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMotz">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarMotzorongo" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarMotzorongo"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarMotzorongo_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                <asp:SqlDataSource ID="SqlEstandarMotzorongo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                                                     SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                    FROM tblProducto p
	                                                                                    inner join tblUnidadMedida u
	                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                    inner join tblSubMarca sub
	                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'MOTZORONGO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Grupo Santos --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingSantos">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseSantos" aria-expanded="false" aria-controls="collapseSantos">Grupo Santos
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseSantos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSantos">
                                                      <div>
                                                         <div id="collapseSubSantos" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionSantos" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Covarrubias --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingCovarrubias">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSantos" href="#collapseCovarrubias" aria-expanded="false" aria-controls="collapseCovarrubias">Compañia Industrial Azucarera (Covarrubias)
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseCovarrubias" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCovarrubias">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarCovarrubias" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarCovarrubias"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarCovarrubias_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarCovarrubias" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'COVARRUBIAS' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Pedernales --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingPedernales">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSantos" href="#collapsePedernales" aria-expanded="false" aria-controls="collapsePedernales">Pedernales
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapsePedernales" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPedernales">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarPedernales" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarPedernales"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarPedernales_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                   </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlEstandarPedernales" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'PEDERNALES' and p.idActivo = '1';"></asp:SqlDataSource> 
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Alianza Popular --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingAlianza">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSantos" href="#collapseAlianza" aria-expanded="false" aria-controls="collapseAlianza">Alianza Popular
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseAlianza" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAlianza">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarAlianza" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarAlianza"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarAlianza_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlEstandarAlianza" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'ALIANZA POPULAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- La Margarita --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingMargarita">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseMargarita" aria-expanded="false" aria-controls="collapseMargarita">La Margarita
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseMargarita" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMargarita">
                                                      <div>
                                                         <asp:DataList ID="ListEstandarMargarita" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarMargarita"
                                                             CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarMargarita_ItemCommand">
                                                                <ItemTemplate>
                                                                <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                <br />  
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
                                                                <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                <br />
                                                            </ItemTemplate>
                                                     </asp:DataList>
                                                     <asp:SqlDataSource ID="SqlEstandarMargarita" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                         SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                FROM tblProducto p
	                                                                inner join tblUnidadMedida u
	                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                inner join tblMarca m
	                                                                on p.fkMarca = m.idMarca

                                                                where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and m.strNombre = 'LA MARGARITA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Grupo Azucarero del Tropico --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingTropico">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseTropico" aria-expanded="false" aria-controls="collapseTropico">Grupo Azucarero del Tropico
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseTropico" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTropico">
                                                      <div>
                                                         <div id="collapseSubTropico" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionTropico" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- La Gloria --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingGloria">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionTropico" href="#collapseGloria" aria-expanded="false" aria-controls="collapseGloria">La Gloria
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseGloria" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingGloria">
                                                                                <div>
                                                                                    <asp:DataList ID="ListEstandarGloria" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarGloria"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarGloria_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                            <asp:SqlDataSource ID="SqlEstandarGloria" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                    FROM tblProducto p
	                                                                                    inner join tblUnidadMedida u
	                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                    inner join tblSubMarca sub
	                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'LA GLORIA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- GAM --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingGAM">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseGAM" aria-expanded="false" aria-controls="collapseGAM">GAM
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseGAM" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingGAM">
                                                      <div>
                                                         <div id="collapseSubGAM" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionGAM" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Tala --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingTala">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionGAM" href="#collapseTala" aria-expanded="false" aria-controls="collapseTala">Tala
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseTala" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTala">
                                                                                <div>
                                                                                  <asp:DataList ID="ListEstandarTala" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarTala"
                                                                                      CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarTala_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>

                                                                                </asp:DataList>
                                                                                  <asp:SqlDataSource ID="SqlEstandarTala" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'TALA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Lazaro Cardenas --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingLazaro">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionGAM" href="#collapseLazaro" aria-expanded="false" aria-controls="collapseLazaro">Lazaro Cardenas
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseLazaro" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingLazaro">
                                                                                <div>
                                                                                  <asp:DataList ID="ListEstandarLazaro" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarLazaro"
                                                                                      CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarLazaro_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarLazaro" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'LÁZARO CÁRDENAS' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Benito Juarez --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingBenito">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionGAM" href="#collapseBenito" aria-expanded="false" aria-controls="collapseBenito">Benito Juarez
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseBenito" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBenito">
                                                                                <div>
                                                                                  <asp:DataList ID="ListEstandarBenito" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarBenito"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarBenito_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarBenito" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and sub.strNombre = 'BENITO JUAREZ' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Procazucar --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingProcazucar">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseProcazucar" aria-expanded="false" aria-controls="collapseProcazucar">Procazucar
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseProcazucar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingProcazucar">
                                                      <div>
                                                         <div id="collapseSubProcazucar" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionProcazucar" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Calipam --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingCalipam">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionProcazucar" href="#collapseCalipam" aria-expanded="false" aria-controls="collapseCalipam">Calipam
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseCalipam" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCalipam">
                                                                                <div>
                                                                                   <asp:DataList ID="ListEstandarCalipam" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarCalipam"
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarCalipam_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlEstandarCalipam" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblMarca m
	                                                                                                        on p.fkMarca = m.idMarca

                                                                                                        where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and m.strNombre = 'CALIPAM' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- El Carmen --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingCarmen">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionProcazucar" href="#collapseCarmen" aria-expanded="false" aria-controls="collapseCarmen">El Carmen
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseCarmen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCarmen">
                                                                                <div>
                                                                                  <asp:DataList ID="ListEstandarElCarmen" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarElCarmen"
                                                                                      CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarElCarmen_ItemCommand">
                                                                                          <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br />  
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlEstandarElCarmen" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblMarca m
	                                                                                                    on p.fkMarca = m.idMarca

                                                                                                    where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and m.strNombre = 'EL CARMEN' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Central Progreso --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingProgreso">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseProgreso" aria-expanded="false" aria-controls="collapseProgreso">Central Progreso
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseProgreso" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingProgreso">
                                                      <div>
                                                          <asp:DataList ID="ListEstandarCentral" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarCentral"
                                                               CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarCentral_ItemCommand">
                                                                    <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br />  
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlEstandarCentral" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                            SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and m.strNombre = 'CENTRAL PROGRESO' and p.idActivo = '1';
                                                                            "></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>

                                    </div>
                                </div>          
                                    
                              </div> 

                               <%-- Blanco Especial --%>
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">BLANCO ESPECIAL</a>
                                    </h4>
                                    </div>
                                    <div id="collapse6" class="panel-collapse collapse">
                                    <div class="panel-body">

                                          <div class="panel-group" id="accordionMarca2" role="tablist" aria-multiselectable="true">
                                              
                                              <%-- Puga --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPuga">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca2" href="#collapsePuga" aria-expanded="false" aria-controls="collapsePuga">Puga
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePuga" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPuga">
                                                      <div>
                                                        <asp:DataList ID="ListBlancoPuga" runat="server" DataKeyField="idProducto" DataSourceID="SqlBlancoPuga"
                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListBlancoPuga_ItemCommand" >
                                                                              <ItemTemplate>
                                                                                <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                <br />  
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
                                                                                <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                <br />
                                                                            </ItemTemplate>
                                                          </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlBlancoPuga" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                FROM tblProducto p
	                                                                                inner join tblUnidadMedida u
	                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                inner join tblMarca m
	                                                                                on p.fkMarca = m.idMarca

                                                                                where fkAlmacen = 2 and strCatalogo = 'BLANCO ESPECIAL' and m.strNombre = 'PUGA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- B. Juarez --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingJuarez">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca2" href="#collapseJuarez" aria-expanded="false" aria-controls="collapseJuarez">Benito Juarez
                                                           </a>                                                          
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseJuarez" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJuarez">
                                                      <div>
                                                         <asp:DataList ID="ListBlancoBenito" runat="server" DataKeyField="idProducto" DataSourceID="SqlBlancoBenito"  
                                                             CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListBlancoBenito_ItemCommand">
                                                                    <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
            
                                                    <asp:SqlDataSource ID="SqlBlancoBenito" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                        SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen, 
                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                        FROM tblProducto p
	                                                                        inner join tblUnidadMedida u
	                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                        inner join tblMarca m
	                                                                        on p.fkMarca = m.idMarca

                                                                        where fkAlmacen = 2 and strCatalogo = 'BLANCO ESPECIAL' and m.strNombre = 'BENITO JUAREZ' and p.idActivo = '1';"></asp:SqlDataSource>

                                                      </div>
                                                  </div>
                                              </div>

                                          </div>

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

                                          <div class="panel-group" id="accordionMarcaRefinada" role="tablist" aria-multiselectable="true">
                                              
                                              <%-- BSM REFINADA --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingBSMRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseBSMRefinada" aria-expanded="false" aria-controls="collapseBSMRefinada">Beta San Miguel
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseBSMRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBSMRefinada">
                                                      <div>
                                                         <div id="collapseSubBSMRefinada" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionBSMRefinada" role="tablist" aria-multiselectable="true">

                                                                        <%-- Potrero BSM --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingPotreroBSM">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionBSMRefinada" href="#collapsePotreroBSM" aria-expanded="false" aria-controls="collapsePotreroBSM">Potrero
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapsePotreroBSM" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPotreroBSM">
                                                                                <div>
                                                                                   <asp:DataList ID="ListRefinadaPotrero" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaPotrero"
                                                                                                 CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaPotrero_ItemCommand">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br /> 
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                  
                                                                                   <asp:SqlDataSource ID="SqlRefinadaPotrero" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                                                                                 SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                                FROM tblProducto p
	                                                                                                                inner join tblUnidadMedida u
	                                                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                                inner join tblMarca m
	                                                                                                                on p.fkMarca = m.idMarca

	                                                                                                                inner join tblSubMarca sub
	                                                                                                                on sub.fkMarca = m.idMarca
                                                                                                                where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'BETA SAN MIGUEL'
                                                                                                                and sub.strNombre = 'POTRERO' and p.idActivo = '1';"></asp:SqlDataSource>

                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Grupo Santos Refinada --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingSantosRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseSantosRefinada" aria-expanded="false" aria-controls="collapseSantosRefinada">Grupo Santos
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseSantosRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSantosRefinada">
                                                      <div>
                                                         <div id="collapseSubSantosRefinada" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionSantosRefinada" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Plan de Ayala --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingAyala">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSantosRefinada" href="#collapseAyala" aria-expanded="false" aria-controls="collapseAyala">Plan de Ayala
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseAyala" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAyala">
                                                                                <div>
                                                                                    <asp:DataList ID="ListRefinadaAyala" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaAyala" 
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaAyala_ItemCommand">
                                                                                         <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br /> 
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                   
                                                                                    <asp:SqlDataSource ID="SqlRefinadaAyala" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                                    FROM tblProducto p
	                                                                                                                    inner join tblUnidadMedida u
	                                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                                    inner join tblMarca m
	                                                                                                                    on p.fkMarca = m.idMarca

	                                                                                                                    inner join tblSubMarca sub
	                                                                                                                    on sub.fkMarca = m.idMarca
                                                                                                                    where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'INGENIOS SANTOS' and sub.strNombre = 'PLAN DE AYALA'
                                                                                                                    and p.idActivo = '1' ;"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>
                                            
                                              <%-- Grupo Saenz--%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingSaenz">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseSaenz" aria-expanded="false" aria-controls="collapseSaenz">Grupo Saenz
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseSaenz" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSaenz">
                                                      <div>
                                                         <div id="collapseSubSaenz" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionSaenz" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Tamazula --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="Tamazula">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSaenz" href="#collapseTamazula" aria-expanded="false" aria-controls="collapseTamazula">Tamazula
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseTamazula" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTamazula">
                                                                                <div>
                                                                                    <asp:DataList ID="ListRefinadaTamazula" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaTamazula" 
                                                                                                CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaTamazula_ItemCommand">
                                                                                                 <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br />  
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                            <asp:SqlDataSource ID="SqlRefinadaTamazula" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                                SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                                FROM tblProducto p
	                                                                                                                inner join tblUnidadMedida u
	                                                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                                inner join tblSubMarca sub
	                                                                                                                on sub.idSubMarca = p.fkSubMarca
                                                                                                                where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'TAMAZULA' and p.idActivo = '1';
                                                                                                                "></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Xicotencatl --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingXicotencatl">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSaenz" href="#collapseXicotencatl" aria-expanded="false" aria-controls="collapseXicotencatl">Xicotencatl
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseXicotencatl" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXicotencatl">
                                                                                <div>
                                                                                   <asp:DataList ID="ListRefinadaXicotencatl" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaXicotencatl" 
                                                                                       CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaXicotencatl_ItemCommand">
                                                                                                 <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br />  
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                   </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlRefinadaXicotencatl" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                        FROM tblProducto p
	                                                                                                        inner join tblUnidadMedida u
	                                                                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                        inner join tblSubMarca sub
	                                                                                                        on sub.idSubMarca = p.fkSubMarca
                                                                                                        where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'XICOTENCATL' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- El Mante --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingMante">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionSaenz" href="#collapseMante" aria-expanded="false" aria-controls="collapseMante">El Mante
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseMante" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingMante">
                                                                                <div>
                                                                                     <asp:DataList ID="ListRefinadaMante" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaMante"
                                                                                         CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaMante_ItemCommand">
                                                                                                 <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br />  
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                       </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlRefinadaMante" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
                                                                                                    inner join tblUnidadMedida u
                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

                                                                                                    inner join tblSubMarca sub
                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'EL MANTE' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- GAM --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingGAMRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseGAMRefinada" aria-expanded="false" aria-controls="collapseGAMRefinada">GAM
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseGAMRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingGAMRefinada">
                                                      <div>
                                                         <div id="collapseSubGAMRefinada" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionGAMRefinada" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Benito Juarez --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingBenitoRefinada">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionGAMRefinada" href="#collapseBenitoRefinada" aria-expanded="false" aria-controls="collapseBenitoRefinada">Benito Juarez
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseBenitoRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingBenitoRefinada">
                                                                                <div>
                                                                                    
                                                                                    <asp:DataList ID="ListRefinadaBenito" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaBenito"
                                                                                        CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaBenito_ItemCommand">
                                                                                        <ItemTemplate>
                                                                                               <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                <br /> 
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
                                                                                                <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                <br />
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                    <asp:SqlDataSource ID="SqlRefinadaBenito" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                        SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                            FROM tblProducto p
	                                                                                            inner join tblUnidadMedida u
	                                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                            inner join tblMarca m
	                                                                                            on p.fkMarca = m.idMarca

	                                                                                            inner join tblSubMarca sub
	                                                                                            on sub.fkMarca = m.idMarca
                                                                                            where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'GAM' and sub.strNombre = 'BENITO JUAREZ' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Piasa --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPiasa">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapsePiasa" aria-expanded="false" aria-controls="collapsePiasa">Grupo Piasa
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePiasa" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPiasa">
                                                      <div>
                                                         <div id="collapseSubPiasa" class="panel-collapse collapse in">

                                                                <div class="panel-body">

                                                                    <div class="panel-group" id="accordionPiasa" role="tablist" aria-multiselectable="true">
                                              
                                                                        <%-- Tres Valles --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingValles">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPiasa" href="#collapseValles" aria-expanded="false" aria-controls="collapseValles">Tres Valles
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseValles" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingValles">
                                                                                <div>
                                                                                   <asp:DataList ID="ListRefinadaValles" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaValles"
                                                                                      CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaValles_ItemCommand">
                                                                                            <ItemTemplate>
                                                                                            <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                            <br /> 
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
                                                                                            <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                            <br />
                                                                                        </ItemTemplate>
                                                                                </asp:DataList>
                                                                                <asp:SqlDataSource ID="SqlRefinadaValles" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                    FROM tblProducto p
	                                                                                                    inner join tblUnidadMedida u
	                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                    inner join tblSubMarca sub
	                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                    where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'TRES VALLES' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Adolfo Lopez Mateos --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingAdolfo">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPiasa" href="#collapseAdolfo" aria-expanded="false" aria-controls="collapseAdolfo">Adolfo Lopez Mateos
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseAdolfo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAdolfo">
                                                                                <div>
                                                                                    <asp:DataList ID="ListRefinadaAdolfo" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaAdolfo"
                                                                                                CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaAdolfo_ItemCommand">
                                                                                                    <ItemTemplate>
                                                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                    <br /> 
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
                                                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                    <br />
                                                                                                </ItemTemplate>
                                                                                            </asp:DataList>
                                                                                            <asp:SqlDataSource ID="SqlRefinadaAdolfo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                                SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                                FROM tblProducto p
	                                                                                                                inner join tblUnidadMedida u
	                                                                                                                on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                                inner join tblSubMarca sub
	                                                                                                                on sub.idSubMarca = p.fkSubMarca
                                                                                                                where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'ADOLFO LOPEZ MATEOS' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <%-- Plan de San Luis --%>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading" role="tab" id="headingSanLuis">
                                                                                <h4 class="panel-title">
                                                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordionPiasa" href="#collapseSanLuis" aria-expanded="false" aria-controls="collapseSanLuis">Plan de San Luis
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div style="height: 0px;" aria-expanded="false" id="collapseSanLuis" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSanLuis">
                                                                                <div>
                                                                                  <asp:DataList ID="ListRefinadaSanLuis" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaSanLuis"
                                                                                                    CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaSanLuis_ItemCommand">
                                                                                                        <ItemTemplate>
                                                                                                        <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                                                        <br /> 
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
                                                                                                        <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                                                        <br />
                                                                                                    </ItemTemplate>
                                                                                                </asp:DataList>
                                                                                                <asp:SqlDataSource ID="SqlRefinadaSanLuis" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                                                    SelectCommand="SELECT p.idProducto, p.strNombre, sub.imagen,
                                                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                                                    FROM tblProducto p
	                                                                                                                    inner join tblUnidadMedida u
	                                                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                                                    inner join tblSubMarca sub
	                                                                                                                    on sub.idSubMarca = p.fkSubMarca
                                                                                                                    where fkAlmacen = 2 and strCatalogo = 'REFINADA' and sub.strNombre = 'PLAN DE SAN LUIS' and p.idActivo = '1';"></asp:SqlDataSource>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                  </div>
                                                                </div>
                                                             </div>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- El Carmen --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingCarmenRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseCarmenRefinada" aria-expanded="false" aria-controls="collapseCarmenRefinada">El Carmen
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseCarmenRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCarmenRefinada">
                                                      <div>
                                                        <asp:DataList ID="ListRefinadaCarmen" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaCarmen"
                                                                CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaCarmen_ItemCommand">
                                                                        <ItemTemplate>
                                                                        <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                        <br />  
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
                                                                        <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                        <br />
                                                                    </ItemTemplate>
                                                            </asp:DataList>
                                                            <asp:SqlDataSource ID="SqlRefinadaCarmen" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                                SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                                    p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                    FROM tblProducto p
	                                                                                    inner join tblUnidadMedida u
	                                                                                    on p.fkUnidadMedida = u.idUnidadMedida

	                                                                                    inner join tblMarca m
	                                                                                    on p.fkMarca = m.idMarca

                                                                                    where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'EL CARMEN' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Puga --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPugaRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapsePugaRefinada" aria-expanded="false" aria-controls="collapsePugaRefinada">Puga
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePugaRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPugaRefinada">
                                                      <div>
                                                          <asp:DataList ID="ListRefinadaPuga" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaPuga" 
                                                              CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaPuga_ItemCommand">
                                                                    <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                          </asp:DataList>

                                                           <asp:SqlDataSource ID="SqlRefinadaPuga" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                          SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                        FROM tblProducto p
	                                                        inner join tblUnidadMedida u
	                                                        on p.fkUnidadMedida = u.idUnidadMedida

	                                                        inner join tblMarca m
	                                                        on p.fkMarca = m.idMarca

                                                        where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'PUGA' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Domino --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingDomino">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaRefinada" href="#collapseDomino" aria-expanded="false" aria-controls="collapseDomino">Domino
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseDomino" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingDomino">
                                                      <div>
                                                        <asp:DataList ID="ListRefinadaDomino" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaDomino" 
                                                            CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaDomino_ItemCommand">
                                                                 <ItemTemplate>
                                                                   <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                   <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                         </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlRefinadaDomino" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                           SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                            FROM tblProducto p
	                                                            inner join tblUnidadMedida u
	                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                            inner join tblMarca m
	                                                            on p.fkMarca = m.idMarca

                                                            where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'DOMINO' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>

                                    </div>
                                    </div>                                    
                                </div>

                               <%-- Xiu-Gar --%>
                               <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseXiugar">XIU-GAR</a>                                       
                                    </h4>
                                    </div>

                                    <div id="collapseXiugar" class="panel-collapse collapse">

                                      <div class="panel-body">

                                          <div class="panel-group" id="accordionMarcaXiugar" role="tablist" aria-multiselectable="true">
                                              
                                              <%-- Estandar --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugarEstandar">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarEstandar" aria-expanded="false" aria-controls="collapseXiugarEstandar">Estandar
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugarEstandar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarEstandar">
                                                      <div>
                                                        <asp:DataList ID="ListEstandarXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlEstandarXiugar"
                                                            CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEstandarXiugar_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                       </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlEstandarXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                            SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'ESTANDAR' and m.strNombre = 'XIU-GAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                            
                                              <%-- Refinada --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugarRefinada">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarRefinada" aria-expanded="false" aria-controls="collapseXiugarRefinada">Refinada
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugarRefinada" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarRefinada">
                                                      <div>
                                                        <asp:DataList ID="ListRefinadaXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlRefinadaXiugar"
                                                            CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListRefinadaXiugar_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
                                                       <asp:SqlDataSource ID="SqlRefinadaXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>"
                                                         SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'REFINADA' and m.strNombre = 'XIU-GAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Mascabado --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugarMascabado">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarMascabado" aria-expanded="false" aria-controls="collapseXiugarMascabado">Mascabado
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugarMascabado" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarMascabado">
                                                      <div>
                                                         <asp:DataList ID="ListMascabadoXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlMascabadoXiugar"
                                                             CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListMascabadoXiugar_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
                                                       <asp:SqlDataSource ID="SqlMascabadoXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                           SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'MASCABADO' and m.strNombre = 'XIU-GAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Glas --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugarGlas">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarGlas" aria-expanded="false" aria-controls="collapseXiugarGlas">Glas
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugarGlas" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarGlas">
                                                      <div>
                                                         <asp:DataList ID="ListGlasXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlGlasXiugar"
                                                             CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListGlasXiugar_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
                                                       <asp:SqlDataSource ID="SqlGlasXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                           SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'GLAS' and m.strNombre = 'XIU-GAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>

                                              <%-- Endulcorantes --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugarEndulcorantes">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarcaXiugar" href="#collapseXiugarEndulcorantes" aria-expanded="false" aria-controls="collapseXiugarEndulcorantes">Endulcorantes
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugarEndulcorantes" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugarEndulcorantes">
                                                      <div>
                                                         <asp:DataList ID="ListEndulcoranteXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlEndulcorantesXiugar"
                                                             CssClass="table table-responsive" RepeatColumns="4" OnItemCommand="ListEndulcoranteXiugar_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="Image1" width="140" height="120" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                    <br /> 
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
                                                                    <asp:Button ID="btnRefinadaPotrero" runat="server" CommandName="Seleccionar" Text="Agregar" CssClass="btn btn-success" />
                                                                    <br />
                                                                </ItemTemplate>
                                                        </asp:DataList>
                                        <asp:SqlDataSource ID="SqlEndulcorantesXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto, p.strNombre, m.imagen,
                                                                            p.dblPrecio , p.intPresentacion, u.strNombre
                                                                            FROM tblProducto p
	                                                                            inner join tblUnidadMedida u
	                                                                            on p.fkUnidadMedida = u.idUnidadMedida

	                                                                            inner join tblMarca m
	                                                                            on p.fkMarca = m.idMarca

                                                                            where fkAlmacen = 2 and strCatalogo = 'SUSTITUTO' and m.strNombre = 'XIU-GAR' and p.idActivo = '1';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>

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

    <script type="text/javascript">
        function exito() {
            swal({
                title: "Correcto",
                text: "Se agrego el producto con exito.",
                icon: "success",
            });
        }
    
    </script>
                     
</div>
</asp:Content>