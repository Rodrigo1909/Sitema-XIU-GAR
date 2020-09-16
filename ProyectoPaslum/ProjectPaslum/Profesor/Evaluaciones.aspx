<%@ Page Language="C#" MasterPageFile="~/Profesor/Profesor.Master" AutoEventWireup="true" CodeBehind="Evaluaciones.aspx.cs" Inherits="ProjectPaslum.Profesor.Evaluaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
    <div class="alert alert-success text-center" runat="server" id="alertError">
            <p class="h2"><i class="fa fa-save"></i>&nbsp;No se puede guardar, el porcentaje excede</p>
    </div>
    <div class="alert alert-success text-center" runat="server" id="alertBien">
            <p class="h2"><i class="fa fa-save"></i>&nbsp;Se guardo con exito</p>
    </div>
 
<div id="grupoTablas">
  <ul>
    <li><a href="#tab-1">PARCIALES</a></li>
    <li><a href="#tab-2">EVALUACIONES</a></li>
  </ul>
  <div id="tab-1">
      <asp:Label ID="lbProfe" runat="server" Text="Label" Visible="false"></asp:Label>
      <div class="col-xs-6">
                Materia:
                <asp:DropDownList ID="ddlMateria" runat="server" AppendDataBoundItems="True"  Height="100%" CssClass=" form-control" OnSelectedIndexChanged="ddlMateria_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>   
       </div>
       <div class="form-group">
                    <div class="col-xs-3">
                        Nombre:
                        <asp:TextBox runat="server" ID="TxtNombre" class="form-control"  type="text" ForeColor="Black"></asp:TextBox>
                        
                    </div>
           </div>
       <div class="form-group">
                    <div class="col-xs-3">
                        Descripcion:
                        <asp:TextBox runat="server" ID="TxtDescripcion" class="form-control" type="text" ForeColor="Black"></asp:TextBox>
                        
                    </div>
                </div>
       <div class="form-group">
                    <div class="col-xs-3">
                        Porcentaje %:
                        <asp:TextBox runat="server" ID="TxtPorcentaje" class="form-control"  type="number" ForeColor="Black"></asp:TextBox>
                        
                    </div>
                </div>
    
         <div class="form-group">
                    <div class="col-xs-3">
                        Porcentaje Acumuluado:<asp:Label ID="lbAcumulado" runat="server" Text="" ></asp:Label> 
                    </div>
                </div>
    
   <asp:Button ID="BtnAceptar" class="btn btn-info" runat="server" Text="Aceptar" OnClick="BtnAceptar_Click" ></asp:Button>
      <br>
      <br>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="strNombre" HeaderText="Nombre del Parcial" SortExpression="strNombre" />
            <asp:BoundField DataField="intPorcentaje" HeaderText="Porcentaje" SortExpression="intPorcentaje" />
            <asp:BoundField DataField="strDescripcion" HeaderText="Descripcion" SortExpression="strDescripcion" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pase_listaConnectionString %>" SelectCommand="select cp.strNombre,cp.intPorcentaje,cp.strDescripcion
            from TblCatalogoParcial cp
            join TblAsignacionMateria am
            on cp.idAsignacionMaeria = am.id
            where cp.idAsignacionMaeria = @idAsigMat
            group by cp.idAsignacionMaeria, cp.strNombre, cp.strDescripcion,cp.intPorcentaje">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddlMateria" Name="idAsigMat" PropertyName="SelectedValue" />
          </SelectParameters>
      </asp:SqlDataSource>

  </div>
  <div id="tab-2">
      
     <div class="form-group">
            <div class="col-xs-6">
                Parcial:
                <asp:DropDownList ID="ddlParcial" runat="server" AppendDataBoundItems="True"  Height="100%" CssClass=" form-control"></asp:DropDownList>   
            </div>
                <br/>
     </div>
     <div class="form-group">
                    <div class="col-xs-3">
                        Descripcion de la actividad:
                        <asp:TextBox runat="server" ID="TxtDescripcionActividad" class="form-control" type="text" ForeColor="Black"></asp:TextBox>
                        
                    </div>
           </div>
    
              <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="Aceptar" OnClick="Button1_Click" ></asp:Button>
  </div>
</div>
</asp:Content>
