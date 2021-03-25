﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="DesgloceRequisicionAlmacen.aspx.cs" Inherits="ProjectPaslum.Almacen.DesgloceRequisicionAlmacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <%--<link href="../css/modales.css" rel="stylesheet" />    --%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    
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
                                        <asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp
                                    <div class="form-group">
                                        <label>Fecha de entrega </label>
                                        <asp:TextBox ID="txtFechaFin" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
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
