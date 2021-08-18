<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="AlmacenAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.AlmacenAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/modales.css" rel="stylesheet" />
     <link href="../Content/bootstrap.min.css" rel="stylesheet" />

        
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

       <style>
    #mdialTamanio{
      width: 150% !important;
    }
  </style>
    
    <div class="content">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>ALMACÉN</h2>
                    </div>
                    <div class="button">
                    <div class="col-sm-6">
                        <a class="btn btn-success" data-toggle="modal" href="#addAlmacenModal">
                            <i class="icon-add">
                            </i>
                              <asp:Label ID="Label1" runat="server" Text="Nuevo almacén"></asp:Label>
                        </a> 
                    </div>
                   </div>
                </div>
            </div>

    </div>
    <!-- Agregar Modal Materia-->
    <div class="modal fade" id="addAlmacenModal">
         <div class="left">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h3 class="table-title">REGISTRO DE NUEVO ALMACÉN </h3>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-10">
                            Nombre
                            <asp:TextBox runat="server" ID="txtNombre" class="form-control" required="" type="text"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-10">
                            Descripción
                            <asp:TextBox runat="server" ID="txtDescrip" class="form-control" type="text"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-10">
                            Capacidad
                            <asp:TextBox runat="server" ID="txtCapacidad" class="form-control"  type="text"></asp:TextBox>
                        </div>
                    </div>
                     
                         <!-- Seleccion de Carrera  -->
                        <div class="form-group">
                            <div class="col-xs-10">
                                Encargado de almacén
                                <asp:DropDownList ID="ddlEncargado" runat="server" AppendDataBoundItems="True"  Height="100%" CssClass=" form-control" ></asp:DropDownList>      
                              </div>
                         </div>
                       
                        <br /> <br /> 
                        <br /> <br />  <br /> <br />
                        <br /> <br />  <br /> <br />
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
       <%-- Editar o eliminar Almacén --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Almacenes disponibles
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource2"
                     BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="idAlmacen" >
                    <Columns>                       

                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

                        <asp:BoundField DataField="idAlmacen" HeaderText="idAlmacen" SortExpression="idAlmacen" InsertVisible="False" ReadOnly="True" Visible="false"/>
                        <asp:BoundField DataField="strNombre" HeaderText="ALMACÉN" SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="DESCRIPCIÓN" SortExpression="strDescripcion" />
                        <asp:BoundField DataField="intCapacidad" HeaderText="CAPACIDAD" SortExpression="intCapacidad" />

                        <asp:BoundField DataField="nombre" HeaderText="ENCARGADO" ReadOnly="True" SortExpression="nombre" />

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
                    SelectCommand="select alm.idAlmacen, alm.strNombre, alm.strDescripcion, alm.intCapacidad, 
                        (enc.strNombre + ' '+ enc.strApellidoP + ' ' + enc.strApellidoM) as nombre
                        from tblAlmacen alm
                        inner join tblEmpleado enc
                        on alm.fkEncargado = enc.idEmpleado
                        where alm.idActivo = '1';
                        " 
                    DeleteCommand="UPDATE tblAlmacen SET idActivo= '0' WHERE (idAlmacen = @idAlmacen)" 
                    UpdateCommand="UPDATE tblAlmacen SET strNombre = @strNombre, strDescripcion = @strDescripcion, intCapacidad = @intCapacidad WHERE (idAlmacen = @idAlmacen)">
                    <DeleteParameters>
                        <asp:Parameter Name="idAlmacen" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="strNombre" />
                        <asp:Parameter Name="strDescripcion"/>
                        <asp:Parameter Name="intCapacidad"/>
                        <asp:Parameter Name="idAlmacen" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        function exito() {
            swal({
                title: "EXITO",
                text: "Se registro al almacén con exito.",
                icon: "success",
            });
        }
    
    </script>

</asp:Content>
