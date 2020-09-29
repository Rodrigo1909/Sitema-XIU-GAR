<%@ Page Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="EmpleadoAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.EmpleadoAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

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
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>   
                                                         </div>    
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Sexo: </label>
                                                            <asp:DropDownList ID="cmbSexo" runat="server" AppendDataBoundItems="True"  width="330px" CssClass=" form-control">
                                                                    <asp:ListItem Selected="True" Value="SELECCIONA"> --SELECCIONA-- </asp:ListItem>
                                                                    <asp:ListItem Value="HOMBRE"> HOMBRE </asp:ListItem>
                                                                    <asp:ListItem Value="MUJER"> MUJER </asp:ListItem>
                                                                    <asp:ListItem Value="DISTINTO"> DISTINTO </asp:ListItem>
                                                            </asp:DropDownList>   
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
                                                            <label>Edad: </label>
                                                            <asp:TextBox ID="txtEdad" runat="server" width="328px" CssClass="form-control" 
                                                                type="number" pattern="^[0-9]*" title="Ingrese solo numeros" ></asp:TextBox>                                                            
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
                                                            <label>Correo: </label>
                                                            <asp:TextBox ID="txtCorreo" runat="server" width="316px" placeholder="Ejemplo@ejemplo.com:"
                                                                 CssClass="form-control" TextMode="Email" title="Ingrese el formato de correo electronico">
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
                                                            Registra el Usuario y Constraseña
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">

                                                            <div class="form-group">
                                                                <label>Usuario: </label>
                                                                <asp:TextBox ID="txtUsuario" runat="server"
                                                                    placeholder="Usuario" required="required"
                                                                    CssClass="form-control" width="293px" ></asp:TextBox>
                                                            </div>
                                                            <br /> <br />

                                                            <div class="form-group">
                                                                <label>Rol: </label>
                                                                <asp:DropDownList ID="cmbRol" runat="server" 
                                                                    AppendDataBoundItems="True"  width="323px" 
                                                                    CssClass=" form-control">
                                                                    <asp:ListItem Selected="True" Value="SELECCIONA"> --SELECCIONA-- </asp:ListItem>
                                                                    <asp:ListItem Value="ADMINISTRADOR"> ADMINISTRADOR </asp:ListItem>
                                                                    <asp:ListItem Value="VENDEDOR"> VENDEDOR </asp:ListItem>    
                                                                </asp:DropDownList>   
                                                            </div>
                                                            <br /> <br />

                                                            <div class="form-group">
                                                                <label>Contraseña: </label>
                                                                <asp:TextBox ID="txtPass" runat="server"
                                                                    placeholder="Contraseña" required="required"
                                                                    CssClass="form-control" TextMode="Password" width="270px" ></asp:TextBox>
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
    <%--<div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">EMPLEADOS ACTIVOS
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataKeyNames="id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgEditar" CommandName="Editar" ImageUrl="Imagenes/editar.png" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Eliminar" Visible="True">
                                <ItemTemplate>
                                    <asp:ImageButton runat="server" ID="imgEliminar" CommandName="Eliminar" ImageUrl="Imagenes/borrar.png"
                   OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:TemplateField>

                        <asp:BoundField DataField="id" HeaderText="Clave" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" SortExpression="strNombre" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="Apellido P." SortExpression="strApellidoP" />
                        <asp:BoundField DataField="strApellidoM" HeaderText="Apellido M." SortExpression="strApellidoM" />
                        <asp:BoundField DataField="strCorreo" HeaderText="Correo" SortExpression="strCorreo" />
                        <asp:BoundField DataField="strCedula" HeaderText="Cedula" SortExpression="strCedula" />
                        <asp:BoundField DataField="strEspecialidad" HeaderText="Especialidad" SortExpression="strEspecialidad" />
                        <asp:BoundField DataField="strcelular" HeaderText="Celular" SortExpression="strcelular" />
                        <asp:BoundField DataField="strtelCasa" HeaderText="Tel.Casa" SortExpression="strtelCasa" />

                    </Columns>
                     <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="SELECT pro.id ,pro.strNombre, pro.strApellidoP, 
	   pro.strApellidoM, pro.strCorreo, pro.strCedula,
	   pro.strEspecialidad, tel.strcelular, tel.strtelCasa 
FROM TblProfesor as pro
inner join TblTelefono  as tel 
on pro.idTelefono = tel.id;"></asp:SqlDataSource>

            </div>
        </div>
    </div>--%>
      </div>
    </div>
  </div>

    <%-- Tabla de consulta de trabajadores --%>
    <div class="col">
        <div class="collapse multi-collapse" id="multiCollapseExample3">
              <div class="form-inline">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <label>Búsqueda de empleado: </label>
                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" Width="270px"></asp:TextBox>  
               </div>      
                          
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Font-Size="14px" CssClass="btn btn-block btn-sm btn-success" Width="170px" />
                </div>

                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

