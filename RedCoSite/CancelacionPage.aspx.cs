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
using System.Windows.Forms;

namespace RedCoSite
{
    public partial class CancelacionPage : System.Web.UI.Page
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", DataModule.Seguridad.UserID);
            spCatPedidoDS ds = new spCatPedidoDS();
            DataModule.FillDataSet(ds, "spCatPedido", Params.ToArray());
            DataTable dt = new DataTable();
            dt = ds.Tables[0];

            gvPedidos.DataSource = dt.Select("StatusID=" + 1 + " or StatusID =" + 3);
            gvPedidos.DataBind();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                int dia, mes, ano;
                dia = DateTime.Parse(gvPedidos.GetRowValues(gvPedidos.FocusedRowIndex, "Fecha").ToString()).Day;
                mes = DateTime.Parse(gvPedidos.GetRowValues(gvPedidos.FocusedRowIndex, "Fecha").ToString()).Month;
                ano = DateTime.Parse(gvPedidos.GetRowValues(gvPedidos.FocusedRowIndex, "Fecha").ToString()).Year;
                if (ano == DateTime.Today.Year && mes == DateTime.Today.Month)
                {
                    if (dia == System.DateTime.Today.AddDays(1).Day)
                    {
                        if(System.DateTime.Now.Hour < 19)//7 de la tarde
                        {
                            DataModule.DataService.CancelarPedido(gvPedidos.GetRowValues(gvPedidos.FocusedRowIndex, "PedidoID").ToString());
                            Response.Redirect("MenuPedido.aspx",false);
                        }
                        else
                        {
                            throw new Exception("Cancelación fuera de Horario, por favor comuniquese con su proveedor");
                        }
                        
                    }
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message,"Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }
    }
}