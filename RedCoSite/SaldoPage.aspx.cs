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
    public partial class SaldoPage : System.Web.UI.Page
    {
        spCatSaldoDS saldo = new spCatSaldoDS();
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //  lblContenido.Text = Session["Parametro"].ToString();
            getSaldo(DataModule.Seguridad.Attributes[0].ToString());
        }


        protected void btnedit_Click(object sender, EventArgs e)
        {
           string saldo= bgvSaldo.GetRowValues(int.Parse(bgvSaldo.FocusedRowIndex.ToString()), "Saldo").ToString();
        }
        private void getSaldo(string EstacionID)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", EstacionID);
            DataModule.FillDataSet(saldo, "spCatSaldo", Params.ToArray());
            
            bgvSaldo.DataSource = saldo;
            bgvSaldo.DataBind();
        }
    }
}