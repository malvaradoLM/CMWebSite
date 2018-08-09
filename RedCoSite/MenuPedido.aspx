<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuPedido.aspx.cs" Inherits="RedCoSite.MenuPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="Css/Estilo.css" type ="text/css" />
    <table style="width:100%">
        <tr>
            <td>
               <a href="NuevoPedidoPage.aspx" class="btn btn-success btn-lg btncustom">
      <%--<span class="glyphicon glyphicon-plus"></span>--%>
                   <img src="Image/deliveryPedido.png" runat="server" /><p></p><h3>AGREGAR PEDIDOS</h3>
    </a>
            </td>
            <td>
                <a href="ConsultaPedidoPage.aspx" class="btn btn-warning btn-lg btncustom">
      <%--<span class="glyphicon glyphicon-search"></span>--%>
                    <img src="Image/delivery-find.png" runat="server" /><p></p><h3>CONSULTAR PEDIDOS</h3> 
    </a>
            </td>
            <td>
                <a href="#" class="btn btn-danger btn-lg btncustom">
      <%--<span class="glyphicon glyphicon-lock"></span>--%>
                    <img src="Image/delivery-folder.png" runat="server" /><p></p><h3>HISTORIAL DE PEDIDOS</h3> 
    </a>
            </td>
        </tr>
    </table>
</asp:Content>
