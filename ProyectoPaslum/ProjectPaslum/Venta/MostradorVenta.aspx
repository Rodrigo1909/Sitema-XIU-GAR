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
    <script src="../../Scripts/jquery-1.10.2.min.js">
    </script><script src="../../Scripts/sweetalert.js">
    </script><script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><div class="container">
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

                                          <div class="panel-group" id="accordionMarca" role="tablist" aria-multiselectable="true">
                                              
                                              <%-- XIU-GAR --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingXiugar">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseXiugar" aria-expanded="false" aria-controls="collapseXiugar">Xiu-Gar
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseXiugar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingXiugar">
                                                      <div>
                                                          <asp:DataList ID="DataListXiugar" runat="server" DataKeyField="idProducto" DataSourceID="SqlXiugar" CssClass="table table-responsive"
                                                              RepeatColumns="4" OnItemCommand="DataListXiugar_ItemCommand">
                                                              <ItemTemplate>
                                                                  <asp:Image ID="Image1" Width="100" Height="130" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />
                                                                  <br />
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
                                                          <asp:SqlDataSource ID="SqlXiugar" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                        FROM tblProducto p
                                                        inner join tblUnidadMedida u
                                                        on p.fkUnidadMedida = u.idUnidadMedida
                                                        inner join tblMarca m
                                                        on p.fkMarca = m.idMarca
                                                        where fkAlmacen = 2 and m.strNombre = 'XIU-GAR';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Zulka --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingZulka">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseZulka" aria-expanded="false" aria-controls="collapseZulka">Zulka
                                                          </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseZulka" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingZulka">
                                                      <div>
                                                          <asp:DataList ID="DataListZulka" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource1" CssClass="table table-responsive"
                                            RepeatColumns="4" OnItemCommand="DataListZulka_ItemCommand"   >
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" width="100" height="130" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                            <br />                                  
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
                                        SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                        p.dblPrecio , p.intPresentacion, u.strNombre
                                                        FROM tblProducto p
                                                        inner join tblUnidadMedida u
                                                        on p.fkUnidadMedida = u.idUnidadMedida
                                                        inner join tblMarca m
                                                        on p.fkMarca = m.idMarca
                                                        where fkAlmacen = 2 and m.strNombre = 'ZULKA';"></asp:SqlDataSource>

                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Domino --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingDomino">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseDomino" aria-expanded="false" aria-controls="collapseDomino">Domino
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseDomino" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingDomino">
                                                      <div>
                                                          <asp:DataList ID="DataListDomino" runat="server" DataKeyField="idProducto" DataSourceID="SqlDataSource3" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListDomino_ItemCommand">

                                                              <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="130" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                              SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                FROM tblProducto p
                                                                inner join tblUnidadMedida u
                                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                                inner join tblMarca m
                                                                on p.fkMarca = m.idMarca
                                                                where fkAlmacen = 2 and m.strNombre = 'DOMINO';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Puga --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPuga">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapsePuga" aria-expanded="false" aria-controls="collapsePuga">Puga
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePuga" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPuga">
                                                      <div>
                                                          <asp:DataList ID="DataListPuga" runat="server" DataKeyField="idProducto" DataSourceID="SqlPuga" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListPuga_ItemCommand">
                                                                <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="130" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                          <asp:SqlDataSource ID="SqlPuga" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                              SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                FROM tblProducto p
                                                                inner join tblUnidadMedida u
                                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                                inner join tblMarca m
                                                                on p.fkMarca = m.idMarca
                                                                where fkAlmacen = 2 and m.strNombre = 'PUGA';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Santos --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingSanto">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseSanto" aria-expanded="false" aria-controls="collapseSanto">Ingenios Santos
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseSanto" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSanto">
                                                      <div>
                                                         <asp:DataList ID="DataListSantos" runat="server" DataKeyField="idProducto" DataSourceID="SqlSanto" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListSantos_ItemCommand">
                                                               <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="70" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                          <asp:SqlDataSource ID="SqlSanto" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                FROM tblProducto p
                                                                inner join tblUnidadMedida u
                                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                                inner join tblMarca m
                                                                on p.fkMarca = m.idMarca
                                                                where fkAlmacen = 2 and m.strNombre = 'INGENIOS SANTOS';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- B. Juarez --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingJuarez">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseJuarez" aria-expanded="false" aria-controls="collapseJuarez">Benito Juarez
                                                           </a>                                                          
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseJuarez" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingJuarez">
                                                      <div>
                                                         <asp:DataList ID="DataListBJuarez" runat="server" DataKeyField="idProducto" DataSourceID="SqlBJuarez" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListBJuarez_ItemCommand">
                                                               <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="70" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                          <asp:SqlDataSource ID="SqlBJuarez" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                              SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                p.dblPrecio , p.intPresentacion, u.strNombre
                                                                FROM tblProducto p
                                                                inner join tblUnidadMedida u
                                                                on p.fkUnidadMedida = u.idUnidadMedida
                                                                inner join tblMarca m
                                                                on p.fkMarca = m.idMarca
                                                                where fkAlmacen = 2 and m.strNombre = 'BENITO JUAREZ';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Atencingo --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingAtencingo">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapseAtencingo" aria-expanded="false" aria-controls="collapseAtencingo">Atencingo
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapseAtencingo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAtencingo">
                                                      <div>
                                                         <asp:DataList ID="DataListAtencingo" runat="server" DataKeyField="idProducto" DataSourceID="SqlAtencingo" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListAtencingo_ItemCommand">
                                                               <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="70" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                           <asp:SqlDataSource ID="SqlAtencingo" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                                                               SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                                 p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                FROM tblProducto p
                                                                                inner join tblUnidadMedida u
                                                                                 on p.fkUnidadMedida = u.idUnidadMedida
                                                                                inner join tblMarca m
                                                                                on p.fkMarca = m.idMarca
                                                                                where fkAlmacen = 2 and m.strNombre = 'ATENCINGO';"></asp:SqlDataSource>
                                                      </div>
                                                  </div>
                                              </div>
                                              <%-- Potrero --%>
                                              <div class="panel panel-default">
                                                  <div class="panel-heading" role="tab" id="headingPotero">
                                                      <h4 class="panel-title">
                                                          <a class="collapsed" data-toggle="collapse" data-parent="#accordionMarca" href="#collapsePotrero" aria-expanded="false" aria-controls="collapsePotrero">Potrero
                                                           </a>
                                                      </h4>
                                                  </div>
                                                  <div style="height: 0px;" aria-expanded="false" id="collapsePotrero" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingPotrero">
                                                      <div>
                                                         <asp:DataList ID="DataListPotrero" runat="server" DataKeyField="idProducto" DataSourceID="SqlPotrero" CssClass="table table-responsive"
                                                             RepeatColumns="4" OnItemCommand="DataListPotrero_ItemCommand">
                                                               <ItemTemplate>
                                                                <asp:Image ID="Image1" width="100" height="70" runat="server" ImageUrl='<%# "~/ImagenesProductos/"+Eval("imagen") %>' CssClass="img-fluid" />  
                                                                <br />                                  
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
                                                          <asp:SqlDataSource ID="SqlPotrero" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="SELECT p.idProducto,m.imagen, p.strNombre, 
                                                                                 p.dblPrecio , p.intPresentacion, u.strNombre
                                                                                FROM tblProducto p
                                                                                inner join tblUnidadMedida u
                                                                                 on p.fkUnidadMedida = u.idUnidadMedida
                                                                                inner join tblMarca m
                                                                                on p.fkMarca = m.idMarca
                                                                                where fkAlmacen = 2 and m.strNombre = 'POTRERO';"></asp:SqlDataSource>
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

