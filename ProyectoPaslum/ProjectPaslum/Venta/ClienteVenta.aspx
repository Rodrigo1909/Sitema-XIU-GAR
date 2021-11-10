<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="ClienteVenta.aspx.cs" Inherits="ProjectPaslum.Venta.ClienteVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />    
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js">
    </script><script src="../../Scripts/sweetalert.js">
    </script><script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<p>
  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="true" aria-controls="multiCollapseExample1">Nuevo Cliente Central</a>
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#multiCollapseExample4" aria-expanded="false" aria-controls="multiCollapseExample4">Nuevo Cliente Empresarial</button>
</p>

    <%--Boton para expandir la información para registrar un nuevo cliente--%>
    
    <div class="collapse multi-collapse" id="multiCollapseExample1">
      <div class="card card-body">
              <%-- Registro de nuevo empleado --%>   
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading"  >
                <h4 class="panel-title">
                    <a>REGISTRO DE NUEVO CLIENTE</a>
                </h4>            
                    <%-- Cliente --%>
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
                                            <asp:Image ID="imgProfe" runat="server" ImageUrl="~/images/Iconos/IconEdecanes.png" CssClass="img-responsive img-rounded" />
                                        </div>


                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">                                                        
                                                        <div class="form-group">
                                                            <label>Nombre: </label>
                                                            <asp:TextBox ID="txtNombre" runat="server" width="400px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>   
                                                         </div>    
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Establecimiento: </label>
                                                            <asp:TextBox ID="txtEstablecimiento" runat="server" width="400px" CssClass="form-control"> </asp:TextBox>                                                            
                                                        </div>
                                                        <br /> <br />
                                                        
                                                        <div class="form-group">
                                                            <label>Apellido Paterno: </label>
                                                            <asp:TextBox ID="txtAPaterno" runat="server" width="400px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>
                                                        </div>
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Correo: </label>
                                                            <asp:TextBox ID="txtCorreo" runat="server" width="400px" placeholder="Ejemplo@ejemplo.com"
                                                                 CssClass="form-control" TextMode="Email" title="Ingrese el formato de correo electronico">
                                                            </asp:TextBox>
                                                        </div>  
                                                        <br /> <br />


                                                        <div class="form-group">
                                                            <label>Apellido Materno: </label>
                                                            <asp:TextBox ID="txtAMaterno" runat="server" width="400px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
                                                            </asp:TextBox>
                                                        </div>  
                                                        
                                                        &nbsp &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Situacion Fiscal: </label>
                                                            <asp:TextBox ID="txtSituacion" runat="server" width="400px" CssClass="form-control" >
                                                            </asp:TextBox>
                                                        </div>                                                
                                                       <br /> <br />

                                                        <div class="form-group">
                                                            <label>Metodo de Pago: </label>
                                                            <asp:TextBox ID="txtMetodoPago" runat="server" width="400px" CssClass="form-control" 
                                                                type="Text" pattern="^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$" title="Ingrese solo letras">
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
                                                            <asp:DropDownList ID="ddlEstado" runat="server" AppendDataBoundItems="True"  width="390px" CssClass=" form-control"
                                                                             AutoPostBack="true" OnSelectedIndexChanged="ddlEstado_SelectedIndexChanged"></asp:DropDownList>   
                                                         </div>
                                                        

                                                        <div class="form-group">
                                                            <label>Municipio: </label>
                                                            <asp:DropDownList ID="ddlMunicipio" runat="server" AppendDataBoundItems="True"  width="390px" CssClass=" form-control"></asp:DropDownList>
                                                        </div>
                                                        

                                                        <div class="form-group">
                                                            <label>Calle: </label>
                                                            <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" width="390px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        

                                                         <div class="form-group">
                                                            <label>Colonia: </label>
                                                            <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" width="390px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        
                                            
                                                        <div class="form-group">
                                                            <label>Numero Interior: </label>
                                                            <asp:TextBox ID="txtNumInt" runat="server" CssClass="form-control" width="180px" >
                                                            </asp:TextBox>
                                                            </div>
                                                        &nbsp &nbsp &nbsp
                                                        <div class="form-group">
                                                            <label>Numero Exterior: </label>
                                                            <asp:TextBox ID="txtNumExt" runat="server" CssClass="form-control" width="180px"> 
                                                            </asp:TextBox>
                                                        </div>   
                                                        

                                                        <div class="form-group">
                                                            <label>Codigo Postal: </label>
                                                            <asp:TextBox ID="txtCodPos" runat="server" CssClass="form-control" type="number" width="390px"
                                                                pattern="^[0-9]*" title="Ingrese solo numeros"> 
                                                            </asp:TextBox>
                                                       </div>   
                                                        

                                                        <div class="form-group">
                                                            <label>Referencias: </label>
                                                            <asp:TextBox ID="txtReferencia" runat="server" CssClass="form-control"  width="390px">
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
                                                            Bodega
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">

                                                            <div class="form-group">
                                                                <label>Numero: </label>
                                                                <asp:TextBox ID="txtNumeroBodega" runat="server" CssClass="form-control" Width="350px" 
                                                                    pattern="^[0-9]*" title="Ingrese solo numeros" type="number"></asp:TextBox>
                                                            </div>
                                                            <br /> <br />
                                                            <div class="form-group">
                                                                <label>Horario de atención: </label>
                                                                <asp:TextBox ID="txtHorario" runat="server" CssClass="form-control" Width="350px" ></asp:TextBox>
                                                            </div>
                                                            <br /> <br />
                                                            <div class="form-group">
                                                                <label>Encargado: </label>
                                                                <asp:TextBox ID="txtEncargador" runat="server" CssClass="form-control" Width="350px" ></asp:TextBox>
                                                            </div>
                                                            <br /> <br />
                                                            <div class="form-group">
                                                                <label>Encargado de pagos: </label>
                                                                <asp:TextBox ID="txtPagos" runat="server" CssClass="form-control" Width="350px"></asp:TextBox>
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
                                                            <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control"  width="390px">
                                                            </asp:TextBox>
                                                         </div>                                                       
                                                         

                                                         <div class="form-group">
                                                            <label>Tel. Encargado: </label>
                                                            <asp:TextBox ID="txtTelEncargador" runat="server" CssClass="form-control"  width="390px" >
                                                            </asp:TextBox>                                           
                                                         </div>
                                                        
                                                         
                                                         <div class="form-group">
                                                            <label>Otro: </label>
                                                            <asp:TextBox ID="txtTelOtro" runat="server" CssClass="form-control" width="390px" >
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
                                                            Registrar al cliente
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">
                                                                                                
                                                        <a  href="/InicioAdmin.aspx" class="nav-link" >
                                                            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success"  width="340px" OnClick="btnRegistrar_Click" />
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
                          

    <%--Boton para expandir la información para registrar un nuevo cliente empresarial--%>
    
    <div class="collapse multi-collapse" id="multiCollapseExample4">
      <div class="card card-body">
              <%-- Registro de nuevo empleado --%>   
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading"  >
                <h4 class="panel-title">
                    <a>REGISTRO DE NUEVO CLIENTE EMPRESARIAL</a>
                </h4>            
                    <%-- Cliente --%>
                    <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOneCliente">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseCliente" aria-expanded="true" aria-controls="collapseCliente">DATOS BASICOS
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseCliente" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingCliente">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Iconos/IconEdecanes.png" CssClass="img-responsive img-rounded" />
                                        </div>


                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">                                                        
                                                        <div class="form-group">
                                                            <label>Nombre: </label>
                                                            <asp:TextBox ID="txtNombreEmpresarial" runat="server" width="400px" CssClass="form-control" >
                                                            </asp:TextBox>   
                                                         </div>    
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>RFC: </label>
                                                            <asp:TextBox ID="txtRFEmpresarial" runat="server" width="400px" CssClass="form-control"> </asp:TextBox>                                                            
                                                        </div>
                                                        
                                                        
                                                        <div class="form-group">
                                                            <label>Apellido Paterno: </label>
                                                            <asp:TextBox ID="txtPaternoEmpresarial" runat="server" width="400px" CssClass="form-control" >
                                                            </asp:TextBox>
                                                        </div>
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Correo: </label>
                                                            <asp:TextBox ID="txtCorreoEmpresarial" runat="server" width="400px" placeholder="Ejemplo@ejemplo.com"
                                                                 CssClass="form-control" TextMode="Email" title="Ingrese el formato de correo electronico">
                                                            </asp:TextBox>
                                                        </div>  


                                                        <div class="form-group">
                                                            <label>Apellido Materno: </label>
                                                            <asp:TextBox ID="txtMaternoEmpresarial" runat="server" width="400px" CssClass="form-control" >
                                                            </asp:TextBox>
                                                        </div>  
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        
                                                        <div class="form-group">
                                                            <label>N.I.F: </label>
                                                            <asp:TextBox ID="txtNIFEmpresarial" runat="server" width="400px" CssClass="form-control" >
                                                            </asp:TextBox>
                                                        </div>                

                                                        <div class="form-group">
                                                            <label>Metodo de Pago: </label>
                                                            <asp:TextBox ID="txtPagoEmpresarial" runat="server" width="400px" CssClass="form-control">
                                                            </asp:TextBox>
                                                        </div>  
                                                        &nbsp &nbsp &nbsp &nbsp 
                                                        <div class="form-group">
                                                            <label>Establecimiento: </label>
                                                            <asp:TextBox ID="txtEstablecimientoEmpresarial" runat="server" width="400px" CssClass="form-control"> </asp:TextBox>                                                            
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
                            <div class="panel-heading" role="tab" id="headingDireccionEmpresarial">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseDireccionEmpresarial" aria-expanded="true" aria-controls="collapseDireccionEmpresarial">DIRECCIÓN
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseDireccionEmpresarial" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingDireccionEmpresarial">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/images/Iconos/IconDireccion.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <br />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">

                                                         <div class="form-group">
                                                            <label>Estado: </label>
                                                            <asp:DropDownList ID="ddlEstadoEmpresarial" runat="server" AppendDataBoundItems="True"  width="260px" CssClass=" form-control"
                                                                             AutoPostBack="true" OnSelectedIndexChanged="ddlEstadoEmpresarial_SelectedIndexChanged"></asp:DropDownList>   
                                                         </div>
                                                        &nbsp &nbsp &nbsp

                                                        <div class="form-group">
                                                            <label>Municipio: </label>
                                                            <asp:DropDownList ID="ddlMunicipioEmpresarial" runat="server" AppendDataBoundItems="True"  width="260px" CssClass=" form-control"></asp:DropDownList>
                                                        </div>
                                                        &nbsp &nbsp &nbsp 

                                                        <div class="form-group">
                                                            <label>Calle: </label>
                                                            <asp:TextBox ID="txtCalleEmpresarial" runat="server" CssClass="form-control" width="260px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        <br />  

                                                         <div class="form-group">
                                                            <label>Colonia: </label>
                                                            <asp:TextBox ID="txtColoniaEmpresarial" runat="server" CssClass="form-control" width="260px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        &nbsp &nbsp &nbsp 
                                            
                                                        <div class="form-group">
                                                            <label>Numero Interior: </label>
                                                            <asp:TextBox ID="txtInteriorEmpresarial" runat="server" CssClass="form-control" width="260px" >
                                                            </asp:TextBox>
                                                         </div>
                                                        &nbsp &nbsp &nbsp

                                                        <div class="form-group">
                                                            <label>Numero Exterior: </label>
                                                            <asp:TextBox ID="txtExteriorEmpresarial" runat="server" CssClass="form-control" width="260px"> 
                                                            </asp:TextBox>
                                                        </div>   
                                                        <br /> 

                                                        <div class="form-group">
                                                            <label>Codigo Postal: </label>
                                                            <asp:TextBox ID="txtCPEmpresarial" runat="server" CssClass="form-control" type="number" width="260px"
                                                                pattern="^[0-9]*" title="Ingrese solo numeros"> 
                                                            </asp:TextBox>
                                                       </div>   
                                                        &nbsp &nbsp &nbsp

                                                        <div class="form-group">
                                                            <label>Referencias: </label>
                                                            <asp:TextBox ID="txtReferenciaEmpresarial" runat="server" CssClass="form-control"  width="260px">
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

                    <%-- Télefono --%>  
                    <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTelefonoEmpresarial">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTelefonoEmpresarial" aria-expanded="true" aria-controls="collapseTelefonoEmpresarial">CONTACTO
                                    </a>
                                </h4>
                            </div>
                                <div id="collapseTelefonoEmpresarial" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTelefonoEmpresarial">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                              <asp:Image ID="Image4" runat="server" ImageUrl="~/images/Iconos/IconTelefono.png" CssClass="img-responsive img-rounded" />
                                        </div>

                                       
                                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                            <br />
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <div class="form-inline">

                                                         <div class="form-group">
                                                            <label>Celular: </label>
                                                            <asp:TextBox ID="txtCelularEmpresarial" runat="server" CssClass="form-control" width="390px">
                                                            </asp:TextBox>
                                                         </div>         

                                                         <div class="form-group">
                                                            <label>Tel. Oficina: </label>
                                                            <asp:TextBox ID="txtOficinaEmpresarial" runat="server" CssClass="form-control" width="390px" >
                                                            </asp:TextBox>                                           
                                                         </div>
                                                         
                                                         <div class="form-group">
                                                            <label>Otro: </label>
                                                            <asp:TextBox ID="txtOtroEmpresarial" runat="server" CssClass="form-control"  width="390px" >
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
                                                            Registrar al cliente
                                                        </div>
                                                    </div>
                                                    <div class="panel-body">
                                                        <div class="form-inline">
                                                                                                
                                                        <a  href="/InicioAdmin.aspx" class="nav-link" >
                                                            <asp:Button ID="btnRegistarEmpresarial" runat="server" Text="Registrar" CssClass="btn btn-block btn-sm btn-success" width="340px" OnClick="btnRegistarEmpresarial_Click" />
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
                          
 

<script type="text/javascript">
        function alerta() {
            swal({
                title: "ERROR",
                text: "El correo ya esta registrado, favor de verificar la información.",
                icon: "error",
            });
        }
        
        function entonces() {
            swal({
                title: "FIN",
                text: "El nombre ya ha sido registrado",
                icon: "entonces cuando un"

            });
        }
            
        function exito() {
            swal({
                title: "EXITO",
                text: "Se registro al cliente con exito.",
                icon: "success",
            });
        }
    
</script>
</asp:Content>
