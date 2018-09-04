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
            $(document).ready(function () {
                $("#popupAnchor").show();
            }
            );

        var popupWidth = 522;
        var containerPaddings=42;
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
    <style type="text/css">
        .templateTable
        {
            border-collapse: collapse;
            width: 100%;
        }
        .templateTable td
        {
            border: solid 1px #C2D4DA;
            padding: 6px;
        }
        .templateTable td.value
        {
            font-weight: bold; 
        }
        .imageCell 
        {
            width: 160px;
        }
    </style>
<div class="content">   
    
       <dx:ASPxRoundPanel ID="ASPxRoundPanel3" ClientInstanceName="roundPanel" HeaderText="PRECIO PRODUCTOS" runat="server" Width="100%" Visible="false" ShowCollapseButton="true"  AllowCollapsingByHeaderClick="True" View="Standard" Font-Size="20px" Border-BorderColor="Transparent" Font-Bold="true">
        <PanelCollection>
            <dx:PanelContent> 
                <div style="text-align:right">
                    <dx:ASPxLabel ID="lblFecha" runat="server"></dx:ASPxLabel>
                    <img src="Image/fuel-station.png" runat="server" /><dx:ASPxLabel ID="lbl87oct" runat="server"></dx:ASPxLabel>
                <img src="Image/fuel-station.png" runat="server" /><dx:ASPxLabel ID="lbl92oct" runat="server"></dx:ASPxLabel>
                <img src="Image/fuel-station.png" runat="server" /><dx:ASPxLabel ID="lbldiesel" runat="server"></dx:ASPxLabel>
                </div>
                
            </dx:PanelContent>
            </PanelCollection>
            </dx:ASPxRoundPanel>
    
    <div class="row">
                <div class="col-lg-2 col-md-6">
                    <div class="panel panel" style="background-color:lightgray">
                        <div class="panel-heading" style="height:126.45px">
                            <div class="row">
                                <div class="col-xs-3">
                                    <%--<i class="fa fa-comments fa-5x"></i>--%>
                                    <img src="Image/delivery.png" runat="server" />
                                &nbsp;</img>&nbsp;</img>&nbsp;</img></div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblTotalPedidos" runat="server" Text=""/></div>
                                    <div><h5>Total<br>
                                        Pedidos
                                        </h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                   <%-- <i class="fa fa-tasks fa-5x"></i>--%>
                                    <img src="~/Image/delivery-add.png" runat="server" />
                                &nbsp;</img>&nbsp;</img>&nbsp;</img></div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidoNuevo" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Nuevos</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <%--<i class="fa fa-shopping-cart fa-5x"></i>--%>
                                              <img src="~/Image/delivery-location.png" runat="server" />
                                &nbsp;</img>&nbsp;</img>&nbsp;</img></div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidoActual" runat="server" Text=""/></div>
                                    <div><h5>Pedidos<br>
                                        en Proceso
                                        
                                        </h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <div class="col-lg-2 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <%--<i class="fa fa-support fa-5x"></i>--%>
                                              <img src="~/Image/delivery-ok.png" runat="server" />
                                &nbsp;</img>&nbsp;</img>&nbsp;</img></div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidoCompletado" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Completados</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <%--<i class="fa fa-support fa-5x"></i>--%>
                                              <img src="~/Image/delivery-cancel.png" runat="server" />
                                &nbsp;</img>&nbsp;</img>&nbsp;</img></div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><asp:Label ID="lblPedidosCancelados" runat="server" Text=""/></div>
                                    <div><h5>Pedidos Cancelados</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     
       <dx:ASPxRoundPanel ID="ASPxRoundPanel2" ClientInstanceName="roundPanel" HeaderText="CRÉDITO" runat="server" Width="100%" ShowCollapseButton="true"  AllowCollapsingByHeaderClick="True"  View="Standard" Font-Size="20px" Border-BorderColor="Transparent" Font-Bold="true">
        <PanelCollection>
            <dx:PanelContent>
    <div class="row">
        <div class="col-lg-4 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">    
                                      <img src="~/Image/money-banknotes.png" runat="server" ></img>
</img>
                                      </img>
</img>
                                      </img>
</img>
                                      </img>
