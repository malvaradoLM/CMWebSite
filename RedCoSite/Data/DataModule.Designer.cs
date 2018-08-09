namespace RedCoSite.Data
{
    partial class DataModule
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DataModule));
            this.ROMessage = new RemObjects.SDK.BinMessage();
            this.remoteService = new RemObjects.SDK.RemoteService(this.components);
            this.ROChannel = new RemObjects.SDK.IpHttpClientChannel();
            this.dataStreamer = new RemObjects.DataAbstract.Bin2DataStreamer(this.components);
            this.remoteDataAdapter = new RemObjects.DataAbstract.RemoteDataAdapter(this.components);
            this.ImageCollection48 = new DevExpress.Utils.SvgImageCollection(this.components);
            this.ImageCollection16 = new DevExpress.Utils.SvgImageCollection(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.remoteDataAdapter)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImageCollection48)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImageCollection16)).BeginInit();
            // 
            // ROMessage
            // 
            this.ROMessage.ContentType = "application/octet-stream";
            this.ROMessage.MaxDecompressedMessageSize = 95242880;
            this.ROMessage.MaxMessageSize = 95242880;
            this.ROMessage.SerializerInstance = null;
            // 
            // remoteService
            // 
            this.remoteService.Channel = this.ROChannel;
            this.remoteService.CloneMessage = true;
            this.remoteService.Message = this.ROMessage;
            this.remoteService.ServiceName = "RPDataService";
            // 
            // ROChannel
            // 
            this.ROChannel.Password = "";
            this.ROChannel.SslOptions.Certificate = null;
            this.ROChannel.SslOptions.TargetHostName = null;
            this.ROChannel.TargetUrl = "http://localhost:9200/bin";
            this.ROChannel.UserName = "";
            // 
            // dataStreamer
            // 
            this.dataStreamer.SendReducedDelta = true;
            // 
            // remoteDataAdapter
            // 
            this.remoteDataAdapter.DataRequestCall.MethodName = "GetData";
            this.remoteDataAdapter.DataRequestCall.Parameters.Clear();
            this.remoteDataAdapter.DataRequestCall.Parameters.Add("aTableNameArray", "StringArray", RemObjects.SDK.ParameterDirection.In);
            this.remoteDataAdapter.DataRequestCall.Parameters.Add("aTableRequestInfoArray", "TableRequestInfoArray", RemObjects.SDK.ParameterDirection.In);
            this.remoteDataAdapter.DataRequestCall.Parameters.Add("Result", "Binary", RemObjects.SDK.ParameterDirection.Result);
            this.remoteDataAdapter.DataRequestCall.OutgoingTableNamesParameter = "aTableNameArray";
            this.remoteDataAdapter.DataRequestCall.IncomingDataParameter = "Result";
            this.remoteDataAdapter.DataStreamer = this.dataStreamer;
            this.remoteDataAdapter.DataUpdateCall.MethodName = "UpdateData";
            this.remoteDataAdapter.DataUpdateCall.Parameters.Clear();
            this.remoteDataAdapter.DataUpdateCall.Parameters.Add("aDelta", "Binary", RemObjects.SDK.ParameterDirection.In);
            this.remoteDataAdapter.DataUpdateCall.Parameters.Add("Result", "Binary", RemObjects.SDK.ParameterDirection.Result);
            this.remoteDataAdapter.DataUpdateCall.OutgoingDeltaParameter = "aDelta";
            this.remoteDataAdapter.DataUpdateCall.IncomingDeltaParameter = "Result";
            this.remoteDataAdapter.LoginString = null;
            this.remoteDataAdapter.Password = null;
            this.remoteDataAdapter.RemoteService = this.remoteService;
            this.remoteDataAdapter.SchemaCall.MethodName = "GetSchema";
            this.remoteDataAdapter.SchemaCall.Parameters.Clear();
            this.remoteDataAdapter.SchemaCall.Parameters.Add("aFilter", "String", RemObjects.SDK.ParameterDirection.In);
            this.remoteDataAdapter.SchemaCall.Parameters.Add("Result", "String", RemObjects.SDK.ParameterDirection.Result);
            this.remoteDataAdapter.SchemaCall.IncomingSchemaParameter = "Result";
            this.remoteDataAdapter.ScriptProvider = null;
            this.remoteDataAdapter.TargetUrl = null;
            this.remoteDataAdapter.UserName = null;
            // 
            // ImageCollection48
            // 
            this.ImageCollection48.ImageSize = new System.Drawing.Size(48, 48);
            this.ImageCollection48.Add("0", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.0"))));
            this.ImageCollection48.Add("1", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.1"))));
            this.ImageCollection48.Add("2", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.2"))));
            this.ImageCollection48.Add("3", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.3"))));
            this.ImageCollection48.Add("4", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.4"))));
            this.ImageCollection48.Add("5", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.5"))));
            this.ImageCollection48.Add("6", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.6"))));
            this.ImageCollection48.Add("7", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.7"))));
            this.ImageCollection48.Add("8", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection48.8"))));
            // 
            // ImageCollection16
            // 
            this.ImageCollection16.Add("0", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.0"))));
            this.ImageCollection16.Add("1", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.1"))));
            this.ImageCollection16.Add("2", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.2"))));
            this.ImageCollection16.Add("3", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.3"))));
            this.ImageCollection16.Add("4", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.4"))));
            this.ImageCollection16.Add("5", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.5"))));
            this.ImageCollection16.Add("6", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.6"))));
            this.ImageCollection16.Add("7", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.7"))));
            this.ImageCollection16.Add("8", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.8"))));
            this.ImageCollection16.Add("9", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.9"))));
            this.ImageCollection16.Add("10", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.10"))));
            this.ImageCollection16.Add("11", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.11"))));
            this.ImageCollection16.Add("12", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.12"))));
            this.ImageCollection16.Add("13", ((DevExpress.Utils.Svg.SvgImage)(resources.GetObject("ImageCollection16.13"))));
            ((System.ComponentModel.ISupportInitialize)(this.remoteDataAdapter)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImageCollection48)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ImageCollection16)).EndInit();

        }

        #endregion
        private RemObjects.SDK.BinMessage ROMessage;
        private RemObjects.SDK.RemoteService remoteService;
        private RemObjects.DataAbstract.Bin2DataStreamer dataStreamer;
        private RemObjects.DataAbstract.RemoteDataAdapter remoteDataAdapter;
        private RemObjects.SDK.IpHttpClientChannel ROChannel;
        private DevExpress.Utils.SvgImageCollection ImageCollection48;
        private DevExpress.Utils.SvgImageCollection ImageCollection16;
    }
}
