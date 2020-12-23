<%@ Page Language="C#" MasterPageFile="~/Venta/Venta.Master" AutoEventWireup="true" CodeBehind="LineaVenta.aspx.cs" Inherits="ProjectPaslum.Venta.LineaVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
    <style type = "text/css">
        body
        {
            font-family:Arial;
            font-size:10pt;
        }
    </style>


    
<asp:GridView ID="GridView1" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
    runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Identificador" ItemStyle-CssClass="Num" HeaderText="Id" ItemStyle-Width="30" />
        <asp:BoundField DataField="Establecimiento" ItemStyle-CssClass="Nombre" HeaderText="Nombre" ItemStyle-Width="200" />
        <asp:BoundField DataField="Total" ItemStyle-CssClass="Total" HeaderText="Total" ItemStyle-Width="150" />
        <asp:BoundField DataField="Fecha" ItemStyle-CssClass="Fecha" HeaderText="Fecha" ItemStyle-Width="150" />
        <asp:BoundField DataField="Estado" ItemStyle-CssClass="Description" HeaderText="Estado" ItemStyle-Width="150" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton Text="Detalle" ID="lnkView" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<div id="dialog" style="display: none">
    <b>Num. Venta:</b> <span id="num"></span>
    <br />
    <b>Fecha:</b> <span id="fecha"></span>
    <br />
    <b>Establecimiento:</b> <span id="nombre"></span>
    <br />
    <b>Total:</b> <span id="total"></span>
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    $(document).on("click", "[id*=lnkView]",
        function () {

            
        $("#num").html($(".Num", $(this).closest("tr")).html());
        $("#fecha").html($(".Fecha", $(this).closest("tr")).html());
        $("#nombre").html($(".Nombre", $(this).closest("tr")).html());
        $("#total").html($(".Total", $(this).closest("tr")).html());
        $("#dialog").dialog({
            title: "Detalle de la venta",
            buttons: {
                Ok: function () {
                    $(this).dialog('close');
                }
            },
            modal: true
        });
        return false;
    });
</script>

</asp:Content>