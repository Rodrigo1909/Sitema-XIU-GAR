<%@ Page Title="" Language="C#" MasterPageFile="~/Almacen/Almacen.Master" AutoEventWireup="true" CodeBehind="AlertaAlerta.aspx.cs" Inherits="ProjectPaslum.Almacen.AlertaAlerta" %>
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
                title: "ERROR",
                text: "La cantidad de salida excede la cantidad en stock",
                icon: "error",
            });
        }
    </script>
</asp:Content>
