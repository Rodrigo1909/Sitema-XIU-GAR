﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="PrintCotizacionVenta.aspx.cs" Inherits="ProjectPaslum.Venta.PrintCotizacionVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    
   <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>


    <div class="container">
       <div style="text-align:center">
            <h2>Cotización</h2>
        </div>

        <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">

                                    <div class="form-group">
                                        <label>Fecha </label>
                                        <asp:TextBox ID="txtFecha" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                        
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp 
                                    <div class="form-group">
                                        <label>Vendedor </label>
                                        <asp:TextBox ID="txtVendedor" runat="server" width="500px" Enabled="false" style="text-align:center"></asp:TextBox>
                                    </div>
                                    
                                            
                                    <div class="form-group">
                                         <label>Cliente </label>
                                        <asp:TextBox ID="txtCliente" runat="server" width="500px" Enabled="false" style="text-align:center" ></asp:TextBox>
                                    </div>
                                &nbsp &nbsp &nbsp &nbsp 
                                     <div class="form-group">
                                         <label>Domicilio </label>
                                        <asp:TextBox ID="txtDomicilio" runat="server" width="500px" Enabled="false" style="text-align:center" ></asp:TextBox>
                                    </div>
                                    
                                    <div class="form-group">
                                         <label>Condiciones comerciales </label>
                                         <asp:TextBox ID="txtCondiciones" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 1" ></asp:TextBox>                                        
                                    </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="txtCondicion2" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 2"></asp:TextBox>
                                    </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="txtCondicion3" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 3"></asp:TextBox>
                                    </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="txtCondicion4" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 4"></asp:TextBox>
                                    </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="txtCondicion5" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 5"></asp:TextBox>
                                    </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="txtCondicion6" runat="server" width="1025px"  style="text-align:left" placeholder="Ingrese la condición 6"></asp:TextBox>
                                    </div>

                                </div>
                               </div>
                             </div>
                           </div>
                        </div>
                      </div>
                    </div>


        <div class="row">
            <div class="col">
                <div class="table-responsive">

           <table class="table">
            <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td colspan="2">
                
            <div class="panel panel-default">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="3px" 
                    AllowPaging="True" 
                    OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="BORRAR" />
                        <asp:BoundField DataField="idProducto" HeaderText="CODIGO" />
                        <asp:BoundField DataField="strNombre" HeaderText="DESCRIPCIÓN" />                        
                        <asp:TemplateField HeaderText="CANTIDAD">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="73px">1</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <%--<asp:BoundField DataField="subtotal" HeaderText="IMPORTE TOTAL" />--%>
                        <asp:TemplateField HeaderText="PRECIO VENTA">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="19px" Width="73px">0.0</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="COSTO">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Height="19px" Width="73px" Enabled="false" >0</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PRECIO SUGERIDO">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Height="19px" Width="73px" Enabled="false" ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>  

                    </Columns>
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
            </td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                Total final: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$
                <asp:Label ID="lblTotal2" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                Total con el precio sugerido: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                <asp:Button ID="Button1" runat="server" Text="Calcular" OnClick="Button1_Click" CssClass="btn btn-primary" />
                <asp:Button ID="Button2" runat="server" Text="Regresar" style="margin-left: 111px" Width="157px" OnClick="Button2_Click" CssClass="btn btn-primary" />
            </td>
            <td>
                <%--<asp:Button ID="Button3" runat="server" style="margin-left: 34px" Text="Cobrar" Width="120px"  OnClick="Button3_Click" CssClass="btn btn-primary" />--%>
                <asp:Button ID="Button4" runat="server" style="margin-left: 34px" Text="PDF" Width="120px"  OnClick="Button4_Click" CssClass="btn btn-primary" />
            </td>
        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
