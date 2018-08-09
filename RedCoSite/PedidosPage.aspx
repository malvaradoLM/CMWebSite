<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PedidosPage.aspx.cs" Inherits="RedCoSite.PedidosPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   

      <script type="text/javascript">
          function ShowPopup() {
              $("#btnShowPopup").click();
          }
    </script>
      <script type="text/javascript">       
        var start;
        function grid_Init(s, e) {
            //grid.Refresh();
        }
        function grid_BeginCallback(s, e) {
            start = new Date();
            ClientCommandLabel.SetText(e.command);
            ClientTimeLabel.SetText("working...");
        }
        function grid_EndCallback(s, e) {
            ClientTimeLabel.SetText(new Date() - start);
        }
    </script>
    

    <div class="BottomLargeMargin" style="display:none">
            Command: <b><dx:ASPxLabel runat="server" ClientInstanceName="ClientCommandLabel" Text="..." /></b><br />
            Time taken (ms): <b><dx:ASPxLabel runat="server" ClientInstanceName="ClientTimeLabel" Text="..." /></b>
        </div>


        <div>
            <table style="margin-bottom:10px; width:25%">
                <tr>
                    <td class="auto-style1" colspan="3">Seleccione la terminal de almacenamiento y distribución(TAD) y la fecha de pedido para continuar</td>
                </tr>
                <tr>
                    <td class="auto-style1">TAD</td>
                    <td class="auto-style2">Fecha pedido</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1" style="padding-right:10px" ><dx:ASPxComboBox ID="CmbEstaciones" runat="server" ValueType="System.String"></dx:ASPxComboBox></td>
                    <td class="auto-style2" style="padding-right:10px"><dx:ASPxDateEdit ID="DtFecha" runat="server" ></dx:ASPxDateEdit></td>
                    <td><dx:ASPxButton ID="BtnBuscar" runat="server" AutoPostBack="false" Text="Buscar" Theme="iOS"></dx:ASPxButton></td>
                    <%--OnClick="BtnBuscar_Click"--%>
                </tr>
            </table>
        </div>
    <div>
    <button type="button" style="display:block;" id="btnShowPopup" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModal">
                Agregar Pedido
            </button>  
    </div>
    <dx:ASPxGridView ID="gvPedido" ClientInstanceName="gvPedido" KeyFieldName="PedidoID" runat="server"  EnableTheming="True" Theme="BlackGlass" Width="100%" AutoGenerateColumns="False" EnableViewState="False" OnSelectionChanged="gvPedido_SelectionChanged"  SettingsBehavior-ProcessSelectionChangedOnServer="True"> 
        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true"  />
              <SettingsBehavior AllowFocusedRow="True" />
            <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
    <%--           <Settings VerticalScrollBarStyle="VirtualSmooth" ShowFilterRow="True" />--%>
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true"/>
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
            <SettingsSearchPanel Visible="True" />                
        <Columns>
              <dx:GridViewDataTextColumn FieldName="ID Pedido" ReadOnly="True" VisibleIndex="0">
                        <DataItemTemplate>
                        <%#Eval("PedidoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ID Estación" ReadOnly="True" VisibleIndex="1">
                        <DataItemTemplate>
                        <%#Eval("EstacionID")%>
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
              <dx:GridViewDataTextColumn FieldName="Usuario" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("UsuarioID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Estatus Pedido" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("Status")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <%--<dx:GridViewDataTextColumn FieldName="Descuento" ReadOnly="True" VisibleIndex="6">
                        <DataItemTemplate>
                        <%#Eval("Descuento")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="IEPS" ReadOnly="True" VisibleIndex="7">
                        <DataItemTemplate>
                        <%#Eval("IEPS")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="IVA" ReadOnly="True" VisibleIndex="8">
                        <DataItemTemplate>
                        <%#Eval("IVA")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Total" ReadOnly="True" VisibleIndex="9">
                        <DataItemTemplate>
                        <%#Eval("Total")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="Fecha Creación" ReadOnly="True" VisibleIndex="10">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fecha Modificación" ReadOnly="True" VisibleIndex="11">
                        <DataItemTemplate>
                        <%#Eval("FechaModificacion")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn> 
            <dx:GridViewDataTextColumn FieldName="Observaciones" ReadOnly="True" VisibleIndex="12">
                        <DataItemTemplate>
                        <%#Eval("Observacion")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    
    <div>
        <button type="button" style="display:block;" id="btnShowPopupDetalle" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModalPedidoDetalle">
                Agregar Detalle Pedido
            </button>  
    </div>
    <dx:ASPxGridView ID="GridDetallePedido" runat="server"  EnableTheming="True" Theme="BlackGlass" Width="100%" AutoGenerateColumns="False" EnableViewState="False" > 
        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true"   />
              <SettingsBehavior AllowFocusedRow="True" />
            <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
               <Settings VerticalScrollBarStyle="VirtualSmooth" ShowFilterRow="True" />
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true" />
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
            <SettingsSearchPanel Visible="True" />                
        <Columns>
              <dx:GridViewDataTextColumn FieldName="ID Pedido Detalle" ReadOnly="True" VisibleIndex="0">
                        <DataItemTemplate>
                        <%#Eval("DetallePedidoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ID Producto" ReadOnly="True" VisibleIndex="1">
                        <DataItemTemplate>
                        <%#Eval("ProductoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ID Pedido" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("PedidoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Terminal" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("TerminalID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Vehiculo" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("VehiculoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Volumen" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("Volumen")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
<%--              <dx:GridViewDataTextColumn FieldName="Precio" ReadOnly="True" VisibleIndex="6">
                        <DataItemTemplate>
                        <%#Eval("Precio")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="SubTotal" ReadOnly="True" VisibleIndex="7">
                        <DataItemTemplate>
                        <%#Eval("SubTotal")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="IVA" ReadOnly="True" VisibleIndex="8">
                        <DataItemTemplate>
                        <%#Eval("IVA")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="IEPS" ReadOnly="True" VisibleIndex="9">
                        <DataItemTemplate>
                        <%#Eval("IEPS")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Total" ReadOnly="True" VisibleIndex="10">
                        <DataItemTemplate>
                        <%#Eval("Total")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descuento" ReadOnly="True" VisibleIndex="11">
                        <DataItemTemplate>
                        <%#Eval("Descuento")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="Items" ReadOnly="True" VisibleIndex="12">
                        <DataItemTemplate>
                        <%#Eval("NoItems")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>

        </Columns>
    </dx:ASPxGridView>
    

   <!-- Modal DetallePedido -->
<div class="modal fade" id="myModalPedidoDetalle">
                <div class="modal-dialog" style="left:0%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Agregar Pedido</h4>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Agregue Productos al pedido" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right:10PX">
                                        <div>
                                        <asp:Label ID="lblProducto" runat="server" Text="Producto" />
                                        <dx:ASPxComboBox ID="cmbProducto" runat="server" ValueType="System.String" AutoPostBack="false" ></dx:ASPxComboBox>                
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            
                        </div>
                        <div class="modal-footer">
                            <%--<dx:ASPxButton ID="btnGuardarDetalle" Theme="iOS" runat="server" Text="Guardar" AutoPostBack="false" onclick="btnGuardarDetalle_Click" ></dx:ASPxButton>--%>
                            <dx:ASPxButton ID="btnGuardarDetalle" Theme="iOS" OnClick="btnGuardarDetalle_Click" runat="server" Text="Guardar" AutoPostBack="false"></dx:ASPxButton>
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                Cancelar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->


<!-- Modal Pedidos-->
<div class="modal fade" id="myModal">
                <div class="modal-dialog" style="left:0%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Agregar un Pedido</h4>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        <div>
                                        <asp:Label ID="lblFechaCreacion" runat="server" Text="Fecha Creación Pedido"/>
                                        <dx:ASPxDateEdit ID="dtFechaCreacion" runat="server"></dx:ASPxDateEdit>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <dx:ASPxButton ID="btnAceptarDetalle" Theme="iOS" OnClick="btnAceptarDetalle_ServerClick" runat="server" Text="Guardar" AutoPostBack="false"></dx:ASPxButton>
                               <button type="button" class="btn btn-default" data-dismiss="modal">
                                Cancelar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->


</asp:Content>
