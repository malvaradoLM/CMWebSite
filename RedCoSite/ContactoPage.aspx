<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactoPage.aspx.cs" Inherits="RedCoSite.ContactoPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table format-table" style="float:left" ">

        <thead>
              <tr>
                                <td colspan="2" style="text-align:center">
                                    <h1>DATOS DE CONTACTO</h1>
                                </td>
                            </tr>
        </thead>
                        <tbody>
                             <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div><h6>ID</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblEstacionID" runat="server" Text="ID" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                             <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div><h6>NOMBRE</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblNombre" runat="server" Text="Nombre" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div><h6>TELEFONO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblTelefono" runat="server" Text="Telefono" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                            <tr">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>EMAIL</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblEmail" runat="server" Text="Email" >
                                        </dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                        </tbody>    
                    </table>
</asp:Content>
