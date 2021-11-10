<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="DesgloceRequisicionVenta.aspx.cs" Inherits="ProjectPaslum.Venta.DesgloceRequisicionVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <%--<link href="../css/modales.css" rel="stylesheet" />    --%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

     <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    
    <div class="container">
       <div style="text-align:center">
            <h2>Requisición de compra</h2>
        </div>

        <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>N° Venta </label>
                                        <asp:TextBox ID="txtNumVen" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Fecha de la venta</label>
                                        <asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                
                                    <div class="form-group">
                                        <label>Fecha de entrega </label>
                                        <asp:TextBox ID="txtFechaFin" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Hora de entrega </label>
                                        <asp:TextBox ID="txtHoraEntrega" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                               </div>
                            </div> 
                            </div>
                           </div>
                        </div>
                      </div>
                    </div>
            
        <div class="panel panel-default">
            <div style="text-align:center">
            <h2>Desgloce de compra</h2>
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="true" Width="1100px"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" 
                            AllowPaging="True" >
                    
                    
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" Font-Size="Medium" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />                    
                        </asp:GridView>
                <br />
                
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <asp:Button ID="btnRegresa" runat="server" Text="Regresar" Font-Size="16px" CssClass="btn btn-block btn-sm alert-danger" Width="150px" OnClick="btnRegresa_Click" />
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <asp:Button ID="btnReimprimir" runat="server" Text="Reimprimir Venta" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnReimprimir_Click" />
        </div>  
                </div>
        </div>  
    </div>
 
        <div class="panel panel-default">
            <div style="text-align:center">
            <h2>Archivos</h2>

        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <asp:GridView ID="GridView3" runat="server"  AutoGenerateColumns="true" Width="1050px"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" 
                            AllowPaging="True" >
                    
                    
                            <FooterStyle BackColor="White" ForeColor="#E2C337" />                                
                                <HeaderStyle BackColor="#E2C337" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" Font-Size="Medium" />
                                <RowStyle ForeColor="#000066" />
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#00547E" />                    
                        </asp:GridView>


                            <div class="form-inline">

                               <div class="form-group">  
                                    <label>Seleccionar Factura: </label>
                                    <asp:FileUpload ID="archivoFactura" runat="server"  width="500px" style="text-align:center"/>  
                               </div>

                                    &nbsp &nbsp &nbsp &nbsp 

                                <div class="form-group">                                                                    
                                    <label>Seleccionar Nota Firmada: </label>                                    
                                    <asp:FileUpload ID="archivoNota" runat="server"  width="500px" style="text-align:center"/>  
                                </div>
                             
                            <br /> 
                            <br />
                            <br /> 
                            <br />

                    
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <asp:Button ID="btnSubirNota" runat="server" Text="Subir Nota firmada" Font-Size="16px" CssClass="btn btn-block btn-sm btn-primary" Width="165px" OnClick="btnSubirNota_Click" />
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                             <asp:Button ID="btnSubirFactura" runat="server" Text="Subir Factura" Font-Size="16px" CssClass="btn btn-block btn-sm btn-primary" Width="150px" OnClick="btnSubirFactura_Click" />
                        </div> 
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                        </div>                        
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                             
                        </div>  
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <asp:Button ID="btnDescargarFirma" runat="server" Text="Descargar Nota Firmada" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="230px" OnClick="btnDescargarFirma_Click" />
                        </div>                       
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                             <asp:Button ID="btnDescargarFactura" runat="server" Text="Descargar Factura" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="170px" OnClick="btnDescargarFactura_Click" />
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

        function vacio() {
            swal({
                title: "Incorrecto",
                text: "Existen campos vacios que son necesarios para continuar.",
                icon: "error",
            });
        }

        function subir() {
            swal({
                title: "Correcto",
                text: "Se subio el archivo con exito.",
                icon: "success",
            });
        }

        function bajar() {
            swal({
                title: "Incorrecto",
                text: "No se encuentra ningun archivo disponible.",
                icon: "error",
            });
        }
    
    </script>
</asp:Content>
