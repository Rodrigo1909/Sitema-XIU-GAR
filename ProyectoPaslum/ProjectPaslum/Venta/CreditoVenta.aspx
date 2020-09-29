<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="CreditoVenta.aspx.cs" Inherits="ProjectPaslum.Venta.CreditoVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="../css/modales.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="estilos.css" rel="stylesheet" />
<div class="container">
  <div style="text-align:center">
    <h2>Venta de Credito</h2>
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

                                    <div class="form-group">
                                        <label>Credito Fin </label><asp:Calendar ID="calFin" runat="server" width="500px" ></asp:Calendar>   
                                    </div>
                                    &nbsp &nbsp &nbsp &nbsp 
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

                                    
                                </div>
                               </div>
                             </div>
                           </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
            
                 </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                           <asp:Button ID="btnRegistrar" runat="server" Text="Agregar" Font-Size="16px" CssClass="btn btn-block btn-sm btn-success" Width="150px"  />
                </div>
                        </div>
                      </div>
                    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Descripción de venta
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
<%--                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="text-align:right">
            <asp:Button ID="btnFinalizar" runat="server" Text="Finalizar Venta" Font-Size="14px" CssClass="btn btn-block btn-sm btn-success" Width="250px" />
        </div>

         <br /><br /><br />

    </div>
                     
</div>
</asp:Content>