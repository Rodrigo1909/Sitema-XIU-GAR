<%@ Page Title="" Language="C#" MasterPageFile="~/Alumno/Alumno.Master" AutoEventWireup="true" CodeBehind="ListaAsistencia.aspx.cs" Inherits="ProjectPaslum.Alumno.ListaAsistencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../../Scripts/bootstrap.min.js"></script>

      <div class="container">
            <div class="card">
                <h5 class="card-header"><i class="fa fa-file-text"></i>&nbsp;&nbsp;Consultar Lista Asistencia</h5>
                <div class="card-body">
                    <div class="form-group">
                            <div class="col-xs-4">
                             Inicio:
                             <asp:TextBox id="Inicio" runat="server" TextMode="Date" required="required"></asp:TextBox>
                            
                             Fin:
                             <asp:TextBox id="Fin" runat="server" TextMode="Date" required="required"></asp:TextBox>
                            
                            
                             Materia:
                             <asp:DropDownList id="ddlMateria" runat="server" AppendDataBoundItems="True" Height="50%" CssClass=" form-control" ></asp:DropDownList>
                            
                            </div>
                    </div>
                    <asp:Label ID="lbAlumno" runat="server" Text="Label" Visible="false"></asp:Label>
                    <div class="form-group">
                            <div class="col-xs-4">
                             Numero de Asitencia: <asp:TextBox id="txtNumero" runat="server" Enabled="false"></asp:TextBox>                             
                            </div>
                    </div>
                </div>
            </div>
            <br />
        </div>  
</asp:Content>
