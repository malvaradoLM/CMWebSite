<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuPedido.aspx.cs" Inherits="RedCoSite.MenuPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Css/Estilo.css" type ="text/css" />
    <table style="width:100%">
        <tr>
            <td>
               <a href="NuevoPedidoPage.aspx" class="btn btn-success btn-lg btncustom">
      <span class="glyphicon glyphicon-plus"></span><p></p> Agregar un Pedido 
    </a>
            </td>
            <td>
                <a href="ConsultaPedidoPage.aspx" class="btn btn-warning btn-lg btncustom">
      <span class="glyphicon glyphicon-search"></span><p></p> Consultar Pedidos 
    </a>
            </td>
            <td>
                <a href="#" class="btn btn-danger btn-lg btncustom">
      <span class="glyphicon glyphicon-lock"></span><p></p> Historial de Pedidos 
    </a>
            </td>
        </tr>
    </table>
</asp:Content>
