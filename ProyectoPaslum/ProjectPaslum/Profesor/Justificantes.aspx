<%@ Page Title="" Language="C#" MasterPageFile="~/Profesor/Profesor.Master" AutoEventWireup="true" CodeBehind="Justificantes.aspx.cs" Inherits="ProjectPaslum.Profesor.Justificantes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link href="../Content/bootstrap.min.css" rel="stylesheet" />
  <script src="../Scripts/jquery-1.10.2.min.js"></script>

    <h2>JUSTIFICANTES</h2>
    <div class="container">
        <div class="well">
            <%--<div class="form-group">
      <div class="col-xs-3">
         <br />
            Carrera
          <asp:DropDownList ID="ddlCarrera" runat="server" AppendDataBoundItems="True"  Height="100%" ></asp:DropDownList>      
        </div>
     </div>

    <div class="form-group">
      <div class="col-xs-3">
         <br />
            Grupo
          <asp:DropDownList ID="ddlGrupo" runat="server" AppendDataBoundItems="True"  Height="100%" ></asp:DropDownList>      
        </div>
     </div>

    <div class="form-group">
      <div class="col-xs-3">
         <br />
            Materia <asp:Label ID="lbId" runat="server" Text="Label" Visible="false"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlMateria" runat="server" AppendDataBoundItems="True"  Height="100%" ></asp:DropDownList>      
        </div>
     </div>--%>
      <div class="form-group">
      <div class="col-xs-9">
          Ruta de archivo:
          <asp:TextBox ID="TextBox1" runat="server" Width="80%" Height="30px"></asp:TextBox> 
        </div>
          <div class="col-xs-3">
          <asp:Button ID="Button1" runat="server" Text="Abrir" OnClick="abrir_Click" CssClass="btn btn-success"/>
        </div>
     </div>
    </div>
      </div>
            
        

    <%-- Asignar Calificación --%>
    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="heading">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" aria-expanded="false" aria-controls="collapse">Justificantes enviados
                </a>
            </h4>
        </div>
        <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="id">
                     <Columns>
                         <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="strMotivo" HeaderText="Motivo" SortExpression="strMotivo" />
                        <asp:BoundField DataField="strArchivo" HeaderText="Archivo" SortExpression="strArchivo" />
                        <asp:BoundField DataField="fechaJusti" HeaderText="Fecha a justificar" SortExpression="fechaJusti" />
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

                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select * from TblJustificante">
                </asp:SqlDataSource>

            </div>
        </div>
    </div>  
    
</asp:Content>
