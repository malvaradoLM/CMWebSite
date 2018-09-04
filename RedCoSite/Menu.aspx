<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="RedCoSite.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="Css/Estilo.css" type ="text/css" />
    `<link href="Css/MenuStyle.css" rel="stylesheet"  type="text/css"/>
    <table style="width:100%">
        <tr>
            <td style="text-align:right">
               <a href="MenuPedido.aspx" class="btn btn-success btn-lg btncustom">
                   <img src="Image/delivery1.png" runat="server" /> <h2>PEDIDOS </h2>
               </a>
            </td>
            <td>
                <a href="ConsultaPedidoPage.aspx" class="btn btn-warning btn-lg btncustom">
                    <img src="Image/order.png" runat="server" /><h2>SALDOS </h2>
    </a>
            </td>
        <td>
                <a href="Productos.aspx" class="btn btn-success btn-lg btncustom">
                    <img src="Image/Productos.png" runat="server" /><h2>PRODUCTOS </h2>
    </a>
            </td>
            </tr>
        
        <tr>
            <td style="text-align:right">
                <a href="ClientePage.aspx" class="btn btn-danger btn-lg btncustom">
      
                    <img src="Image/people-customers.png" runat="server" /><h2>CLIENTE </h2>
    </a>
            </td>
            <td>
                <a href="ContactoPage.aspx" class="btn btn-primary btn-lg btncustom">
      
                    <img src="Image/book-open.png" runat="server" /><h2>CONTACTO </h2>
    </a>
            </td>
        </tr>
    </table>
  
</asp:Content>
