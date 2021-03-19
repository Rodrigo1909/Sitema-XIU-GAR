<%@ Page Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="EmpleadoAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.EmpleadoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <div class="content">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>EMPLEADOS</h2>
                </div>                
             </div> 
        </div>          
    </div>
       
<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Nuevo empleado</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2">Empleados activos</button>
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
                    <a>REGISTRO DE NUEVO EMPLEADO</a>
                </h4>            
                    <%-- Empleado --%>
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
                                            <asp:Image ID="imgProfe" runat="server" ImageUrl="~/images/Iconos/IconEmpleado.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">                                                        
                                                       
                                                       <div class="form-group">
                                                            <label>Nombre: </label>
                                                            <asp:TextBox ID="txtNombre" runat="server" width="368px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras" >
                                                            </asp:TextBox>   
                                                         </div>    
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Sexo: </label>
                                                            <asp:DropDownList ID="cmbSexo" runat="server" AppendDataBoundItems="True"  width="330px" 
                                                                CssClass=" form-control" >
                                                                    <asp:ListItem Selected="True" Value="SELECCIONA"> Seleccionar </asp:ListItem>
                                                                    <asp:ListItem Value="HOMBRE"> Hombre </asp:ListItem>
                                                                    <asp:ListItem Value="MUJER"> Mujer </asp:ListItem>
                                                                    <asp:ListItem Value="DISTINTO"> Otro </asp:ListItem>
                                                            </asp:DropDownList>   
                                                         </div>
                                                        <br /> <br />
                                                        
                                                        <div class="form-group">
                                                            <label>Apellido Paterno: </label>
                                                            <asp:TextBox ID="txtAPaterno" runat="server" width="310px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras" >
                                                            </asp:TextBox>
                                                        </div>
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Edad: </label>
                                                            <asp:TextBox ID="txtEdad" runat="server" width="328px" CssClass="form-control" 
                                                                type="number" pattern="^[0-9]*" title="Ingrese solo numeros" ></asp:TextBox>                                                            
                                                        </div>
                                                        <br /> <br />


                                                        <div class="form-group">
                                                            <label>Apellido Materno: </label>
                                                            <asp:TextBox ID="txtAMaterno" runat="server" width="307px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras" >
                                                            </asp:TextBox>
                                                        </div>
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Correo: </label>
                                                            <asp:TextBox ID="txtCorreo" runat="server" width="316px" placeholder="Ejemplo@ejemplo.com:" 
                                                                 CssClass="form-control" TextMode="Email" title="Ingrese el formato de correo electronico" >
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
                                                            <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" width="330px" >
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
                                                            <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" width="345px" >
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
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="330px">
                                                            </asp:TextBox>
                                                         </div>                                                       
                                                         <br /><br />

                                                         <div class="form-group">
                                                            <label>Tel. Casa: </label>
                                                            <asp:TextBox ID="txtTelCasa" runat="server" CssClass="form-control" type="number" 
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="315px" >
                                                            </asp:TextBox>                                           
                                                         </div>
                                                        <br /><br />
                                                         
                                                         <div class="form-group">
                                                            <label>Otro: </label>
                                                            <asp:TextBox ID="txtTelOtro" runat="server" CssClass="form-control" type="number" 
                                                                pattern="^[0-9]*" title="Ingrese solo numeros" width="345px" >
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
                                                            Seleccione el rol
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">

                                                            <div class="form-group">
                                                                <label>Rol: </label>
                                                                <asp:DropDownList ID="cmbRol" runat="server" 
                                                                    AppendDataBoundItems="True"  width="323px" 
                                                                    CssClass=" form-control" >
                                                                    <asp:ListItem Selected="True" Value="SELECCIONA"> Seleccionar </asp:ListItem>
                                                                    <asp:ListItem Value="ADMINISTRADOR"> Administrador </asp:ListItem>
                                                                    <asp:ListItem Value="VENDEDOR"> Vendedor </asp:ListItem>
                                                                    <asp:ListItem Value="ALMACEN"> Almacén </asp:ListItem>    
                                                                </asp:DropDownList>   
                                                            </div>
                                                             <hr />
                                                                                                
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
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">EMPLEADOS ACTIVOS
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>

                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" SortExpression="strNombre" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="ApellidoP" SortExpression="strApellidoP" />
                        <asp:BoundField DataField="strApellidoM" HeaderText="ApellidoM" SortExpression="strApellidoM" />
                        <asp:BoundField DataField="strCorreo" HeaderText="Correo" SortExpression="strCorreo" />
                        <asp:BoundField DataField="strCelular" HeaderText="Celular" SortExpression="strCelular" />
                        <asp:BoundField DataField="strUsuario" HeaderText="Usuario" SortExpression="strUsuario" />
                        <asp:BoundField DataField="strTipousuario" HeaderText="Rol" SortExpression="strTipousuario" />

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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                    SelectCommand="select e.strNombre, e.strApellidoP, e.strApellidoM, e.strCorreo,
                                    t.strCelular, u.strUsuario, u.strTipousuario from tblEmpleado e
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
                        <asp:GridView ID="GridEmpleado" runat="server"  Width="100%" BackColor="White" 
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

     <script type="text/javascript">
        function alerta() {
            swal({
                title: "ERROR",
                text: "El correo ya esta registrado, favor de verificar la información.",
                icon: "error",
            });
        }

            
        function exito() {
            swal({
                title: "EXITO",
                text: "Se registro al empleado con exito.",
                icon: "success",
            });
        }
    
    </script>

</asp:Content>

