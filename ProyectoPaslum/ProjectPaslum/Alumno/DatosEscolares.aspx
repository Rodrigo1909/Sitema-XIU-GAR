<%@ Page Title="" Language="C#" MasterPageFile="~/Alumno/Alumno.Master" AutoEventWireup="true" CodeBehind="DatosEscolares.aspx.cs" Inherits="ProjectPaslum.Alumno.DatosEscolares" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#grupoTablas" ).tabs();
  } );
</script>
    <script>
  $( function() {
    $( "#grupoMat" ).tab();
  } );
</script>

 
<div id="grupoTablas" title=".">
  <ul>
    <li><a href="#tab-1">CALIFICACIONES</a></li>
    <li><a href="#tab-2">HISTORIAL ACADEMICO</a></li>
  </ul>
  <div id="tab-1">

      <label for="fname">Carrera: </label>
       <asp:TextBox ID="TxtCarrera" runat="server" Enabled="false"></asp:TextBox>

      <asp:Label ID="lbGrupo" runat="server" Text="Label" ></asp:Label>


  </div>
  <div id="tab-2">
    <p>Visualizar todo el historial academico del alumno</p>
  </div>
</div>

   

</asp:Content>
