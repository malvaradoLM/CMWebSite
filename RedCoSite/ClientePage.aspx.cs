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
    public partial class ClientePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            TEstacion estacion = new TEstacion();

           fillfield(DataModule.DataService.GetEstacion(DataModule.Seguridad.Attributes[0].ToString()));            
        }
        private void fillfield(TEstacion estacion)
        {
            lblEstacionID.Text = estacion.EstacionID.ToString();
            lblNombre.Text = estacion.Nombre;
            lblRazonSocial.Text = estacion.RazonSocial;
            lblDomicilio.Text = estacion.Calle;
            lblNoInterior.Text = estacion.NoInterior;
            lblNoExterior.Text = estacion.NoExterior;
            lblCiudad.Text = estacion.Ciudad;
            lblMunicipio.Text = estacion.Municipio;
            lblEstado.Text = estacion.Estado;
            lblZona.Text = estacion.NombreZona;
            lblGrupo.Text = estacion.NombreGrupo;
            
        }
    }
}