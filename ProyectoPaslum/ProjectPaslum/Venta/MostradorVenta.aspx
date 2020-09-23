<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="MostradorVenta.aspx.cs" Inherits="ProjectPaslum.Venta.MostradorVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
<div class="container">
  <div style="text-align:center">
    <h2>Venta de Mostrador</h2>
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
                                        <asp:TextBox ID="txtVendedor" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Almacén </label><asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
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
                                        <label>Nombre </label><asp:DropDownList ID="ddlCliente" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Domicilio </label><asp:DropDownList ID="ddlDomicilio" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Lugar </label><asp:DropDownList ID="ddlLugar" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>Fecha: 23/09/2019</label>    
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
                    <br />
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                          <label>Bultos</label>
                                         <asp:TextBox ID="txtBulto" runat="server" width="500px"  ></asp:TextBox>      
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp       
                                    <div class="form-group">
                                        <label>Unidad de Medida</label>
                                        <asp:DropDownList ID="ddlUnidadMedida" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList>   
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                         <label>Descripción</label>
                                         <asp:DropDownList ID="ddlDescripcion" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                         <label>Importe</label> 
                                         <asp:TextBox ID="txtImporte" runat="server"  width="500px"  ></asp:TextBox> 
                                    </div>
                                     <br /><br />

                                    <div class="col-md-10 col-md-offset-2">
                                        <asp:Button ID="btnRegistrar" runat="server" Text="Agregar" Font-Size="14px" CssClass="btn btn-block btn-sm btn-success" Width="100px" />
                                    </div>
                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>

</div>


</asp:Content>