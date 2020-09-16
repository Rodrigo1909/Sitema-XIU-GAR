<%@ Page Title="" Language="C#" MasterPageFile="~/Profesor/Profesor.Master" AutoEventWireup="true" CodeBehind="Calificaciones.aspx.cs" Inherits="ProjectPaslum.Profesor.Calificaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  <script src="../Scripts/jquery-1.10.2.min.js"></script>

    <h2>CALIFICACIONES</h2>
    <div class="container">
        <div class="well">
            <asp:Label ID="lbProfe" runat="server" Text="Label" Visible="false"></asp:Label>
            <div class="col-xs-6">
                Materia:
                <asp:DropDownList ID="ddlMateria" runat="server" Height="100%" CssClass="form-control dropdown-toggle" OnSelectedIndexChanged="ddlMateria_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
           </div>

            <div class="col-xs-6">
                Parcial:
                <asp:DropDownList ID="ddlParcial" runat="server" Height="100%" CssClass="form-control dropdown-toggle" AutoPostBack="true"></asp:DropDownList>   
           </div>

            <div class="col-xs-6">
                Grupo:
                <asp:DropDownList ID="ddlGrupo" runat="server" Height="100%" CssClass="form-control dropdown-toggle" AutoPostBack="true"></asp:DropDownList>   
           </div>
            
        </div>
    </div>

    
    <%-- Asignar Calificación --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Alumnos
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="SqlDataSource1" >
                    <Columns>
                        <asp:BoundField DataField="ALUMNO" HeaderText="ALUMNO" SortExpression="ALUMNO" />
                        <asp:BoundField DataField="APELLIDO P." HeaderText="APELLIDO P." SortExpression="APELLIDO P." />
                        <asp:BoundField DataField="APELLIDO M." HeaderText="APELLIDO M." SortExpression="APELLIDO M." />
                        <asp:BoundField DataField="CALIFICACIÓN" HeaderText="CALIFICACIÓN" SortExpression="CALIFICACIÓN" />
                        <asp:BoundField DataField="GRUPO" HeaderText="GRUPO" SortExpression="GRUPO" />
                        <asp:BoundField DataField="PARCIAL" HeaderText="PARCIAL" SortExpression="PARCIAL" />
                    </Columns>
                    <HeaderStyle BackColor="#ffcc00" ForeColor="White" Font-Size="18px" />
                </asp:GridView>     
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select a.strNombre as 'ALUMNO', a.strApellidoP 'APELLIDO P.',a.strApellidoM 'APELLIDO M.',
c.valCalificacion as 'CALIFICACIÓN', g.strNombre as 'GRUPO',cp.strNombre as 'PARCIAL'
from TblCalificacion c
left join TblAlumno a 
on c.idAlumno = a.id
left join TblCatalogoParcial cp
on c.idCatalogoParcial = cp.id
left join TblGrupo g
on a.idGrupo = g.id
where g.id = @grupo and cp.id = @parcial
">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlGrupo" Name="grupo" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddlParcial" Name="parcial" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
