<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador/IndexAdministrador.master" AutoEventWireup="true" CodeBehind="CatProductoAdmin.aspx.cs" Inherits="ProjectPaslum.Administrador.CatProductoAdmin" %>

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
                        <h2>CATALOGO DE PRODUCTOS</h2>
                    </div>
                    <div class="button">
                    <div class="col-sm-6">
                        <a class="btn btn-success" data-toggle="modal" href="#addMateriaModal">
                            <i class="icon-add">
                            </i>
                              <asp:Label ID="Label1" runat="server" Text="Nuevo Producto"></asp:Label>
                        </a> 
                    </div>
                   </div>
                </div>
            </div>

    </div>
    <!-- Agregar Modal Materia-->
    <div class="modal fade" id="addMateriaModal">
         <div class="left">
        <div class="modal-dialog">
            <div class="modal-content">

                  <div class="modal-header">
                    <h3 class="table-title">REGISTRO DE NUEVO PRODUCTO</h3>
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
                            Almacén
                            <asp:DropDownList ID="ddlAlmacen" runat="server" AppendDataBoundItems="True"  CssClass=" form-control"></asp:DropDownList>      
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-10">
                            Precio
                            <asp:TextBox runat="server" ID="txtPrecio" class="form-control" type="text"></asp:TextBox>
                        </div>
                    </div>
                      
                    <div class="form-group">
                         <div class="col-xs-10">
                            Clasificación
                            <asp:DropDownList ID="cmbClasificacion" runat="server" AppendDataBoundItems="True" CssClass=" form-control" >                                
                                <asp:ListItem Value="MASCABADO"> Azúcar Mascabado </asp:ListItem>
                                <asp:ListItem Value="GLAS"> Azúcar Glas </asp:ListItem>
                                <asp:ListItem Value="REFINADA"> Azúcar Refinada </asp:ListItem>
                                <asp:ListItem Value="SOBRES"> Sobres de azúcar </asp:ListItem>
                                <asp:ListItem Value="SUSTITUTO"> Edulcorantes </asp:ListItem>
                                <asp:ListItem Value="ESTANDAR"> Azúcar Estandar </asp:ListItem>
                        </asp:DropDownList>   
                        </div>
                    </div>


                    <div class="form-group">
                    <div class="col-xs-5">
                        Presentación
                        <asp:TextBox runat="server" ID="txtPresentacion" class="form-control" required="required" type="text" 
                              pattern="^[0-9]*" title="Ingrese solo numeros"></asp:TextBox>

                    </div>
                 <div class="form-group">
                   <div class="col-xs-5">
                    <!-- Seleccion de Presentación  -->
                            Unidad de medida
                        <asp:DropDownList ID="ddlUnidadMedida" runat="server" AppendDataBoundItems="True" CssClass=" form-control"></asp:DropDownList>      
                   </div>     
                     </div>                     

                   </div>    
                     <div class="form-group">
                        <div class="col-xs-10">
                            <label for="nombre">Imagen</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                        </div>                
                    </div>
                        <br /> <br />  <br /> <br />  
                        <br /> <br />  <br /> <br />
                        <br /> <br />  <br /> <br />
                        <br /> <br />  <br /> <br />
                       <div class="modal-footer">
                            <div class="modalfooter">
                             
                                  <asp:Button ID="btncancel" runat="server" CssClass="btn btn-primary"  Text="Cancelar" data-dismiss="modal"  />
                                 <asp:Button ID="btnaceptar" runat="server" class="btn btn-success"  Text="Aceptar" OnClick="btnaceptar_Click"/>
                              </div>
                           </div>
                            </div> </div>
            </div>
        </div>
          </div>
       <%-- Editar o eliminar Producto --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Catalogo
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource2"
                     BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="idProducto" >
                    <Columns>
                        
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />

                        <asp:BoundField DataField="idProducto" HeaderText="CODIGO" SortExpression="idProducto" InsertVisible="False" ReadOnly="True" Visible="false"/>
                        <asp:BoundField DataField="strNombre" HeaderText="PRODUCTO" SortExpression="strNombre" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="DESCRIPCIÓN" SortExpression="strDescripcion" />
                        <asp:BoundField DataField="intPresentacion" HeaderText="PRESENTACIÓN" SortExpression="intPresentacion" />
                        <asp:BoundField DataField="strNombre1" HeaderText="MEDIDA" SortExpression="strNombre1" InsertVisible="False" ReadOnly="True"/>
                        <asp:BoundField DataField="strNombre2" HeaderText="ALMACÉN" SortExpression="strNombre2" InsertVisible="False" ReadOnly="True"/>

                        <asp:BoundField DataField="dblPrecio" HeaderText="PRECIO" SortExpression="dblPrecio" />

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
                    SelectCommand="select prod.idProducto, prod.strNombre, prod.strDescripcion, prod.intPresentacion,
                                    uni.strNombre, alm.strNombre, prod.dblPrecio
                                    from tblProducto prod
                                    inner join tblUnidadMedida uni
                                    on prod.fkUnidadMedida = uni.idUnidadMedida
                                    inner join tblAlmacen alm
                                    on prod.fkAlmacen = alm.idAlmacen
                                    where prod.idActivo = '1';
                        " DeleteCommand="UPDATE tblProducto SET idActivo= '0' WHERE (idProducto = @idProducto)" 
                    UpdateCommand="UPDATE tblProducto SET strNombre =@strNombre, strDescripcion =@strDescripcion, intPresentacion =@intPresentacion,dblPrecio = @dblPrecio where (idProducto = @idProducto)">
                    <DeleteParameters>
                        <asp:Parameter Name="idProducto" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="strNombre" />
                        <asp:Parameter Name="strDescripcion" />
                        <asp:Parameter Name="intPresentacion" />
                        <asp:Parameter Name="dblPrecio" />
                        <asp:Parameter Name="idProducto" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        function exito() {
            swal({
                title: "EXITO",
                text: "Se registro el producto con exito.",
                icon: "success",
            });
        }
    
    </script>
</asp:Content>