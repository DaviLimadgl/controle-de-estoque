using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Tls;

namespace Rotas.DBConectar
{
    
    internal class ConectaDB
    {
        public MySqlConnection con;

        string data_source = "datasource=10.11.0.252;port=3306;User Id=root;password=;database=suportenl";

        public ConectaDB()
        {
            con = new MySqlConnection(data_source);

        } 
        
        //private string comando;
        public MySqlCommand comando;
        private string cmdins;
        private string cnn;
        private string ip;

        public int VER { get; }
        public int VER_UP { get; }
        public string USER { get; }
        public int STATUS { get; }
        public int FORCED { get; }
        public string banco { get; }

        public ConectaDB(MySqlConnection con, string data_source, MySqlCommand comando, string cmdins, string Banco, string cnn, string ip, int vER, int vER_UP, string uSER, int sTATUS, int fORCED)
        {
            this.banco = Banco;
            this.con = con;
            this.data_source = data_source;
            this.comando = comando;
            this.cmdins = cmdins;
            this.cnn = cnn;
            this.ip = ip;
            VER = vER;
            VER_UP = vER_UP;
            USER = uSER;
            STATUS = sTATUS;
            FORCED = fORCED;
        }

       


    }
    
}
