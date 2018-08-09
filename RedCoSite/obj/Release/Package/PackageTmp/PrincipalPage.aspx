<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrincipalPage.aspx.cs" Inherits="RedCoSite.PrincipalPage" %>

<%@ Register Assembly="DevExpress.XtraCharts.v17.2.Web, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraCharts.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--%>
    <link href="/Css/bootstrap.min.css" rel="stylesheet"/>
    <link href="Css/sb-admin-2.css" rel="stylesheet" />
    <link href="Css/font-awesome.min.css" rel="stylesheet" />
    <link href="Css/font-awesome.css" rel="stylesheet" />
        <script type="text/javascript">
        var popupWidth = 222;
        var containerPaddings=32;
        function ShowNotes(dateString) {
            ClientPopup.Hide();
            ClientCallback.PerformCallback(dateString);
        }
        function ClientCallback_CallbackComplete(s, e) {
            var parts = e.result.split("|");
            ClientPopup.SetHeaderText(parts[0]);
            ClientPopup.SetContentHTML(parts[1]);

            var maxContentWidth = clientCalendar.GetWidth() + popupWidth + containerPaddings;
            var windowWidth = window.innerWidth;
            if (windowWidth > maxContentWidth)
                ClientPopup.SetPopupElementID("popupAnchor");
            else
                ClientPopup.SetPopupElementID(clientCalendar.name);
            ClientPopup.Show();
        }
    </script>
<div class="content">
    <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblTotalPedidos" runat="server" Text=""/></div>
                                    <div><h5>Total Pedidos</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidoNuevo" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Nuevos</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidoActual" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Actualizados</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidosCancelados" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Cancelados</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <div class="row">
        <h2>CRÉDITO</h2>
        <div class="col-lg-4 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">    
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblCreditoOtorgado" runat="server" Text=""/></div>
                                    <div><h5>Crédito Otorgado</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <div class="col-lg-4 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">    
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblCreditoUtilizado" runat="server" Text=""/></div>
                                    <div><h5>Crédito Utilizado</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <div class="col-lg-4 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">    
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblSaldo" runat="server" Text=""/></div>
                                    <div><h5>Saldo</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
    <div class="row">
        <h2>CALENDARIO DE PEDIDOS</h2>
             <dx:ASPxCalendar ID="ASPxCalendar" runat="server" ReadOnly="false"
            EnableMonthNavigation="false" EnableYearNavigation="false" AutoPostBack="false" ClientInstanceName="clientCalendar"
            OnDayCellInitialize="ASPxCalendar_DayCellInitialize" ShowWeekNumbers="false" Columns="2"
            OnDayCellPrepared="ASPxCalendar_DayCellPrepared" Theme="Office365" Width="100%" />   
    <div id="popupAnchor" style="float: left; margin-left: 5px">
    </div>
    <dx:ASPxCallback ID="ASPxCallback" runat="server" OnCallback="ASPxCallback_Callback"
        ClientInstanceName="ClientCallback">
        <ClientSideEvents CallbackComplete="ClientCallback_CallbackComplete" />
    </dx:ASPxCallback>
    <dx:ASPxPopupControl ID="ASPxPopupControl" runat="server" Width="1120px" ClientInstanceName="ClientPopup"
        PopupAction="None" CloseAction="CloseButton">
    </dx:ASPxPopupControl>
    </div>
</div>
</asp:Content>
