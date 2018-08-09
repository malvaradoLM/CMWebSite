<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultaPedidoPage.aspx.cs" Inherits="RedCoSite.ConsultaPedidoPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<table style="width:100%">
    <tr>
        <td>
            <h1>CONSULTA DE PEDIDOS ACTIVOS</h1>
        </td>
    </tr>
    <tr>
        <td>
            <dx:BootstrapGridView ID="gvPedido" runat="server" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="PedidoID">
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />
                <%--<SettingsDataSecurity AllowEdit="True" />--%>
                <Columns>
                    <dx:BootstrapGridViewTextColumn FieldName="Pedido ID" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("PedidoID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
              <dx:BootstrapGridViewTextColumn FieldName="Serie" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("Serie")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
              <dx:BootstrapGridViewTextColumn FieldName="Folio" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("Folio")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
              <dx:BootstrapGridViewTextColumn FieldName="Estatus Pedido" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("statusnombre")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="Fecha Creación" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
                </Columns>

           </dx:BootstrapGridView>


<%--<dx:ASPxGridView ID="gvPedido" ClientInstanceName="gvPedido" KeyFieldName="PedidoID" runat="server"  EnableTheming="True" Theme="BlackGlass" Width="100%" AutoGenerateColumns="False" EnableViewState="False"> 
        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true"  />
              <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true"/>
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
            <SettingsSearchPanel Visible="True" />                
        <Columns>
              <dx:GridViewDataTextColumn FieldName="ID Pedido" ReadOnly="True" VisibleIndex="0">
                        <DataItemTemplate>
                        <%#Eval("PedidoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              
              <dx:GridViewDataTextColumn FieldName="Serie" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("Serie")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Folio" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("Folio")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              
              <dx:GridViewDataTextColumn FieldName="Estatus Pedido" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("statusnombre")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fecha Creación" ReadOnly="True" VisibleIndex="10">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            
        </Columns>
    </dx:ASPxGridView>--%>
        </td>
    </tr>

</table>

</asp:Content>
