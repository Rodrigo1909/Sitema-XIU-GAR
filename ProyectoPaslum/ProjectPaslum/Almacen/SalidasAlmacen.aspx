﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="SalidasAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.SalidasAlmacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="~/Content/sweetalert.css" rel="stylesheet" />


<%--    <script type="text/javascript">
        function Suspend() { 
            swal({ title: "Are you sure?", text: "You will not be able to recover this imaginary file!", 
                type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", 
                confirmButtonText: "Yes, delete it!", closeOnConfirm: false }, 
    
            function(){ swal("Deleted!", "Your imaginary file has been deleted.", "success"); }); 
        } 
    </script>--%>

<script src="~/Scripts/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>





<div class="container">
  <div style="text-align:center">
    <h2>Salida del almacén</h2>
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
                                        <label>Producto </label><asp:DropDownList ID="ddlProducto" runat="server" AppendDataBoundItems="True"  width="500px" OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                    
                                    <div class="form-group">
                                         <label>En existencia </label><asp:DropDownList ID="ddlExistente" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList>   
                                    </div>
                                        
                                    <div class="form-group">
                                         <label>Cantidad </label><asp:TextBox ID="txtCantidad" runat="server" width="500px" required="required" type="text" 
                                                pattern="^[0-9]*" title="Ingrese solo numeros"></asp:TextBox>
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp 
                                                         
                                    <div class="form-group">
                                          <label>Movimiento </label>
                                        <asp:DropDownList ID="ddlMovimiento" runat="server" AppendDataBoundItems="True"  width="500" CssClass=" form-control">
                                                <asp:ListItem Selected="True" Value="SELECCIONA"> Seleccionar </asp:ListItem>
                                                <asp:ListItem Value="SALIDA POR PRODUCCIÓN"> Salida por producción </asp:ListItem>
                                                <asp:ListItem Value="SALIDA POR DEVOLUCIÓN"> Salida por devolución</asp:ListItem>
                                        </asp:DropDownList>   
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>

                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                 </div>

                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Agregar" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnRegistrar_Click"  />
                </div>
            </div>
          </div>
        </div>

</div>
</asp:Content>