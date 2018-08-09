using RedCoSite.Data;
using RedCoSite.DataSets;
using RemObjects.DataAbstract.Server;
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
    public partial class SiteMaster : MasterPage
    {
        private List<DataParameter> Params = new List<DataParameter>();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "openNav();", true);
            lblUsuario.Text = "Usuario: " + DataModule.Seguridad.SessionID.ToString();
           if(!IsPostBack)
            {
                fillComboEstacion();
            }
        }
        private void fillComboEstacion()
        {
            
            
            spCatRelacionUsuarioEstacionDS catProductos = new spCatRelacionUsuarioEstacionDS();
            List<utileriasComun.FillCombos> listacombo = new List<utileriasComun.FillCombos>();
            utileriasComun.FillCombos combo = new utileriasComun.FillCombos();
            listacombo = combo.FillListCombo(fillComboDataset(catProductos, "spCatRelacionUsuarioEstacion"), "EstacionID", "Nombre");
            cmbEstacionesUsuario.DataSource = listacombo;
            cmbEstacionesUsuario.ValueField = "ID";
            cmbEstacionesUsuario.TextField = "Nombre";
            cmbEstacionesUsuario.DataBind();
            cmbEstacionesUsuario.SelectedIndex = 0;
            if (Session["EstacionIndex"] == null)
            {
            Session["EstacionIndex"] = cmbEstacionesUsuario.SelectedIndex;
            }
            else
            { cmbEstacionesUsuario.SelectedIndex = int.Parse(Session["EstacionIndex"].ToString()); }
        }
        private DataTable fillComboDataset(DataSet ds, string dstring)
        {
            DataTable dt = new DataTable();
            Params.Clear();
            Data.DataModule.ParamByName(Params, "Datos", DataModule.Seguridad.UserID);
            DataModule.FillDataSet(ds, dstring, Params.ToArray());
            dt = ds.Tables[dstring];
            return dt;
        }
        protected void btnLogOut_ServerClick(object sender, EventArgs e)
        {
            DataClass ds = new DataClass();
            ds.LogOut();
            Response.Redirect("LoginPage.aspx", false);
        }
        
        protected void cmbEstacionesUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["EstacionIndex"] = cmbEstacionesUsuario.SelectedIndex;
        }


        //protected void btnMenu_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Menu.aspx", false);
        //}
    }
}