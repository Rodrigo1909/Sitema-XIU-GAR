<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="PrincipalVendedor.aspx.cs" Inherits="ProjectPaslum.Venta.PrincipalVendedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
<div class="women_main">
    <!-- start content -->
    <div class="grids">
        <div class="progressbar-heading grids-heading">
            <h2>XIU-GAR Ventas del día</h2>
                               
        </div>
        <div class="panel panel-widget forms-panel">
            <div class="forms">
                <div class="form-grids widget-shadow" data-example-id="basic-forms">
                                       
                    <div class="form-body">
                        <div class="panel panel-default">
        
                            <div class="panel-body">
<%--                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                        
                                        <asp:BoundField DataField="strNombre" HeaderText="Materia" SortExpression="strNombre" />
                                        <asp:BoundField DataField="strDescripcion" HeaderText="Descripcion" SortExpression="strDescripcion" />
                                        <asp:BoundField DataField="strnombre1" HeaderText="Carrera" SortExpression="strnombre1" />
                                        <asp:BoundField DataField="strnombre2" HeaderText="Cuatrimestre" SortExpression="strnombre2" />

                                    </Columns>
                                        <FooterStyle BackColor="White" ForeColor="#000066" />
                                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                                        <RowStyle ForeColor="#000066" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select m.strNombre, m.strDescripcion, c.strnombre,cu.strnombre 
                                        from TblMateria m
                                        inner join TblCarrera c 
                                        on m.idCarrera = c.id
                                        inner join TblCuatri cu
                                        on m.idCuatri = cu.id;"></asp:SqlDataSource>--%>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>                  
</div>

          <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.easing.1.3.js"></script>
    <script src="../js/jquery.waypoints.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/jquery.animateNumber.min.js"></script>
    <script src="../js/scrollax.min.js"></script>
    <script src="../js/google-map.js"></script>
    <script src="../js/main.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
</asp:Content>
