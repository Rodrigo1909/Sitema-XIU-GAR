<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="DesgloceHistorialAbono.aspx.cs" Inherits="ProjectPaslum.Venta.DesgloceHistorialAbono" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />    
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />

    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <div class="container">
       <div style="text-align:center">
            <h2>Desgloce del historial de credito</h2>
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
                                        <label>Fecha fin del credito </label>
                                        <asp:TextBox ID="txtFechaFin" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Total a pagar </label>
                                        <asp:TextBox ID="txtTotal" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Saldo restante </label>
                                        <asp:TextBox ID="txtRestante" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                         <label>Abono </label>
                                        <asp:TextBox ID="txtAbono" runat="server" width="500px" style="text-align:center" ></asp:TextBox>
                                    </div>
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
            
                             </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <asp:Button ID="btnRegresa" runat="server" Text="Regresar" Font-Size="16px" CssClass="btn btn-block btn-sm alert-danger" Width="150px" OnClick="btnRegresa_Click" />
                            </div>

                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <asp:Button ID="Button1" runat="server"  Text="Abonar Efectivo" Width="150px" Font-Size="15px" CssClass="btn btn-block btn-sm btn-success" OnClick="Button1_Click"/>                                       
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
                <h2>Historial de credito</h2>
            </div>
            <div class="panel-body">
                        <asp:GridView ID="GridView2" runat="server"  AutoGenerateColumns="true" Width="1100px"
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" 
                            AllowPaging="True"   >
                    
                    
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
                        <br>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <asp:Button ID="btnReimprimir" runat="server" Text="Reimprimir Venta" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px" OnClick="btnReimprimir_Click" />
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
    
    </script>
</asp:Content>