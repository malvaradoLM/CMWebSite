using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;
using RedCoSite.Data;
using RedCoSite.DataSets;
using RemObjects.DataAbstract.Server;
using RPSuiteServer;


namespace RedCoSite
{
    public partial class PrincipalPage : System.Web.UI.Page
    {
        int pedidosnuevos = 0;
        int pedidosmodificado = 0;
        int pedidosEntregados = 0;
        int peidosCancelados = 0;
        int totalpedidos = 0;

        spCatPedidoDS ds = new spCatPedidoDS();
        spCatSaldoDS saldo = new spCatSaldoDS();
        private List<DataParameter> Params = new List<DataParameter>();
        private class Documento
            {
                public string Date { get; set; }
                public string Producto { get; set; }
                public string Text { get; set; }
                public string envio { get; set; }
                public System.Drawing.Image Imagen { get; set; }
        }

        List<Documento> documento = new List<Documento>();
        protected void Page_Load(object sender, EventArgs e)
        {

          if( DataModule.Seguridad != null && DataModule.Seguridad.UserID !=null)
            {
                getPedido(DataModule.Seguridad.UserID);
                getSaldo(DataModule.Seguridad.Attributes[0].ToString());
                getInfoTable();
                
            }
        }
       

        private void irnuevapagina()
        {
            Session["Parametro"] = new object[] { "ClienteID", "VehiculoID" };
            Response.Redirect("SaldoPage.aspx");
        }
        private void getInfoTable()
        {
            try
            {
                DataTable dt = ds.Tables["spCatPedido"];
                IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
                foreach (DataRow dr in query)
                {
                    fillDocumentxml(dr.Field<DateTime>("Fecha").ToString("M/d/yyyy"), "Pedido: " + dr.Field<int>("PedidoID").ToString() + ", Producto: " + dr.Field<string>("ProductoNombre") + " Estatus Pedido: " + dr.Field<string>("statusnombre"), dr.Field<string>("ProductoNombre"), dr.Field<string>("statusnombre"));
                    GetStatusPedido(dr.Field<int>("StatusID"));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void GetStatusPedido(int StatusID)
        {
            
            switch(StatusID)
            { 
                case 1:
                    pedidosnuevos = pedidosnuevos + 1;
                break;
                case 6:
                    pedidosmodificado = pedidosmodificado + 1;
                break;
                case 7:
                    pedidosmodificado = pedidosmodificado + 1;
                    break;
                case 8:
                    pedidosEntregados = pedidosEntregados + 1;
                    break;
                case 9:
                    peidosCancelados= peidosCancelados + 1;
                    break;
            }
            totalpedidos = totalpedidos + 1;
            lblTotalPedidos.Text = totalpedidos.ToString();
            lblPedidoNuevo.Text = pedidosnuevos.ToString();
            lblPedidoActual.Text = pedidosmodificado.ToString();
            lblPedidoCompletado.Text = pedidosEntregados.ToString();
            lblPedidosCancelados.Text = peidosCancelados.ToString();
        }
        private void fillDocumentxml(string fecha, string comentario, string Producto, string Envio)
        {
            documento.Add(new Documento { Date = fecha, Text = comentario, Producto = Producto, envio= Envio });
        }
        private void getPedido(string UsuarioID)
        {
            try
            {
                Params.Clear();
                Data.DataModule.ParamByName(Params, "Datos", UsuarioID);
                DataModule.FillDataSet(ds, "spCatPedido", Params.ToArray());
                DataTable dt = new DataTable();
                dt = ds.Tables["spCatPedido"];
                dt.Columns.Add(new DataColumn("Imagen", typeof(byte[])));
                dt.Columns.Add(new DataColumn("ImagenEstatus", typeof(byte[])));

                IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
                ImageConverter _imageConverter = new ImageConverter();
                byte[] xByte;
                System.Drawing.Image img;


                foreach (DataRow dr in query)
                {
                    switch (dr.Field<int>("StatusID"))
                    {
                        case 1://Nuevo
                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\deliveryGrid.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["Imagen"] = xByte;

                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\add.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["ImagenEstatus"] = xByte;

                            break;
                        case 3://Modificado
                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\deliveryGrid-location.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["Imagen"] = xByte;

                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\red.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["ImagenEstatus"] = xByte;

                            break;
                        case 5://Modificado
                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\deliveryGrid-location.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            //dr.Field<byte[]>("Imagen").SetValue(xByte, 0);
                            dr["Imagen"] = xByte;

                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\red.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["ImagenEstatus"] = xByte;
                            break;
                        case 6://Entregado
                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\deliveryGrid-ok.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            //dr.Field<byte[]>("Imagen").SetValue(xByte, 0);
                            dr["Imagen"] = xByte;

                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\ok.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["ImagenEstatus"] = xByte;
                            break;
                        case 9://Cancelado
                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\deliveryGrid-cancel.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            //dr.Field<byte[]>("Imagen").SetValue(xByte, 0);
                            dr["Imagen"] = xByte;

                            img = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\cancel.png");
                            xByte = (byte[])_imageConverter.ConvertTo(img, typeof(byte[]));
                            dr["ImagenEstatus"] = xByte;
                            break;
                    }
                    //dt.Rows.Add(dr.ItemArray);
                }

                grid.DataSource = dt;
                grid.DataBind();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void getSaldo(string EstacionID)
        {
            try
            {
                Params.Clear();
                Data.DataModule.ParamByName(Params, "EstacionID", EstacionID);
                DataModule.FillDataSet(saldo, "spSaldoCliente", Params.ToArray());
                DataTable dt = saldo.Tables["spSaldoCliente"];
                IEnumerable<DataRow> query = from dts in dt.AsEnumerable() select dts;
                foreach (DataRow dr in query)
                {

                    lblCreditoOtorgado.Text = "$ " + dr.Field<double>("LimiteCredito").ToString();
                    lblSaldo.Text = "$ " + dr.Field<double>("Saldo").ToString();
                    lblCreditoUtilizado.Text = "$ " + dr.Field<double>("Disponible").ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        protected void ASPxCalendar_DayCellInitialize(object sender, DevExpress.Web.CalendarDayCellInitializeEventArgs e)
        {
            if (GetNoteNodes(e.Date).Count > 0)
            {
                e.IsWeekend = false;
                e.NavigateUrl = string.Format("javascript:ShowNotes('{0}')", GetDateString(e.Date));
            }
            else
            {
                e.IsWeekend = true;
            }
        }

        protected void ASPxCalendar_DayCellPrepared(object sender, DevExpress.Web.CalendarDayCellPreparedEventArgs e)
        {
            if (GetNoteNodes(e.Date).Count > 0)
            {
                e.TextControl.ForeColor = Color.Black;
                e.TextControl.Font.Bold = true;
            }

        }

        string GetDateString(DateTime date)
        {
            return date.ToString("M/d/yyyy", CultureInfo.InvariantCulture);
        }

        string GetNote(string dateString)
        {
            List<string> list = new List<string>();
            List<System.Drawing.Image> listimg = new List<System.Drawing.Image>();
            foreach (Documento node in GetNoteNodes(dateString))
            {
                list.Add(HttpUtility.HtmlEncode(node.Text));
                //listimg.Add(node.Imagen);
            }
            return dateString + "|" + String.Join("<br/><br/>", list.ToArray());
        }
        List<Documento> GetNoteNodes(DateTime date)
        {
            return GetNoteNodes(GetDateString(date));
        }

        //XmlNodeList GetNoteNodes(string dateString)
        List<Documento> GetNoteNodes(string dateString)
        {
            List<Documento> doclist = new List<Documento>();
            foreach(var obj in documento)
            {
              if(obj.Date==dateString)
                {
                    doclist.Add(new Documento { Date = obj.Date, Producto = obj.Producto, Text = obj.Text, Imagen = setImage(obj.envio)});
                }
             }
            return doclist;
            //return this.xml.SelectNodes(string.Format("//Notes/Note[@Date='{0}']", dateString));
        }

        private System.Drawing.Image setImage(string texto)
        {
            System.Drawing.Image imagen = null;
            switch (texto)
            {
                case "Nuevo"://nuevo
                    imagen= System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\add.png");
                    break;
                case "Cancelado"://cancelado
                    imagen = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\cancel.png");
                    break;
                case "En Proceso"://en proceso
                    imagen = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\red.png");
                    break;
                case "Entregado"://entregado
                    imagen = System.Drawing.Image.FromFile(@"C:\Users\RedPacifico\Desktop\RedCoSite\RedCoSite\RedCoSite\Image\ok.png");
                    break;
            }

            return imagen;
        }

        protected void ASPxCallback_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            e.Result = GetNote(e.Parameter);
        }
    }
}