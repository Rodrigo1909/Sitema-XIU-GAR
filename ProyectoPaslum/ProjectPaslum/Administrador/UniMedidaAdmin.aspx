<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="UniMedidaAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.UniMedidaAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/modales.css" rel="stylesheet" />
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>
    
    <div class="content">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Otros</h2>
                    </div>
                    <div class="button">
                    <div class="col-sm-6">
                        <a class="btn btn-success" data-toggle="modal" href="#addUnidadMedida">
                            <i class="icon-add">
                            </i>
                              <asp:Label ID="Label1" runat="server" Text="Nueva Unidad"></asp:Label>
                        </a> 
                    </div>
                   </div>
<%--                    &nbsp &nbsp &nbsp &nbsp
                    <div class="button">
                    <div class="col-sm-6">
                        <a class="btn btn-success" data-toggle="modal" href="#addRolTrabajo">
                            <i class="icon-add">
                            </i>
                              <asp:Label ID="Label2" runat="server" Text="Nuevo Rol"></asp:Label>
                        </a> 
                    </div>
                   </div>--%>
                </div>
            </div>

    </div>
    <!-- Agregar Modal de Unidad de Medida-->
    <div class="modal fade" id="addUnidadMedida">
         <div class="left">
            <div class="modal-dialog">
                <div class="modal-content">

                  <div class="modal-header">
                    <h3 class="table-title">REGISTRO DE UNIDAD DE MEDIDA</h3>
                  </div>

                  <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-7">
                            Nombre
                            <asp:TextBox runat="server" ID="txtNombre" class="form-control" required="" type="text"></asp:TextBox>
                        </div>
                    </div>
                    <br /> <br /> 
                                       
                    <div class="form-group">
                        <div class="col-xs-7">
                                Abreviatura
                            <asp:TextBox runat="server" ID="txtPresentacion" class="form-control" required="required" type="text" ></asp:TextBox>                        
                        </div>
                    </div>    
                    <br /> <br />  

                    <div class="modal-footer">
                        <div class="modalfooter">                             
                            <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary"  Text="Cancelar" data-dismiss="modal"  />
                            <asp:Button ID="btnaceptar" runat="server" class="btn btn-success"  Text="Aceptar" OnClick="btnaceptar_Click" />
                         </div>
                        </div>
                </div> </div>
            </div>
        </div>
          </div>
    
    <!-- Agregar Modal de Rol de Trabajo-->
    <%--<div class="modal fade" id="addRolTrabajo">
         <div class="left">
        <div class="modal-dialog">
            <div class="modal-content">

                  <div class="modal-header">
                    <h3 class="table-title">REGISTRO DE ROL DE TRABAJO</h3>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-7">
                            Nombre
                            <asp:TextBox runat="server" ID="txtRol" class="form-control" required="required" type="text"></asp:TextBox>
                        </div>
                    </div>
                 <br /> <br />  
                                    
                 <div class="form-group">
                    <div class="col-xs-7">
                            Abreviatura
                        <asp:TextBox runat="server" ID="txtAbreviatura" class="form-control" required="required" type="text" ></asp:TextBox>                        
                    </div>
                  </div>
                    <br /> <br />  

                 <div class="form-group">
                    <div class="col-xs-7">
                            Descripción
                        <asp:TextBox runat="server" ID="txtDescripRol" class="form-control" required="required" type="text" ></asp:TextBox>                        
                    </div>
                  </div>
                  <br /> <br /> 
                     
                 <div class="modal-footer">
                    <div class="modalfooter">                             
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary"  Text="Cancelar" data-dismiss="modal"  />
                            <asp:Button ID="Button2" runat="server" class="btn btn-success"  Text="Aceptar" />
                        </div>
                    </div>
                </div> 
            </div>
            </div>
        </div>
          </div>--%>
   
    <%-- Editar o eliminar Unidad de medida --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Unidades de Medida
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        
                        <asp:BoundField DataField="strAbreviatura" HeaderText="Abreviatura" SortExpression="strAbreviatura" />
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" SortExpression="strNombre" />

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

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:XIUGARConnectionString %>" 
                    SelectCommand="SELECT [strNombre], [strAbreviatura] FROM [tblUnidadMedida]"></asp:SqlDataSource>

            </div>
        </div>
    </div>

    <%-- Editar o eliminar Rol de trabajo --%>
<%--    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingRol">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseRol" aria-expanded="false" aria-controls="collapse">Roles de trabajo
                </a>
            </h4>
        </div>
        <div id="collapseRol" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">--%>
                <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select m.strNombre, m.strDescripcion, c.strnombre,cu.strnombre 
from TblMateria m
inner join TblCarrera c 
on m.idCarrera = c.id
inner join TblCuatri cu
on m.idCuatri = cu.id;"></asp:SqlDataSource>--%>

           <%-- </div>
        </div>
    </div>--%>

</asp:Content>
