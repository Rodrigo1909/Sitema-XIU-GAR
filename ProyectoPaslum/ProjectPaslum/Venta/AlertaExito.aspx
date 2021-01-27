<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="AlertaExito.aspx.cs" Inherits="ProjectPaslum.Venta.AlertaExito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
   
    <link href="../../Content/sweetalert/sweet-alert.css" rel="stylesheet" />
    <script src="../../js/swalert.js"></script>
    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/sweetalert.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">
        function alerta() {
            swal({
                title: "COMPRA EXITOSA",
                text: "Se ha realizado la compra, espere confirmación por correo electronico",
                icon: "success",
            });
        }
    </script>


</asp:Content>
