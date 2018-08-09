<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoPedidoPage.aspx.cs" Inherits="RedCoSite.NuevoPedidoPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%--<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
    <script type="text/javascript">
          function ShowPopup() {
              $("#btnShowPopupDetalle").click();
          }
    </script>
    <button type="button" style="display:none;" id="btnShowPopupDetalle" class="btn btn-primary btn-lg"
                data-toggle="modal" data-target="#myModalPedidoDetalle">
                Agregar Detalle Pedido
            </button>  
    <div class="col-sm-12"> 
    
        <table style="width:100%">
            <tr>
                <td>
                    <h1>NUEVO PEDIDO</h1>
                         <div class="panel panel-default">

                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">Estación:</label>
                        <div class="col-sm-9">
                            <dx:ASPxComboBox ID="cmbEstacion" runat="server" ValueType="System.String" AutoPostBack="false" ></dx:ASPxComboBox>                
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">Fecha Programada de envio:</label>
                        <div class="col-sm-9">
                            <dx:ASPxDateEdit ID="dtFechaCreacion" runat="server"></dx:ASPxDateEdit>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">Producto:</label>
                        <div class="col-sm-9">
                            <dx:ASPxComboBox ID="cmbProducto" runat="server" ValueType="System.String" AutoPostBack="false" ></dx:ASPxComboBox>                
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">Volumen:</label>
                        <div class="col-sm-9">
                            <dx:ASPxComboBox ID="cmbVolumen" runat="server" ValueType="System.String" AutoPostBack="false" ></dx:ASPxComboBox>                
                        </div>
                    </div>
                   
                    <div class="form-group">
                        <div class="col-sm-12 text-center">
                            <dx:ASPxButton ID="btnAddPedido" CssClass="btn btn-success btn-lg" OnClick="btnAddPedido_Click" runat="server" Text="AGREGAR" AutoPostBack="false" Width="100%"></dx:ASPxButton>
                              <dx:ASPxButton ID="btnCancelar" CssClass="btn btn-danger btn-lg" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" AutoPostBack="false" Visible="false"></dx:ASPxButton>
                        </div>
                    </div>
                </div>
            </div>            
                </td>
                <td style="vertical-align:top; padding-left:10px">

                 
                    <h1>PEDIDOS A GUARDAR</h1>
           <dx:ASPxGridView ID="gvPedidos" runat="server" AutoGenerateColumns="false" EnableViewState="false">
                        <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true" VerticalScrollableHeight="600" />
              <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager PageSize="30" Visible="false"><PageSizeItemSettings Items="30, 50, 100" Visible="True"></PageSizeItemSettings></SettingsPager>
               <SettingsBehavior AllowSelectSingleRowOnly="true" AllowSelectByRowClick="true"/>
            <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="true" />
            <SettingsSearchPanel Visible="false" />  
                        <Columns>
              <dx:GridViewDataTextColumn  VisibleIndex="0" Width="3%">
                            <DataItemTemplate>
                            <dx:ASPxButton ID="btn" runat="server" Text="Quitar" Width="100%" Paddings-Padding="0px" AutoPostBack="False" OnClick="btn_Click" Theme="SoftOrange"></dx:ASPxButton>
                            </DataItemTemplate>
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                         <DataItemTemplate>
                         <%#Eval("ProxyID")%>
                         </DataItemTemplate>
              </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Producto ID" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("ProductoID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Producto" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("Producto")%>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Volumen" ReadOnly="True" VisibleIndex="4">
                        <DataItemTemplate>
                        <%#Eval("Volumen")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
              <dx:GridViewDataTextColumn FieldName="Estación ID" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("EstacionID")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estación" ReadOnly="True" VisibleIndex="6">
                        <DataItemTemplate>
                        <%#Eval("Estacion")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fecha Programada de envio" ReadOnly="True" VisibleIndex="7">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
                        </DataItemTemplate>
                </dx:GridViewDataTextColumn> 
        </Columns>
                    </dx:ASPxGridView>
                    <%--<dx:BootstrapGridView ID="gvPedidos" runat="server" EnableViewState="false" AutoGenerateColumns="false" KeyFieldName="PedidoID">
                <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"  />        
                <Columns>
                    <dx:BootstrapGridViewTextColumn  VisibleIndex="0" Width="3%">
                                <DataItemTemplate>
                                    <dx:ASPxButton ID="btn" runat="server" Text="..." Width="100%" Paddings-Padding="0px" AutoPostBack="False" OnClick="btn_Click" Theme="SoftOrange"></dx:ASPxButton>
                                </DataItemTemplate>
                            </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("ProxyID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Producto ID" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("ProductoID")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
                      <dx:BootstrapGridViewTextColumn FieldName="Producto" ReadOnly="True" VisibleIndex="1">
                                        <DataItemTemplate>
                                            <%#Eval("Producto")%>
                                        </DataItemTemplate>
                    </dx:BootstrapGridViewTextColumn>
              <dx:BootstrapGridViewTextColumn FieldName="Volumen" ReadOnly="True" VisibleIndex="2">
                        <DataItemTemplate>
                        <%#Eval("Volumen")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
              <dx:BootstrapGridViewTextColumn FieldName="Estación ID" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("EstacionID")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
                    <dx:BootstrapGridViewTextColumn FieldName="Estación" ReadOnly="True" VisibleIndex="3">
                        <DataItemTemplate>
                        <%#Eval("Estacion")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
            <dx:BootstrapGridViewTextColumn FieldName="Fecha Programada de envio" ReadOnly="True" VisibleIndex="5">
                        <DataItemTemplate>
                        <%#Eval("Fecha")%>
                        </DataItemTemplate>
                </dx:BootstrapGridViewTextColumn>
                </Columns>
           <Settings ShowFilterRow="FALSE" ShowFilterRowMenu="FALSE" ShowGroupPanel="FALSE" ShowFooter="true" />
           </dx:BootstrapGridView>--%>
                    <div class="form-group" style="padding-top:10px">
                        <div class="col-sm-12 text-center">
                            <dx:ASPxButton ID="btnGuardarPedido" CssClass="btn btn-success btn-lg" OnClick="btnGuardarPedido_Click" runat="server" Text="Guardar Pedidos" AutoPostBack="false" ></dx:ASPxButton>
                            <dx:ASPxButton ID="ASPxButton2" CssClass="btn btn-danger btn-lg" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" AutoPostBack="false"></dx:ASPxButton>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
       
        </div> <!-- / panel preview -->
    <!-- Modal DetallePedido -->
<div class="modal fade" id="myModalPedidoDetalle">
                <div class="modal-dialog" style="left:0%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">
                                Información</h4>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblContenido" runat="server" Text="Agregue Productos al pedido" />
                                    </td>
                                </tr>
                                
                            </table>
                            
                        </div>
                        <div class="modal-footer">
                            
                            <dx:ASPxButton ID="BtnAceptar" Theme="iOS" OnClick="BtnAceptar_Click" runat="server" Text="Aceptar" AutoPostBack="false"></dx:ASPxButton>
                            
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->

</asp:Content>
