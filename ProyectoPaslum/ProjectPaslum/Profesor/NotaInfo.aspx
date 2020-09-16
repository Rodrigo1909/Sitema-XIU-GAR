<%@ Page Title="" Language="C#" MasterPageFile="~/Profesor/Profesor.Master" AutoEventWireup="true" CodeBehind="NotaInfo.aspx.cs" Inherits="ProjectPaslum.Profesor.NotaInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
    <link href="css/modales.css" rel="stylesheet" />

    <h2>NOTAS INFORMATIVAS</h2>
    <div class="row">
        <div class="column">
            <img src="../Alumno/images/Profile.jpg" style="width: 50%">
        </div>

        <div class="column">

            <div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <br />
                        Materia:
                        <asp:DropDownList ID="ddlMateria" runat="server" Height="100%" CssClass="form-control dropdown-toggle"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <br />
                        Titulo:
                        <asp:TextBox ID="txtTitulo" runat="server" Height="80%" class="form-control" required="required" type="text"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <br />
                        Descipción:<asp:Label ID="lbProfe" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:TextBox ID="txtDescripcion" runat="server" Height="100%" class="form-control" required="required" type="text"></asp:TextBox>
                    </div>
                </div>
                <br />
                <asp:Button ID="btnaceptar" data-toggle="modal" runat="server" class="btn btn-success" Text="Aceptar" OnClick="btnaceptar_Click" />
            </div>
        </div>
    </div>


    <%-- Asignar Calificación --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Notas de información de todos los Profesores
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                     <Columns>
                        <asp:BoundField DataField="strNombre" HeaderText="Nombre" SortExpression="strNombre" />
                        <asp:BoundField DataField="strApellidoP" HeaderText="Apellido P" SortExpression="strApellidoP" />
                        <asp:BoundField DataField="strApellidoM" HeaderText="Apellido M" SortExpression="strApellidoM" />
                        <asp:BoundField DataField="strNombre1" HeaderText="Materia" SortExpression="strNombre1" />
                        <asp:BoundField DataField="strTitulo" HeaderText="Titulo" SortExpression="strTitulo" />
                        <asp:BoundField DataField="strDescripcion" HeaderText="Descripcion" SortExpression="strDescripcion"/>
                        <asp:BoundField DataField="fecha" HeaderText="Fecha/Hora" SortExpression="fecha" />
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

                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select p.strNombre, p.strApellidoP, p.strApellidoM,
m.strNombre,n.strTitulo, n.strDescripcion,n.fecha
from TblNota n
inner join TblProfesor p
on p.id = n.idProfesor
inner join TblMateria m
on m.id = n.idMateria
ORDER BY n.fecha DESC">
                </asp:SqlDataSource>

            </div>
        </div>
    </div>       
</asp:Content>
