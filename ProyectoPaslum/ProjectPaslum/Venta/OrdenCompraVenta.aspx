<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="OrdenCompraVenta.aspx.cs" Inherits="ProjectPaslum.Venta.OrdenCompraVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
<div class="container">
  <div style="text-align:center">
    <h2>Orden de Compra</h2>
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
                                        <asp:TextBox ID="txtComprador" runat="server" width="500px" Enabled="false" ></asp:TextBox>
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
            <div class="form-inline">
              <div style="text-align:center">
                 <h2>Datos del proveedor</h2>
               </div>
                </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Proveedor </label><asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="True"  width="500px" 
                                            OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
                                            
                                    <div class="form-group">
                                         <label>Domicilio </label><asp:DropDownList ID="ddlDomicilio" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                     <br /><br />
                                                         
                                    <div class="form-group">
                                          <label>Teléfono </label><asp:DropDownList ID="ddlTelefono" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                     <div class="form-group">
                                          <label>Entega en </label><asp:TextBox ID="txtEntregar" runat="server" width="500px" ></asp:TextBox>
                                    </div>
                                    <br /><br />

                                     <div class="form-group">
                                          <label>Correo </label><asp:DropDownList ID="ddlCorreo" runat="server" AppendDataBoundItems="True"  width="500px" Enabled="false"></asp:DropDownList> 
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>Fecha </label><asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" ></asp:TextBox>        
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
                                         <label>Producto</label>
                                         <asp:TextBox ID="txtProducto" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                    
                                <br /><br />

                                    <div class="form-group">
                                         <label>Descripción</label>
                                         <asp:TextBox ID="txtDescripcion" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                         <label>Descuento</label>
                                         <asp:TextBox ID="txtDescuento" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                <br /><br />


                                    <div class="form-group">
                                         <label>Costo Unitario</label> 
                                         <asp:TextBox ID="txtCostoUni" runat="server"  width="500px"  ></asp:TextBox> 
                                    </div>
                                    
                                    &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                         <label>Importe</label> 
                                         <asp:TextBox ID="txtImporte" runat="server"  width="500px"  ></asp:TextBox> 
                                    </div>
                                    
                                <br /><br />
                                    <div class="form-group">
                                          <label>I.V.A. </label>
                                        <asp:TextBox ID="txtIVA" runat="server"  width="500px"  ></asp:TextBox>     
                                    </div>
                                     <br /><br />
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
                                          <label>Fecha de Entrega</label>
                                         <asp:Calendar ID="calEntrega" runat="server" width="500px" ></asp:Calendar>         
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp                                      
                                                         
                                    <div class="form-group">
                                         <label>Confirmo</label>
                                         <asp:TextBox ID="txtConfirmo" runat="server" width="500px"  ></asp:TextBox>
                                    </div>
                                    
                                <br /><br />

                                   
                                </div>
                               </div>
                             </div>
                           </div>
                
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align:right">
                           <asp:Button ID="Button1" runat="server" Text="Generar OC." Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="Button1_Click"/>
                </div>                
                        </div>
                      </div>
                    </div>
                     
    </div>
</asp:Content>