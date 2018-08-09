using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RPSuiteServer;
using System.Data;
using System.Windows.Forms;
using RPSuiteServer.Classes;
using RedCoSite.Data;

namespace RedCoSite
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
              //  DataModuleUserInfo userinfo = new DataModuleUserInfo();
               RemObjects.DataAbstract.Server.UserInfo userinfo = new RemObjects.DataAbstract.Server.UserInfo();
                if (DataModule.LoginService.Login(inputUsuario.Value, inputPassword.Value, out userinfo))
                {
                    //DataModule.Seguridad.userinfo = userinfo;
                    DataModule.Seguridad = userinfo;
                    Response.Redirect("PrincipalPage.aspx",false);
                }
                else
                {
                    ShowMessage("Nombre de Usuario o Contrasena incorrecta verifique datos");
                    //MessageBox.Show("Nombre de Usuario o Contrasena incorrecta verifique datos","Advertecia", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message.ToString());
                //MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }
        private void ShowMessage(string Mensaje)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowPopup();", true);
            this.lblMessage.Text = Mensaje;
        }
    }
}