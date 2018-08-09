using RedCoSite.Data;
using RedCoSite.DataSets;
using RemObjects.DataAbstract.Server;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RedCoSite
{
    public partial class ConsultaPedidoPage : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            getPedido(DataModule.Seguridad.UserID);
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
    }
}