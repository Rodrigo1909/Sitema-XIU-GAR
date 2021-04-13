<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="AlertaFallo.aspx.cs" Inherits="ProjectPaslum.Almacen.AlertaFallo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
            <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
   
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">

        function fallo() {
            swal({
                title: "ERROR",
                text: "No existe cantidad disponible para dar seguimiento",
                icon: "error",
            });
        }
    </script>
</asp:Content>
