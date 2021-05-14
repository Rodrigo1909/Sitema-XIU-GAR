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

     <div style="text-align:center">
        <h2>Datos del proveedor</h2>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            

                
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Proveedor </label><asp:DropDownList ID="ddlProveedor" runat="server" AppendDataBoundItems="True"  width="500px" 
                                            OnSelectedIndexChanged="ddlProveedor_SelectedIndexChanged" AutoPostBack="true" required="required"></asp:DropDownList>   
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
                                          <label>Entega en </label><asp:TextBox ID="txtEntregar" runat="server" width="500px" required="required" ></asp:TextBox>
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
                                         <asp:TextBox ID="txtCantidad" runat="server" width="500px" required="required" ></asp:TextBox>      
                                    </div>
                                     &nbsp &nbsp &nbsp &nbsp                                      
                                                         
                                    <div class="form-group">
                                         <label>Producto</label>
                                         <asp:TextBox ID="txtProducto" runat="server" width="500px" required="required" ></asp:TextBox>
                                    </div>
                                    
                                <br /><br />

                                    <div class="form-group">
                                         <label>Descripción</label>
                                         <asp:TextBox ID="txtDescripcion" runat="server" width="500px" required="required" ></asp:TextBox>
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                   
                                <br /><br />


                                    <div class="form-group">
                                         <label>Costo Unitario</label> 
                                         <asp:TextBox ID="txtCostoUni" runat="server"  width="500px" required="required" ></asp:TextBox> 
                                    </div>
                                    
                                    &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                         <label>Importe</label> 
                                         <asp:TextBox ID="txtImporte" runat="server"  width="500px" required="required" ></asp:TextBox> 
                                    </div>
                                    
                                &nbsp &nbsp &nbsp &nbsp

                                <div class="form-group">
                                    
                                      <div style="text-align:center">
                                          &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                                        <label>Seleccione los campos a utilizar</label> 
                                      

                                    <div class="form-inline">
                                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                                           <label>Descuento</label> 
                                        &nbsp &nbsp
                                           <asp:CheckBox ID="CheckBox1" AutoPostBack="true" Checked="false" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" />
                                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                                            <label>IVA</label> 
                                        &nbsp &nbsp
                                           <asp:CheckBox ID="CheckBox2" AutoPostBack="true" Checked="false" OnCheckedChanged="CheckBox2_CheckedChanged" runat="server" />
                                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                                            <label>I.V.A</label> 
                                        &nbsp &nbsp
                                           <asp:CheckBox ID="CheckBox3" AutoPostBack="true" Checked="false" OnCheckedChanged="CheckBox3_CheckedChanged" runat="server" />
                                        &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp
                                            <label>ISR</label> 
                                        &nbsp &nbsp
                                           <asp:CheckBox ID="CheckBox4" AutoPostBack="true" Checked="false" OnCheckedChanged="CheckBox4_CheckedChanged" runat="server" />
                                        </div>
                                   </div>
                                    </div>
                                 <div class="form-group">
                                     
                                         <label>Descuento</label>
                                         <asp:TextBox ID="txtDescuento" runat="server" width="500px"  enabled="false"></asp:TextBox>
                                       </div>
                                 
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                          <label>IVA </label>
                                        <asp:TextBox ID="txtIVA" runat="server"  width="500px" enabled="false" ></asp:TextBox>     
                                    </div>

                                    
                                <br /><br />
                                    <div class="form-group">
                                          <label>I.V.A. </label>
                                        <asp:TextBox ID="txtIVA2" runat="server"  width="500px" enabled="false" ></asp:TextBox>     
                                    </div>    

                                     &nbsp &nbsp &nbsp &nbsp

                                    <div class="form-group">
                                          <label>ISR </label>
                                        <asp:TextBox ID="txtISR" runat="server"  width="500px" enabled="false" ></asp:TextBox>     
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
                                         <label>Fecha de entrega</label>
                                        <asp:TextBox id="calEntregas" runat="server" TextMode="Date" required="required" width="500px" style="text-align:center" Height="40px"></asp:TextBox>
                                  </div>
                                     &nbsp &nbsp &nbsp &nbsp                                      
                                                         
                                    <div class="form-group">
                                         <label>Confirmo</label>
                                         <asp:TextBox ID="txtConfirmo" runat="server" width="500px" required="required" ></asp:TextBox>
                                    </div>
                                    
                                <br /><br />
                                                
                                </div>
                               </div>
                             </div>
                           </div>
                

                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" >
                          
                </div> 
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
                      <asp:Button ID="Button1" runat="server" Text="Visualizar PDF" Font-Size="16px" CssClass="btn btn-block btn-sm btn-info" Width="150px" OnClick="Button1_Click" />
                </div> 
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >                         
                      <asp:Button ID="Button2" runat="server" Text="Guardar O.C." Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="Button2_Click"/>
                </div>                
                        </div>
                      </div>
                    </div>
                     
    </div>
</asp:Content>