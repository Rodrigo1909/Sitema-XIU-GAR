<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="UniMedidaAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.UniMedidaAdmin" %>
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
                     
                    <div class="col-sm-2">
                        
                    </div>
                           
                     <div class="col-sm-6">
                        <a class="btn btn-success" data-toggle="modal" href="#addMarca">
                            <i class="icon-add">
                            </i>
                              <asp:Label ID="Label2" runat="server" Text="Marca"></asp:Label>
                        </a> 
                    </div>
                   </div>
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
                            <asp:TextBox runat="server" ID="txtNombre" class="form-control"  type="text"></asp:TextBox>
                        </div>
                    </div>
                    <br /> <br /> 
                                       
                    <div class="form-group">
                        <div class="col-xs-7">
                                Abreviatura
                            <asp:TextBox runat="server" ID="txtPresentacion" class="form-control"  type="text" ></asp:TextBox>                        
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

        <!-- Agregar Modal de Unidad de Medida-->
    <div class="modal fade" id="addMarca">
         <div class="left">
            <div class="modal-dialog">
                <div class="modal-content">

                  <div class="modal-header">
                    <h3 class="table-title">REGISTRO DE MARCA</h3>
                  </div>

                  <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-9">
                            Nombre
                            <asp:TextBox runat="server" ID="txtNombreMarca" class="form-control" required="" type="text"></asp:TextBox>
                        </div>
                    </div>
                    <br /> <br /> <br /> <br />
                                       
                    <div class="form-group">
                        <div class="col-xs-9">
                            Imagen (solo se aceptan imagenes JPG)
                            <asp:FileUpload ID="FileUpload" runat="server" CssClass="form-control" accept=".jpg" />
                            <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server" 
                                                            ControlToValidate="FileUpload" 
                                                            ErrorMessage="No es el formato requerido" Font-Bold="True" ForeColor="Red"
                                                            ValidationExpression="(.*?)\.(jpg)$"></asp:RegularExpressionValidator> 
                        </div>   
                    </div>  
                    <br /> <br />  <br /> <br />

                    <div class="modal-footer">
                        <div class="modalfooter">                             
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary"  Text="Cancelar" data-dismiss="modal"  />
                            <asp:Button ID="Button2" runat="server" class="btn btn-success"  Text="Aceptar" OnClick="Button2_Click" />
                         </div>
                        </div>
                </div> </div>
            </div>
        </div>
          </div>
   
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" 
                    DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="idUnidadMedida">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                       
                        <asp:BoundField DataField="idUnidadMedida" HeaderText="CODIGO" SortExpression="idUnidadMedida" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="strNombre" HeaderText="UNIDAD DE MEDIDA" SortExpression="strNombre" />
                        <asp:BoundField DataField="strAbreviatura" HeaderText="ABREVIATURA" SortExpression="strAbreviatura" />


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
                    SelectCommand="SELECT idUnidadMedida,strNombre, strAbreviatura FROM tblUnidadMedida WHERE (idActivo = 1)" 
                    DeleteCommand="UPDATE tblUnidadMedida SET idActivo = 0 WHERE (idUnidadMedida= @idUnidadMedida)" 
                    UpdateCommand="UPDATE tblUnidadMedida SET strNombre = @strNombre, strAbreviatura = @strAbreviatura WHERE (idUnidadMedida= @idUnidadMedida)">
                    <DeleteParameters>
                        <asp:Parameter Name="idUnidadMedida" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="strNombre" Type="String" />
                        <asp:Parameter Name="strAbreviatura" Type="String" />
                        <asp:Parameter Name="idUnidadMedida" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>

     <script type="text/javascript">
         function exito() {
             swal({
                 title: "EXITO",
                 text: "Se registro la nueva unidad de medida con exito.",
                 icon: "success",
             });
         }
            function alerta() {
                swal({
                    title: "FALLO",
                    text: "Existen campos que no han sido completados",
                    icon: "error",
                });
        }
    
    </script>
</asp:Content>
