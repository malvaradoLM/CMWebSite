using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using RemObjects.DataAbstract.Server;
using System.Windows.Forms;

namespace RedCoSite.Data
{
    public sealed partial class DataModule : Component
    {
        private RPSuiteServer.IRPLoginService fLoginService;
        private RPSuiteServer.IRPDataService fDataService;
        private RPSuiteServer.IRPDataService_Async fDataServiceAsync;
        private UserInfo _Info;
        private bool _OKEnter;

        private void LinkServices()
        {
            fLoginService = RPSuiteServer.CoRPLoginService.Create(remoteService);
            fDataService = RPSuiteServer.CoRPDataService.Create(remoteService);
            fDataServiceAsync = RPSuiteServer.CoRPDataServiceAsync.Create(remoteService);
        }
        private DataModule()
        {
            InitializeComponent();
            LinkServices();
            _OKEnter = true;
        }

        public DataModule(IContainer container)
        {
            container.Add(this);
            InitializeComponent();
            LinkServices();
        }

        private static readonly Lazy<DataModule> lazy =new Lazy<DataModule>(() => new DataModule());
        public static DataModule Instance { get { return lazy.Value; } }

        public static RPSuiteServer.IRPLoginService LoginService { get { return Instance.fLoginService; } }
        public static RPSuiteServer.IRPDataService DataService { get { return Instance.fDataService; } }
        public static RPSuiteServer.IRPDataService_Async DataServiceAsync { get { return Instance.fDataServiceAsync; } }
        public static RemObjects.DataAbstract.RemoteDataAdapter rda { get { return Instance.remoteDataAdapter; } }
        public static void ParamByName(List<DataParameter> Parametros, string Name, object Value)
        {
            if (Parametros != null)
            {
                DataParameter param = new DataParameter();
                param.Name = Name;
                param.Value = Value;
                Parametros.Add(param);
            }
        }
        public static void FillDataSet(DataSet ds, string TableName, DataParameter[] Parametros)
        {  
            if (ds == null)
            {
                ds = new DataSet();
            }
            if (Parametros != null)
            {
                TableRequestInfo rInfo = new TableRequestInfo();
                rInfo.Parameters = Parametros;
                Instance.remoteDataAdapter.Fill(ds, TableName, rInfo, true);
            } else
            {
                Instance.remoteDataAdapter.Fill(ds, new string[] { TableName }, true);
            }
        }

        public static bool ApplyUpdates(DataSet ds)
        {
            bool _Done = false;
            try
            {
                Instance.remoteDataAdapter.Update(ds);
                _Done = true;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return _Done;
        }

        public static DevExpress.Utils.SvgImageCollection Images48
        {
            get { return Instance.ImageCollection48;  }
        }

        public static DevExpress.Utils.SvgImageCollection Images16
        {
            get { return Instance.ImageCollection16; }
        }

        public static UserInfo Seguridad
        {
            get { return Instance._Info; }
            set { Instance._Info = value; }
        }

        public static bool OKEnter
        {
            get { return Instance._OKEnter; }
            set { Instance._OKEnter = value; }
        }
    }
}
