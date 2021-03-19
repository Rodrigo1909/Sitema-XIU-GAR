<%@ Page Title="" Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="AlertaErrorAbono.aspx.cs" Inherits="ProjectPaslum.Venta.AlertaErrorAbono" %>
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
                title: "ERROR FATAL",
                text: "La cantidad que ingresas es superior al total a pagar, verifica tus datos",
                icon: "error",
            });
        }
    </script>

</asp:Content>