<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelacionPage.aspx.cs" Inherits="RedCoSite.CancelacionPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>CANCELACIÓN DE PEDIDOS</h1>
    <div style="width:100%">

    <dx:ASPxGridView ID="gvPedidos" runat="server" AutoGenerateColumns="false" EnableViewState="false" Width="100%" KeyFieldName="PedidoID">
                        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true" VerticalScrollableHeight="600" />
              <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true"/>
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="true" />
            <SettingsSearchPanel Visible="false" />  
                        <Columns>
              <dx:GridViewDataTextColumn  VisibleIndex="0" Width="3%">
                            <DataItemTemplate>
                            <dx:ASPxButton ID="btn" runat="server" Text="Cancelar" Width="100%" Paddings-Padding="0px" AutoPostBack="False" OnClick="btn_Click" Theme="SoftOrange"></dx:ASPxButton>
                            </DataItemTemplate>
              </dx:GridViewDataTextColumn>
              
               <dx:GridViewDataTextColumn FieldName="ID Pedido" ReadOnly="True" VisibleIndex="0">
                        <DataItemTemplate>
                        <%#Eval("PedidoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Estación" ReadOnly="True" VisibleIndex="1">
                        <DataItemTemplate>
                        <%#Eval("EstacionNombre")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Fecha Programada para Pedido" ReadOnly="True" VisibleIndex="1">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
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
                            <dx:GridViewDataTextColumn FieldName="Producto" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("ProductoNombre")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
        </Columns>
                    </dx:ASPxGridView>
        </div>
</asp:Content>
