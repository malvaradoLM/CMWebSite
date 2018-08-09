<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NuevoPedidoPage.aspx.cs" Inherits="RedCoSite.NuevoPedidoPage" %>
<%@ Register assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
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
    <h1>NUEVO PEDIDO</h1>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
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
                            <dx:ASPxButton ID="btnGuardarPedido" CssClass="btn btn-success btn-lg" OnClick="btnGuardarPedido_Click" runat="server" Text="Guardar" AutoPostBack="false"></dx:ASPxButton>
                              <dx:ASPxButton ID="btnCancelar" CssClass="btn btn-danger btn-lg" OnClick="btnCancelar_Click" runat="server" Text="Cancelar" AutoPostBack="false"></dx:ASPxButton>
                        </div>
                    </div>
                </div>
            </div>            
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
