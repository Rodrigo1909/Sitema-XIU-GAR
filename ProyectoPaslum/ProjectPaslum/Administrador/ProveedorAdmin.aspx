﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="ProveedorAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.ProveedorAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <div class="content">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>PROVEEDORES</h2>
                </div>                
             </div> 
        </div>          
    </div>
       
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Nuevo proveedor</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Proveedores activos</button>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample3" aria-expanded="false" aria-controls="multiCollapseExample3">Editar o Eliminar</button>
</p>
<div class="row">
    <%--Boton para expandir la información para registrar un nuevo empleado--%>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body">
              <%-- Registro de nuevo empleado --%>   
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading"  >
                <h4 class="panel-title">
                    <a>REGISTRO DE NUEVO PROVEEDOR</a>
                </h4>            
                    <%-- Proveedor --%>
                    <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">DATOS BASICOS
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <asp:Image ID="imgProfe" runat="server" ImageUrl="~/images/Iconos/IconProveedor.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">                                                        
                                                        <div class="form-group">
                                                            <label>Nombre: </label>
                                                            <asp:TextBox ID="txtNombre" runat="server" width="368px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>   
                                                         </div>    
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Razón Social: </label>
                                                            <asp:TextBox ID="txtRazonSocial" runat="server" width="273px" CssClass="form-control"></asp:TextBox>                                                            
                                                        </div>
                                                        <br /> <br />
                                                        
                                                        <div class="form-group">
                                                            <label>Apellido Paterno: </label>
                                                            <asp:TextBox ID="txtAPaterno" runat="server" width="310px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>
                                                        </div>
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Correo: </label>
                                                            <asp:TextBox ID="txtCorreo" runat="server" width="316px" placeholder="Ejemplo@ejemplo.com:"
                                                                 CssClass="form-control" TextMode="Email" title="Ingrese el formato de correo electronico">
                                                            </asp:TextBox>
                                                        </div>  
                                                        <br /> <br />


                                                        <div class="form-group">
                                                            <label>Apellido Materno: </label>
                                                            <asp:TextBox ID="txtAMaterno" runat="server" width="307px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>
                                                        </div>    
                                                        
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Sitio Web: </label>
                                                            <asp:TextBox ID="txtWeb" runat="server" width="300px" CssClass="form-control">
                                                            </asp:TextBox>
                                                        </div>  
                                                        <br /> <br />      
                                                        
                                                        <div class="form-group">
                                                            <label>Producto o Servicio: </label>
                                                            <asp:TextBox ID="txtProdServ" runat="server" width="289px" CssClass="form-control" >
                                                            </asp:TextBox>
                                                        </div>                                           
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>     
                            
                                    </div>
                                </div>
                            </div>
                        </div>

                   <%-- Direccion --%>
                    <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingDireccion">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDireccion" aria-expanded="true" aria-controls="collapseDireccion">DIRECCIÓN
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseDireccion" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingDireccion">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Iconos/IconDireccion.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                            <br />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">

                                                         <div class="form-group">
                                                            <label>Estado: </label>
                                                            <asp:DropDownList ID="ddlEstado" runat="server" AppendDataBoundItems="True"  width="330px" CssClass=" form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>   
                                                         </div>
                                                        <br /> <br /> 
                                                       
                                                         <div class="form-group">
                                                            <label>Colonia: </label>
                                                            <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" width="330px" required="required">
                                                            </asp:TextBox>
                                                         </div>
                                                        <br /> <br />
                                            
                                                        <div class="form-group">
                                                            <label>Numero Interior: </label>
                                                            <asp:TextBox ID="txtNumInt" runat="server" CssClass="form-control" width="275px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        <br /> <br />                                                        

                                                        <div class="form-group">
                                                            <label>Codigo Postal: </label>
                                                            <asp:TextBox ID="txtCodPos" runat="server" CssClass="form-control" type="number" width="285px"
                                                                pattern="^[0-9]*" title="Ingrese solo numeros"> 
                                                            </asp:TextBox>
                                                       </div>   
                                                        <br /> <br />
                              
                                                        </div>
                                                     </div>
                                                 </div>
                                        </div>

                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                            <br />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">
                                                             
                                                        <div class="form-group">
                                                            <label>Municipio: </label>
                                                            <asp:DropDownList ID="ddlMunicipio" runat="server" AppendDataBoundItems="True"  width="315px" CssClass=" form-control"></asp:DropDownList>
                                                        </div>
                                                        <br /> <br />

                                                        <div class="form-group">
                                                            <label>Calle: </label>
                                                            <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" width="345px" required="required">
                                                            </asp:TextBox>
                                                         </div>
                                                        <br /> <br />

                                                        <div class="form-group">
                                                            <label>Numero Exterior: </label>
                                                            <asp:TextBox ID="txtNumExt" runat="server" CssClass="form-control" width="270px"> 
                                                            </asp:TextBox>
                                                        </div>   
                                                        <br /> <br />
                                                        
                                                        <div class="form-group">
                                                            <label>Referencias: </label>
                                                            <asp:TextBox ID="txtReferencia" runat="server" CssClass="form-control"  width="300px">
                                                            </asp:TextBox>
                                                        </div> 
                                                        <br /> <br /> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                            
                                    </div>
                                </div>
                            </div>
                        </div>

                    <%-- Télefono --%>  
                    <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTelefono">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTelefono" aria-expanded="true" aria-controls="collapseTelefono">TELÉFONO
                                    </a>
                                </h4>
                            </div>
                                <div id="collapseTelefono" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTelefono">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                              <asp:Image ID="Image6" runat="server" ImageUrl="~/images/Iconos/IconTelefono.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                       
                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                            <br />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">

                                                         <div class="form-group">
                                                            <label>Celular: </label>
                                                            <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control" type="number" 
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="332px">
                                                            </asp:TextBox>
                                                         </div>                                                       
                                                         <br /><br />

                                                         <div class="form-group">
                                                            <label>Tel. Alterno: </label>
                                                            <asp:TextBox ID="txtTelEncargador" runat="server" CssClass="form-control" type="number" 
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="303px" >
                                                            </asp:TextBox>                                           
                                                         </div>
                                                        <br /><br />
                                                         
                                                         <div class="form-group">
                                                            <label>Otro: </label>
                                                            <asp:TextBox ID="txtTelOtro" runat="server" CssClass="form-control" type="number" 
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="349px" >
                                                            </asp:TextBox>                                           
                                                         </div>
                                                       </div>
                                                     </div>
                                                   </div>
                                                 </div>

                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">

                                            <div class="panel panel-body">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <div class="panel-title">
                                                            Registrar al proveedor
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">
                                                                                                
                                                        <a  href="/InicioAdmin.aspx" class="nav-link" >
                                                            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success" OnClick="btnRegistrar_Click" />
                                                        </a>
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
               </div>
             </div>
            </div>
          </div>  
        </div>
      </div>

    <%--Boton para expandir la información de la tabla --%>
  <div class="col">
    <div class="collapse multi-collapse" id="multiCollapseExample2">
      <div class="card card-body">
            <%-- Tabla de consulta de trabajadores --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">PROVEEDORES ACTIVOS
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:BoundField DataField="strNombre" HeaderText="strNombre" SortExpression="strNombre" />
                            <asp:BoundField DataField="strApellidoP" HeaderText="strApellidoP" SortExpression="strApellidoP" />
                            <asp:BoundField DataField="strApellidoM" HeaderText="strApellidoM" SortExpression="strApellidoM" />
                            <asp:BoundField DataField="strCorreo" HeaderText="strCorreo" SortExpression="strCorreo" />
                            <asp:BoundField DataField="strCelular" HeaderText="strCelular" SortExpression="strCelular" />
                            <asp:BoundField DataField="strUsuario" HeaderText="strUsuario" SortExpression="strUsuario" />
                            <asp:BoundField DataField="strPassword" HeaderText="strPassword" SortExpression="strPassword" />
                        </Columns>
                         
                         <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Font-Size="16px"/>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" SelectCommand="select e.strNombre, e.strApellidoP, e.strApellidoM, e.strCorreo,
                                                t.strCelular, u.strUsuario, u.strPassword
                                                from tblProveedor e
                                                inner join tblDireccion d
                                                on e.fkDireccion = d.idDireccion
                                                inner join tblTelefono t
                                                on e.fkTelefono = t.idTelefono
                                                inner join tblUsuario u
                                                on e.fkLogin = u.idUsuario"></asp:SqlDataSource>



            </div>
        </div>
    </div>
      </div>
    </div>
  </div>

    <%-- Tabla de consulta de trabajadores --%>
    <div class="col">
        <div class="collapse multi-collapse" id="multiCollapseExample3">
              <div class="form-inline">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <label class="text-muted">Búsqueda de empleado: </label>
                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>  
               </div>      
                          
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Font-Size="14px" CssClass="btn btn-block btn-sm btn-success" Width="170px" OnClick="btnBuscar_Click"/>
                </div>

                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">

                </div>
                 <br /> <br />
                  <br /> <br />
                 <div class="panel panel-success">
                        <asp:GridView ID="GridProveedor" runat="server"  Width="100%" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowPaging="True" AutoGenerateColumns="false">
                    
                    <Columns>
                        <asp:BoundField DataField="strNombre" HeaderText="NOMBRE" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="APELLLIDO P." />
                        <asp:BoundField DataField="strApellidoM" HeaderText="APELLLIDO M." />                        
                        <asp:BoundField DataField="strCorreo" HeaderText="CORREO" />
                        
                        
                        
                        <asp:TemplateField HeaderText="EDITAR">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEditar" runat="server" ImageUrl="~/Administrador/Imagenes/editar.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="BORRAR">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnBorrar" runat="server" ImageUrl="~/Administrador/Imagenes/borrar.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                     <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Font-Size="16px"/>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                     </div>  
                </div>
        </div>
    </div>
</div>
</asp:Content>