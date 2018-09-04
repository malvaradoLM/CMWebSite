<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="RedCoSite.Productos" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h1>PRODUCTOS POR TAR</h1>
    <dx:ASPxLabel ID="lblfecha" runat="server" Font-Size="15px" Font-Bold="true"></dx:ASPxLabel>
      <dx:ASPxGridView ID="gvPedidos" runat="server" AutoGenerateColumns="false" EnableViewState="false" Width="100%" KeyFieldName="PedidoID">
                        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true" VerticalScrollableHeight="600" />
              <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true"/>
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="true" />
            <SettingsSearchPanel Visible="false" />  
             <Columns>
               <dx:GridViewDataTextColumn FieldName="Terminal" ReadOnly="True" VisibleIndex="0">
                        <DataItemTemplate>
                        <%#Eval("TerminalID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Estación" ReadOnly="True" VisibleIndex="1" >
                        <DataItemTemplate>
                        <%#Eval("Descripcion")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="87 Octanos" ReadOnly="True" VisibleIndex="1"  CellStyle-HorizontalAlign="Right">
                        <DataItemTemplate>
                        <%--<%#Eval("Precio87")%>--%>
                            <dx:ASPxLabel runat="server" Text='<%# string.Format("{0:C}",Eval("Precio87")) %>' />
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="91 Octanos" ReadOnly="True" VisibleIndex="2" CellStyle-HorizontalAlign="Right">
                        <DataItemTemplate>
                            <dx:ASPxLabel runat="server" Text='<%# string.Format("{0:C}",Eval("Precio91")) %>' />
                     <%--   <%#Eval("Precio91")%>--%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Diesel" ReadOnly="True" VisibleIndex="2" CellStyle-HorizontalAlign="Right">
                        <DataItemTemplate>
                        <%--<%#Eval("PrecioDiesel")%>--%>
                            <dx:ASPxLabel runat="server" Text='<%# string.Format("{0:C}",Eval("PrecioDiesel")) %>' />
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
        </Columns>
                    </dx:ASPxGridView>
</asp:Content>
