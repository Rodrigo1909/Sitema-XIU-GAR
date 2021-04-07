<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="EntradaAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.EntradaAlmacen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="container">
  <div style="text-align:center">
    <h2>Entrada al almacén</h2>
  </div>
 
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Almacenista </label><asp:Label ID="lbEmpleado" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <asp:TextBox ID="txtAlmacenista" runat="server" width="500px" Enabled="false"  ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Almacén </label><asp:DropDownList ID="ddlAlmacen" runat="server" AppendDataBoundItems="True"  
                                             width="500px" OnSelectedIndexChanged="ddlAlmacen_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList> 
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
                                        <label>Producto </label><asp:DropDownList ID="ddlProducto" runat="server" AppendDataBoundItems="True"  width="500px"  
                                            OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Cantidad existente</label><asp:DropDownList ID="ddlStock" runat="server" AppendDataBoundItems="True"  width="500px"  
                                            enabled="false"></asp:DropDownList>   
                                    </div>
                                <br /><br />
                                    <div class="form-group">
                                         <label>Cantidad a ingresar </label><asp:TextBox ID="txtCantidad" runat="server" width="500px" required="required" ></asp:TextBox>
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp 
                                     
                                                         
                                    <div class="form-group">
                                          <label>Movimiento </label>
                                        <asp:DropDownList ID="ddlMovimiento" runat="server" AppendDataBoundItems="True"  width="500" CssClass=" form-control">
                                                <asp:ListItem Selected="True" Value="SELECCIONA"> Seleccionar </asp:ListItem>
                                                <asp:ListItem Value="PRODUCCIÓN"> Producción </asp:ListItem>
                                            <asp:ListItem Value="ENTRADA"> Entrada</asp:ListItem>
                                                <asp:ListItem Value="ENTRADA POR PRODUCCIÓN"> Entrada por producción</asp:ListItem>
                                                <asp:ListItem Value="ENTRADA POR DEVOLUCIÓN"> Entrada por devolución </asp:ListItem>
                                        </asp:DropDownList>   
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>

                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                 </div>

                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Agregar" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnRegistrar_Click" />
                </div>
            </div>
          </div>
        </div>

</div>

     <script type="text/javascript">
        function alerta() {
            swal({
                title: "ERROR",
                text: "No se pudo realizar la entrada con exito, verifique los datos.",
                icon: "error",
            });
        }

            
        function exito() {
            swal({
                title: "EXITO",
                text: "Se registro la entrada de forma correcta.",
                icon: "success",
            });
        }
    
    </script>

</asp:Content>
