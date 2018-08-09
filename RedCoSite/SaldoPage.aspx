<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SaldoPage.aspx.cs" Inherits="RedCoSite.SaldoPage" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label runat="server" ID="lblContenido"></asp:Label>
    <dx:BootstrapGridView ID="bgvSaldo" runat="server">
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsDataSecurity AllowEdit="True" />
        <Columns>
            <dx:BootstrapGridViewTextColumn FieldName=""  VisibleIndex="0">
                                <DataItemTemplate>
                                    <dx:ASPxButton ID="btnedit" runat="server" Text="..." Width="100%" Paddings-Padding="0px" AutoPostBack="False" OnClick="btnedit_Click" Theme="SoftOrange"></dx:ASPxButton>
                                </DataItemTemplate>
            </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="EstacionID" ReadOnly="True" VisibleIndex="1">
                   <DataItemTemplate>
                        <%#Eval("EstacionID")%>
                        </DataItemTemplate>
            </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="Saldo" ReadOnly="True" VisibleIndex="4">
                   <DataItemTemplate>
                        <%#Eval("Saldo")%>
                        </DataItemTemplate>
            </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="LimiteCredito" ReadOnly="True" VisibleIndex="2">
                   <DataItemTemplate>
                        <%#Eval("LimiteCredito")%>
                        </DataItemTemplate>
            </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="CreditoUsado" ReadOnly="True" VisibleIndex="3">
                   <DataItemTemplate>
                        <%#Eval("CreditoUsado")%>
                        </DataItemTemplate>
            </dx:BootstrapGridViewTextColumn>
            
        </Columns>
</dx:BootstrapGridView>
</asp:Content>

  