</img></img>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" style="font-size:30px"><asp:Label ID="lblCreditoOtorgado" runat="server" Text="" /></div>
                                    <div><h5>Crédito Otorgado</h5></div>
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
                                        <img src="~/Image/money-banknotes.png" runat="server"></img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" style="font-size:30px"><asp:Label ID="lblCreditoUtilizado" runat="server" Text=""/></div>
                                    <div><h5>Crédito Utilizado</h5></div>
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
                                        <img src="~/Image/money-banknotes.png" runat="server"></img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </img>
                                        </img>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" style="font-size:30px"><asp:Label ID="lblSaldo" runat="server" Text=""/></div>
                                    <div><h5>Disponible</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
                </dx:PanelContent>
            </PanelCollection>
           </dx:ASPxRoundPanel>
  <br />
     <dx:ASPxRoundPanel ID="ASPxRoundPanel1" ClientInstanceName="roundPanel" HeaderText="CALENDARIO DE PEDIDOS" runat="server" Width="100%"  AllowCollapsingByHeaderClick="True" View="Standard"  ShowCollapseButton="true" Font-Size="20px" Border-BorderColor="Transparent" Font-Bold="true">
        <PanelCollection>
            <dx:PanelContent>
    <div class="row">
        <table style="width:100%">
            <tr>
                <td style="width:55%"> 
             <dx:ASPxCalendar ID="ASPxCalendar" runat="server" ReadOnly="false"
            EnableMonthNavigation="true" EnableYearNavigation="false" AutoPostBack="false" ClientInstanceName="clientCalendar"
            OnDayCellInitialize="ASPxCalendar_DayCellInitialize" ShowWeekNumbers="false" Columns="1"
            OnDayCellPrepared="ASPxCalendar_DayCellPrepared" Theme="Office365" Width="100%" />   </td>
                <td>
                    <dx:ASPxGridView ID="grid" runat="server"  
        KeyFieldName="PedidoID" Width="100%" EnableRowsCache="false" AutoGenerateColumns="False">
                        <%----%>
        <Columns>
       <%--     <dx:GridViewDataColumn FieldName="FirstName"/>
            <dx:GridViewDataColumn FieldName="LastName" />
            <dx:GridViewDataColumn FieldName="BirthDate" />
            <dx:GridViewDataColumn FieldName="Title" />
            <dx:GridViewDataColumn FieldName="HireDate" />--%>
        </Columns>
        <%--<SettingsPager PageSize="1" />--%>
                           <%--<SettingsPager Mode="EndlessPaging" Visible="False">
                           </SettingsPager>--%>
                        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="false"  VerticalScrollableHeight="200"/> 
        <Templates>
            <DataRow>
                <div style="padding: 5px">
                    <table class="templateTable" style="height:100px">
                      <tr>
                            
                            <td class="value" colspan="5">
                             Fecha:   <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text='<%# Eval("Fecha", "{0:d}") %>' Font-Bold  />
                            </td>
                      </tr>
                        <tr>
                            <td class="imageCell" rowspan="4">
                                <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server" Value='<%# Eval("Imagen") %>' /> <%----%>
                            </td>
                            <td>
                               ID Pedido:
                            </td>
                            <td class="value" >
                                <dx:ASPxLabel ID="lblPedidoID" runat="server" Text='<%# Eval("PedidoID") %>' Font-Bold />
                            </td>
                            <td>
                                Nombre del Producto:
                            </td>
                            <td class="value">
                                <dx:ASPxLabel ID="lblProductoNombre" runat="server" Text='<%# Eval("ProductoNombre") %>' Font-Bold />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Estatus Pedido:
                            </td>
                            <td>
                                    <dx:ASPxBinaryImage ID="ASPxBinaryImage2" runat="server" Value='<%# Eval("ImagenEstatus") %>' /> <%----%>
                            </td>
                            <td class="value" colspan="3">
                                <dx:ASPxLabel ID="lblstatusnombre" runat="server" Text='<%# Eval("statusnombre") %>' Font-Bold />
                            </td>
                        </tr>
                     
                    </table>
                </div>
            </DataRow>
        </Templates>
                           <SettingsPager Visible="False">
                               <NextPageButton Visible="False">
                               </NextPageButton>
                               <PrevPageButton Visible="False">
                               </PrevPageButton>
                        </SettingsPager>
                           <Settings VerticalScrollBarStyle="VirtualSmooth" ShowFilterRow="True" VerticalScrollableHeight="305" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    </dx:ASPxGridView></td>
            </tr>
        </table>
                      <div id="popupAnchor" style="float: right; margin-right: -5px; margin-top:-338px">
    </div>
    <dx:ASPxCallback ID="ASPxCallback" runat="server" OnCallback="ASPxCallback_Callback"
        ClientInstanceName="ClientCallback">
        <ClientSideEvents CallbackComplete="ClientCallback_CallbackComplete" />
    </dx:ASPxCallback>
    <dx:ASPxPopupControl ID="ASPxPopupControl" runat="server" Width="470px" ClientInstanceName="ClientPopup"
        PopupAction="None" CloseAction="CloseButton">
    </dx:ASPxPopupControl>
    
    </div>
                              </dx:PanelContent>
            </PanelCollection>
           </dx:ASPxRoundPanel>
  
</div>
       
</asp:Content>
