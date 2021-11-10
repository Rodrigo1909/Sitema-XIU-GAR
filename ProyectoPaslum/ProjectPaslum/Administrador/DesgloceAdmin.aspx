<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="DesgloceAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.DesgloceAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
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
                                        <label>Fecha de la venta</label>
                                        <asp:TextBox ID="txtFecha" runat="server" width="250px" Enabled="false" style="text-align:center" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Fecha de entrega </label>
                                        <asp:TextBox ID="txtFechaFin" runat="server" width="250px" Enabled="false" style="text-align:center" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                <br /> <br />
                                      <div class="form-group">
                                        <label>Hora de entrega </label>
                                        <asp:TextBox ID="txtHoraEntrega" runat="server" width="250px" Enabled="false" style="text-align:center" CssClass="form-control"></asp:TextBox>
                                 &nbsp &nbsp &nbsp &nbsp
                                      </div>
                                <br /> <br />
                                <div class="form-group">
                                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar"  OnClick="btnRegresar_Click" CssClass="btn btn-success" Width="150px" Height="50px"/>
                                        
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
                </div>
        </div>

        
            
    </div>

       
     
    </div>


</asp:Content>
