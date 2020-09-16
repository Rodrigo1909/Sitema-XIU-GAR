<%@ Page Title="" Language="C#" MasterPageFile="~/Profesor/Profesor.Master" AutoEventWireup="true" CodeBehind="PaseLista.aspx.cs" Inherits="ProjectPaslum.Profesor.PaseLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="../Alumno/scss/PersoDatos.css" rel="stylesheet" />
<div class="container">
  <div style="text-align:center">
    <h2>Pase de Lista</h2>
  </div>
  <div class="row">
    <div class="column">
      <img src="../Alumno/images/Profile.jpg" style="width:50%">
    </div>
       <div class="column">
          
    <div>
    <div class="form-group">
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
&nbsp;<asp:DropDownList ID="ddlMateria" runat="server" AppendDataBoundItems="True"  Height="100%" OnSelectedIndexChanged="ddlMateria_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>      
        </div>
     </div>

        <div class="form-group">
      <div class="col-xs-3">
         <br />
            Parcial 
&nbsp;<asp:DropDownList ID="ddlParcial" runat="server" AppendDataBoundItems="True"  Height="100%" ></asp:DropDownList>      
        </div>
     </div>
        <asp:Button ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" />
        <hr />
        <div>
        <img ID="imgCtrl" runat="server" />
        </div>
    </div>
      </div>
  </div>
</div>
</asp:Content>