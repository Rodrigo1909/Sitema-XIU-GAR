<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente/Cliente.Master" AutoEventWireup="true" CodeBehind="CarritoCliente.aspx.cs" Inherits="ProjectPaslum.Cliente.CarritoCliente" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="table-responsive">
        <tr>
            <td colspan="3" style="text-align: center">
                <h1>Carrito de compras</h1></td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                <asp:TextBox ID="txtCodigo" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                <strong>Fecha :</strong></td>
            <td style="width: 397px">
                <asp:Label ID="lblFecha" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                Cliente :</td>
            <td style="width: 397px; margin-bottom:4px;margin-top:4px">
                <asp:TextBox ID="txtCliente" runat="server" Width="332px" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px; margin-bottom:4px;margin-top:4px"">
                Email :</td>
            <td style="width: 397px">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Email" Width="329px" CssClass="form-control"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div class="table-responsive">

                    <table class="table">
                        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="505px"
                    OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting"
                    OnRowDeleted="GridView1_RowDeleted" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table-responsive">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" HeaderText="Editar" />
                        <asp:BoundField DataField="idProducto" HeaderText="Codigo" />
                        <asp:BoundField DataField="strNombre" HeaderText="Descripcion" />
                        <asp:BoundField DataField="dblPrecio" HeaderText="Precio" />
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Height="19px" Width="73px">1</asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="subtotal" HeaderText="Sub Total" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                SubTotal S/ :&nbsp;
                <asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                IGV S/ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblIGV" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px; text-align: right">
                Total S/ :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 77px">
                &nbsp;</td>
            <td style="width: 397px">
                <asp:Button ID="Button1" runat="server" Text="Actualizar" OnClick="Button1_Click" CssClass="btn btn-primary" />
                <asp:Button ID="Button2" runat="server" Text="Continuar Compras" style="margin-left: 111px"
                    Width="157px" OnClick="Button2_Click" CssClass="btn btn-primary" />
            </td>
            <td>
                <asp:Button ID="Button3" runat="server" style="margin-left: 34px" Text="Comprar" Width="120px"
                    OnClick="Button3_Click" CssClass="btn btn-primary" />
            </td>
        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
