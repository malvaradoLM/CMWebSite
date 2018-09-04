using DevExpress.Web;
using DevExpress.XtraEditors;
using RedCoSite.Data;
using RedCoSite.DataSets;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;
using RPSuiteServer.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RedCoSite
{
    public partial class NuevoPedidoPage : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        DataTable dt = new DataTable();

        private class tablapedido
        {
            public int ProxyID { get; set; }
            public int ProductoID { get; set; }
            public string Producto { get; set; }
            public int Volumen { get; set; }
            public int EstacionID { get; set; }
            public string Estacion { get; set; }
            public DateTime Fecha { get; set; }
            public bool AutoAbasto { get; set; }
            public int Transportista { get; set; }
            public int Vehiculo { get; set; }

        }

        List<tablapedido> listapedidos = new List<tablapedido>();

        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (!IsPostBack)
            {
                Session["LISTAPEDIDOS"] = new List<tablapedido>();
                //       fillDataGrid();
                getProductos();
                getVolumen();
                getEstacion();
                getEstacionAutoAbasto();

             
            }
        }
        

        private void fillDataGrid()
        {
            gvPedidos.DataSource = (List<tablapedido>)Session["LISTAPEDIDOS"];
            gvPedidos.DataBind();
        }

        private void addRowtoDataGrid()
        {
            List<tablapedido> lp = (List <tablapedido>) Session["LISTAPEDIDOS"];
            tablapedido tp = new tablapedido();
            tp.ProxyID = lp.Count;
            tp.ProductoID = int.Parse(cmbProducto.SelectedItem.Value.ToString());
            tp.Producto = cmbProducto.SelectedItem.Text;
            tp.Volumen = int.Parse(cmbVolumen.SelectedItem.Text);
            tp.AutoAbasto = bool.Parse(ASPxChkAutoAbasto.Value.ToString());
            if(ASPxChkAutoAbasto.Checked)
            {
                tp.Transportista = int.Parse(cmbTransportista.SelectedItem.Value.ToString());
                tp.Vehiculo = int.Parse(cmbVehiculo.SelectedItem.Value.ToString());
            }
            else
            {
                tp.Transportista = 0;
                tp.Vehiculo = 0;

            }
            //ASPxComboBox cmbEstacionID = this.Master.FindControl("cmbEstacionesUsuario") as ASPxComboBox;
            tp.EstacionID = int.Parse(cmbEstacion.SelectedItem.Value.ToString());
            tp.Estacion = cmbEstacion.SelectedItem.Text;
            tp.Fecha= dtFechaCreacion.Date;
            lp.Add(tp);
            gvPedidos.DataSource = lp;
            gvPedidos.DataBind();
        }
        

        protected void btnGuardarPedido_Click(object sender, EventArgs e)
        {
            try
            {
                List<tablapedido> lp = (List<tablapedido>)Session["LISTAPEDIDOS"];
                int PedidoID = 0;

                foreach (tablapedido tp in lp)
                {
                    TPedido pedido = new TPedido();
                    pedido.Fecha = dtFechaCreacion.Date;
                    pedido.FechaModificacion = DateTime.Today;
                    pedido.UsuarioID = int.Parse(DataModule.Seguridad.UserID);
                    pedido.EstacionID = tp.EstacionID;
                    pedido.ConfiguracionID = 1;
                    pedido.Serie = System.Configuration.ConfigurationManager.AppSettings["Serie"];
                    pedido.Ejercisio = DateTime.Today.Year;
                    pedido.Periodo = DateTime.Today.Month;
                    pedido.Dia = DateTime.Today.Day;
                    pedido.Folio = 0;
                    pedido.StatusID = 1;
                    pedido.AutoAbasto = tp.AutoAbasto;
                    pedido.VehiculoID = tp.Vehiculo;
                    PedidoID = DataModule.DataService.GuardaPedido(pedido);
                    if (PedidoID != -1)
                    {
                        GuardarDetallePedido(PedidoID, tp.ProductoID,tp.Volumen,tp.Vehiculo);
                    }
                    else
                    {
                        throw new Exception("hubo un detalle, por favor contacte al administrador del sitio");
                    }
                }
                Response.Redirect("MenuPedido.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GuardarDetallePedido(int PedidoID,int ProductoID, int Volumen, int Vehiculo)
        {
            try
            {
                TDetallePedido detallepedido = new TDetallePedido();
                detallepedido.ProductoID = int.Parse(cmbProducto.SelectedItem.Value.ToString());
                detallepedido.Volumen = int.Parse(cmbVolumen.SelectedItem.Text);
                detallepedido.PedidoID = PedidoID;
                detallepedido.TerminalID = 1;
                detallepedido.VehiculoID = Vehiculo;
                int DetallePedidoID = 0;
                DetallePedidoID = DataModule.DataService.GuardaDetallePedido(detallepedido);

                if (DetallePedidoID != -1)
                {
                    //Response.Redirect("MenuPedido.aspx");
                    //ShowMessage("Se guardo correctamente el pedido");
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

        private void ShowMessage(string mensaje)
        {
            lblContenido.Text = mensaje;
            ClientScript.RegisterStartupScript(GetType(), "hwa", "ShowPopup();", true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuPedido.aspx");
        }

        #region llenadoCombos
        private void getProductos()
        {
            spCatProductoDS catProductos = new spCatProductoDS();
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();

            listacombo = combo.FillListCombo(fillComboDataset(catProductos, "spCatProductos"), "ProductoID", "Descripcion");
            cmbProducto.DataSource = listacombo;
            cmbProducto.ValueField = "ID";
            cmbProducto.TextField = "Nombre";
            cmbProducto.DataBind();
        }
        private void getVolumen()
        {
            spCatVolumenDS catVolumen = new spCatVolumenDS();
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();

            listacombo = combo.FillListCombo(fillComboDataset(catVolumen, "spCatVolumen"), "VolumenID", "Volumen");
            cmbVolumen.DataSource = listacombo;
            cmbVolumen.ValueField = "ID";
            cmbVolumen.TextField = "Nombre";
            cmbVolumen.DataBind();
        }
        private void getEstacion()
        {
            spCatRelacionUsuarioEstacionDS catEstacion = new spCatRelacionUsuarioEstacionDS();
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();

            listacombo = combo.FillListCombo(fillComboDatasetEstaciones(catEstacion, "spCatRelacionUsuarioEstacion"), "EstacionID", "Nombre");
            cmbEstacion.DataSource = listacombo;
            cmbEstacion.ValueField = "ID";
            cmbEstacion.TextField = "Nombre";
            cmbEstacion.DataBind();
            cmbEstacion.SelectedIndex = (int)Session["EstacionIndex"];
        }
        private void getEstacionAutoAbasto()
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", DataModule.Seguridad.Attributes[0].ToString());
            spCatEstacionDS ds = new spCatEstacionDS();
            DataModule.FillDataSet(ds, "spCatEstacion", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables["spCatEstacion"];
            IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
            
            foreach (DataRow dr in query)
            {
                if (dr.Field<bool>("AutoAbasto"))
                {
                    ASPxChkAutoAbasto.Checked = dr.Field<bool>("AutoAbasto");
                    getTransportistaVehiculo(dr.Field<int>("TransportistaID"));
                    mostrarCampos(true);
                }
                else
                {
                    ASPxChkAutoAbasto.Checked = dr.Field<bool>("AutoAbasto");
                    mostrarCampos(false);
                }
            }

        }
        private void mostrarCampos(bool bandera)
        {
            cmbTransportista.Visible = bandera;
            cmbVehiculo.Visible = bandera;
            lbltransportista.Visible = bandera;
            lblvehiculo.Visible = bandera;
        }
        private void getTransportistaVehiculo(int TransportistaID)
        {
            spCatTransportistaDS transportista = new spCatTransportistaDS();
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();

            listacombo = combo.FillListCombo(fillComboDataset(transportista, "spCatTransportista",TransportistaID), "TransportistaID", "Nombre");
            cmbTransportista.DataSource = listacombo;
            cmbTransportista.ValueField = "ID";
            cmbTransportista.TextField = "Nombre";
            cmbTransportista.DataBind();
            cmbTransportista.SelectedIndex = 0;

            TVehiculo[] vehiculo = DataModule.DataService.GetVehiculoTransportista(TransportistaID.ToString());

            
            cmbVehiculo.DataSource = vehiculo.ToList();
            cmbVehiculo.ValueField = "VehiculoID";
            cmbVehiculo.TextField = "NoEconomico";
            cmbVehiculo.DataBind();





        }
        
        private DataTable fillComboDatasetEstaciones(DataSet ds, string dstring)
        {
            DataTable dt = new DataTable();
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", DataModule.Seguridad.UserID);
            DataModule.FillDataSet(ds, dstring, Params.ToArray());
            dt = ds.Tables[dstring];
            return dt;
        }
        private DataTable fillComboDataset(DataSet ds, string dstring,int param)
        {
            DataTable dt = new DataTable();
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", param);
            DataModule.FillDataSet(ds, dstring, Params.ToArray());
            dt = ds.Tables[dstring];
            return dt;
        }
        private DataTable fillComboDataset(DataSet ds, string dstring)
        {
            DataTable dt = new DataTable();

            DataModule.FillDataSet(ds, dstring, null);
            dt = ds.Tables[dstring];
            return dt;
        }
        #endregion
        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuPedido.aspx");
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            List<tablapedido> lp = (List<tablapedido>)Session["LISTAPEDIDOS"];
            var itemtoremove = lp.Single(r => r.ProxyID == int.Parse(gvPedidos.GetRowValues(gvPedidos.FocusedRowIndex, "ProxyID").ToString()));
            lp.Remove(itemtoremove);
            fillDataGrid();
        }

        protected void btnAddPedido_Click(object sender, EventArgs e)
        {
            addRowtoDataGrid();
        }

        protected void ASPxChkAutoAbasto_CheckedChanged(object sender, EventArgs e)
        {
            ASPxCheckBox ch = (sender as ASPxCheckBox);
            mostrarCampos(ch.Checked);
        }
    }
}