using RedCoSite.Data;
using RPSuiteServer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RedCoSite
{
    public partial class ContactoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
          FillFieldsVendedor(DataModule.DataService.GetVendedor(DataModule.Seguridad.Attributes[0].ToString()));

            
        }

        private void FillFieldsVendedor(TVendedor vendedor)
        {
            lblEstacionID.Text = vendedor.VendedorID.ToString();
            lblNombre.Text = vendedor.Nombre;
            lblTelefono.Text = vendedor.Telefono;
            lblEmail.Text = vendedor.Email;
        }
    }
}