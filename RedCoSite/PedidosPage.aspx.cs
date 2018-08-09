using RedCoSite.Data;
using RedCoSite.DataSets;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RPSuiteServer.Classes;
using System.Web.Services;
using RPSuiteServer;

namespace RedCoSite
{
    public partial class PedidosPage : System.Web.UI.Page
    {
        //Declaracion de SP
        spCatProductoDS catProductos = new spCatProductoDS();
        spCatTADDS catTAD = new spCatTADDS();
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsCallback)
            {
                getPedido(DataModule.Seguridad.UserID);
                
            }
            
            //Firma de eventos para controles
            //cmbProducto.SelectedIndexChanged += CmbProducto_SelectedIndexChanged;
            getProductos();
           
        }

        

        private void getPedido(string UsuarioID)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", UsuarioID);
            spCatPedidoDS ds = new spCatPedidoDS();
            DataModule.FillDataSet(ds, "spCatPedido", Params.ToArray());

            gvPedido.DataSource = ds;
            gvPedido.DataBind();
           
        }
        [WebMethod]
        private void getDetallePedido(string pedidoid)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Pedido", pedidoid);
          spCatDetallePedidoDS ds = new spCatDetallePedidoDS();
          DataModule.FillDataSet(ds, "spCatDetallePedido", Params.ToArray());

          GridDetallePedido.DataSource = ds;
          GridDetallePedido.DataBind();

        }

        #region llenadoCombos
        private void getProductos()
        {
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();

            listacombo = combo.FillListCombo(fillComboDataset(catProductos, "spCatProducto"), "ProductoID", "Descripcion");
            cmbProducto.DataSource = listacombo;
            cmbProducto.ValueField = "ID";
            cmbProducto.TextField = "Nombre";
            cmbProducto.DataBind();
        }
        
        private DataTable fillComboDataset(DataSet ds, string dstring)
        {
            DataTable dt = new DataTable();
            DataModule.FillDataSet(ds, dstring, null);
            dt = ds.Tables[dstring];
            return dt;
        }
        #endregion
        #region Eventos
        //guardado de Datos para Pedido
        protected void btnAceptarDetalle_ServerClick(object sender, EventArgs e)
        {
            try
            {
                TPedido pedido = new TPedido();
                pedido.Fecha = dtFechaCreacion.Date;
                pedido.FechaModificacion = DateTime.Today;
                pedido.UsuarioID = int.Parse(DataModule.Seguridad.UserID);
                pedido.EstacionID = 1738;
                pedido.ConfiguracionID = 1;
                pedido.Serie = System.Configuration.ConfigurationManager.AppSettings["Serie"];
                pedido.Ejercicio = DateTime.Today.Year;
                pedido.Periodo = DateTime.Today.Month;
                pedido.Dia = DateTime.Today.Day;
                pedido.Folio = 0;

                if (DataModule.DataService.GuardaPedido(pedido) != -1)
                {
                    Response.Write("<script>alert('Registro Insertado Exitosamente');</script>");
                }
                else
                {
                    throw new Exception("hubo un detalle, por favor contacte al administrador del sitio");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //guardado de Datos para Detalle Pedido
        protected void btnGuardarDetalle_Click(object sender, EventArgs e)
        {
            try
            {
                TDetallePedido detalle = new TDetallePedido();
                detalle.PedidoID = int.Parse(gvPedido.GetRowValues(int.Parse(gvPedido.FocusedRowIndex.ToString()), "PedidoID").ToString());
                detalle.ProductoID = int.Parse(cmbProducto.SelectedItem.Value.ToString());
                detalle.VehiculoID = 1;
                detalle.TerminalID = 1;

                if (DataModule.DataService.GuardaDetallePedido(detalle) != -1)
                {
                    Response.Write("<script>alert('Registro Insertado Exitosamente');</script>");
                }
                else
                {
                    throw new Exception("hubo un detalle, por favor contacte al administrador del sitio");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        #endregion

        protected void gvPedido_FocusedRowChanged(object sender, EventArgs e)
        {

        }

        protected void gvPedido_SelectionChanged(object sender, EventArgs e)
        {
            getDetallePedido(gvPedido.GetRowValues(int.Parse(gvPedido.FocusedRowIndex.ToString()), "PedidoID").ToString());
        }
    }
}