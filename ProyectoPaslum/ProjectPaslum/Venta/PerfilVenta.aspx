<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="PerfilVenta.aspx.cs" Inherits="ProjectPaslum.Venta.PerfilVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<link href="../Administrador/css/modales.css" rel="stylesheet" />
<link href="../Content/bootstrap.min.css" rel="stylesheet" />

<div class="panel panel-default">
      <div style="text-align:center">
        <h2>Datos Personales</h2>
      </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../Alumno/images/Profile.jpg" CssClass="img-responsive img-rounded" />
                </div>

                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                    <br />
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                    <label>Nombre </label>
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                    </div>
                                <br /> <br /> 
                                                       
                                    <div class="form-group">
                                    <label>Apellido Paterno </label>
                                    <asp:TextBox ID="txtApellidoP" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                    </div>
                                <br /> <br />
                                            
                                    <div class="form-group">
                                    <label>Apellido Materno </label>
                                    <asp:TextBox ID="txtApellidoM" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                    </div>
                                <br /> <br />                                                        

                                <div class="form-group">
                                    <label>Correo </label>
                                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
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
                                    <label>Télefono </label>
                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                </div>                                

                                <div class="form-group">
                                    <label>Celular </label>
                                    <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Rol </label>
                                    <asp:TextBox ID="txtOtro" runat="server" CssClass="form-control" width="410px" Enabled="false"></asp:TextBox>
                                </div>   
                            </div>
                        </div>
                    </div>
                </div>
                            
            </div>
        </div>
    </div>
</asp:Content>
