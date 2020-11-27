﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="AlertaError.aspx.cs" Inherits="ProjectPaslum.Cliente.AlertaError" %>
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
                text: "No se ha seleccionado ningun articulo",
                icon: "error",
            });
        }
    </script>

</asp:Content>