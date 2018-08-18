<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientePage.aspx.cs" Inherits="RedCoSite.ClientePage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
    
    <table class="table format-table" style="float:left" ">

        <thead>
              <tr>
                                <td colspan="2" style="text-align:center">
                                    <h1>DATOS DEL CLIENTE</h1>
                                </td>
                            </tr>
        </thead>
                        <tbody>
                             <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div><h6>ID ESTACIÓN</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblEstacionID" runat="server" Text="Estación ID" >
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
                                    <div><h6>RAZON SOCIAL</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblRazonSocial" runat="server" Text="Razon Social" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                            <tr">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>DOMICILIO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblDomicilio" runat="server" Text="Domicilio" >
                                        </dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 25%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>NoINTERIOR</h6></div>
                                </td>
                                <td align="left" style="width: 25%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblNoInterior" runat="server" Text="No Interior" >
                                        </dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 25%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>NoEXTERIOR</h6></div>
                                </td>
                                <td align="left" style="width: 25%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblNoExterior" runat="server" Text="No Exterior" >
                                        </dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>MUNICIPIO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblMunicipio" runat="server" Text="Municipio" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>CIUDAD</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblCiudad" runat="server" Text="Ciudad" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>ESTADO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblEstado" runat="server" Text="Ciudad" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr">
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>ZONA</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblZona" runat="server" Text="Zona" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>GRUPO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblGrupo" runat="server" Text="Grupo" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>R.F.C.</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblRFC" runat="server" Text="RFC" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>LIMITE DE CREDITO</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                    <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblLimiteCredito" runat="server" Text="Límite de Credito" >
                                        </dx:ASPxLabel></h6</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="columna1" align="right" style="width: 30%;">
                                    <div class="Cards-Titulos Transparencia HexColor-3"><h6>ESTATUS</h6></div>
                                </td>
                                <td align="left" style="width: 70%;">
                                            <div class="Cards-ContadorPequeno HexColor-3"><h6><dx:ASPxLabel ID="lblStatus" runat="server" Text="Status" ></dx:ASPxLabel></h6></div>
                                </td>
                            </tr>
                        </tbody>    
                    </table>

</asp:Content>
