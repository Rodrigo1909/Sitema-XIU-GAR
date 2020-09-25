<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="OrdenCompraVenta.aspx.cs" Inherits="ProjectPaslum.Venta.OrdenCompraVenta" %>
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
                                        <label>Comprador </label>
                                        <asp:TextBox ID="txtComprador" runat="server" width="500px"  ></asp:TextBox>
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
                                        <label>Proveedor </label><asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Domicilio </label><asp:DropDownList ID="ddlDomicilio" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Teléfono </label><asp:DropDownList ID="ddlTelefono" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                     <div class="form-group">
                                          <label>Entega en </label><asp:DropDownList ID="ddlEntrega" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
                                    </div>
                                    <br /><br />

                                     <div class="form-group">
                                          <label>Correo </label><asp:DropDownList ID="ddlCorreo" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList> 
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
                                          <label>Cantidad</label>
                                         <asp:TextBox ID="txtCantidad" runat="server" width="500px"  ></asp:TextBox>      
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp       
                                    <div class="form-group">
                                        <label>Unidad de Medida</label>
                                        <asp:DropDownList ID="ddlUnidadMedida" runat="server" AppendDataBoundItems="True"  width="500px" ></asp:DropDownList>   
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                         <label>Producto</label>
                                         <asp:TextBox ID="txtProducto" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp


                                    <div class="form-group">
                                         <label>Costo Unitario</label> 
                                         <asp:TextBox ID="txtCostoUni" runat="server"  width="500px"  ></asp:TextBox> 
                                    </div>
                                    <br /><br />
                                    
                                    <div class="form-group">
                                         <label>Importe</label> 
                                         <asp:TextBox ID="txtImporte" runat="server"  width="500px"  ></asp:TextBox> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>I.V.A.: 16%</label>    
                                    </div>
                                     <br /><br />
                                </div>
                               </div>
                             </div>
                           </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                 </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Generar OC." Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px"  />
                </div>
                        </div>
                      </div>
                    </div>

                     
</div>
</asp:Content>