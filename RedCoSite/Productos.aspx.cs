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

namespace RedCoSite
{
    public partial class Productos : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            getProductos();
            lblfecha.Text = "Los precios de los productos al dia de: " + DateTime.Today.ToString("dd/MM/yyyy");
        }
        private void getProductos()
        {
            try
            {
                //spCatProductoDS prd = new spCatProductoDS();
                //Params.Clear();
                //Data.DataModule.ParamByName(Params, "Datos", "");
                //DataModule.FillDataSet(prd, "spCatProducto", Params.ToArray());
                //DataTable dt = new DataTable();
                //dt = prd.Tables["spCatProducto"];
                RPSuiteServer.TCustomProductoIEPS[] arrayProductoIEPS = DataModule.DataService.CargarProductoIEPS();

                gvPedidos.DataSource = arrayProductoIEPS;/*dt.AsEnumerable().Take(3);*/
                gvPedidos.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }

        }
    }
}