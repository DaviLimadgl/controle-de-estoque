using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySqlX.XDevAPI.Relational;
using System.IO;
using Org.BouncyCastle.Asn1.X509;
using System.Security.Cryptography;
using Org.BouncyCastle.Utilities;
using CefSharp.WinForms;
using CefSharp;
using CefSharp.DevTools.Page;


namespace Rotas
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            CefSettings settings = new CefSettings();
            settings.CachePath = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) + @"\CEF";
            Cef.Initialize(settings);
            InitializeComponent();
            //lblnormal.Visible = false;
            LblTitulo.Text = "ROTAS";
            // lblsubtitulo.Text = "Rotas cadastradas";

            
           

        }
        //CurrencyManager cm;
        private int uptime = 300;
        
        private void lblfechar_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        

//Event listener


        private void lblnminimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void LblTitulo_SizeChanged(object sender, EventArgs e)
        {
            LblTitulo.Left = (this.ClientSize.Width - LblTitulo.Size.Width) / 2;
        }

        private void LblTitulo_TextChanged(object sender, EventArgs e)
        {
            LblTitulo.Left = (this.ClientSize.Width - LblTitulo.Size.Width) / 2;
        }

        private void panel1_SizeChanged(object sender, EventArgs e)
        {
            LblTitulo.Left = (this.ClientSize.Width - LblTitulo.Size.Width) / 2;
            //lblsubtitulo.Left = (this.ClientSize.Width - lblsubtitulo.Size.Width) / 2;
        }
        string data_source = "datasource=www.db4free.net;port=3306;User=jairrodrigo;password=Jr971033;database=suporte_nl";
        public void conectarRotasSemanais()
        {
            try
            {
                MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);

                DataTable table = new DataTable();
                DataTable table1 = new DataTable();
                DataTable table2 = new DataTable();
                cnn.Open();
                MySqlCommand csmd = new MySqlCommand();
                MySqlCommand csmd1 = new MySqlCommand();
                MySqlCommand csmd2 = new MySqlCommand();

                csmd = cnn.CreateCommand();
                csmd1 = cnn.CreateCommand();
                csmd2 = cnn.CreateCommand();
                this.dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;

                //dtagrid rota principal
                cnn.CreateCommand();

                csmd.CommandText = "select* from suporte_nl.vw_rotas_mes_atual";
                csmd1.CommandText = "select * from suporte_nl.vw_plantoes_semanal;";
                csmd2.CommandText = "select * from suporte_nl.vw_hoffice_semanal;";
                MySqlDataReader sdr = csmd.ExecuteReader();
                table.Load(sdr);
                MySqlDataReader sdr1 = csmd1.ExecuteReader();
                table1.Load(sdr1);
                MySqlDataReader sdr2 = csmd2.ExecuteReader();
                table2.Load(sdr2);
                cnn.Close();
                dataGridView1.DataSource = table;
                dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
                dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
                dataGridView3.DataSource = table1;
                dataGridView4.DataSource = table2;
                dataGridView1.AlternatingRowsDefaultCellStyle.BackColor = Color.LightGreen;
                dataGridView1.Columns[1].HeaderText = "Técnico Responsável";
                dataGridView3.Columns[5].HeaderCell.Value = "Sabado-Plantonista";
                


                ptfg(); // destacar Plantoes e folgas 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            conectarRotasSemanais();
            timer.Start();
            try
            {
                Concectfiltro();
                if(chrome == null)
                {
                    chrome.Text = "Carregando...";
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            
            string userp = Environment.UserName.ToString();
            lblUser.Text = userp;
            if (userp.Contains("Jair"))
            {
                pbxUser.Image = Properties.Resources.jairferraz;
            }
            else if (userp.Contains("Davi"))
            {
                pbxUser.Image = Properties.Resources.davi;
            }

            else if (userp.Contains("Fabio"))
            {
                pbxUser.Image = Properties.Resources.fabio;
            }

            else if (userp.Contains("Angelo"))
            {
                pbxUser.Image = Properties.Resources.angelo;
            }
            else
            {
                pbxUser.Image = Properties.Resources._403017_avatar_default_head_person_unknown_icon;
            }
            //combobox tec filtros
           
           
        }       
    

        private void lblsubtitulo_TextChanged(object sender, EventArgs e)
        {
            //lblsubtitulo.Left = (this.ClientSize.Width - lblsubtitulo.Size.Width) / 2;
        }

        private void btnAddUser_MouseHover(object sender, EventArgs e)
        {
            toolTip1.Show("Adcionar Usuario", btnAddUser, 1000);
        }

        private void btnrotas_MouseHover(object sender, EventArgs e)
        {
            toolTip1.Show("Adcionar Rotas", btnrotas, 1000);
        }

        private void btnRemUser_MouseHover(object sender, EventArgs e)
        {
            toolTip1.Show("Remover Usuario", btnRemUser, 1000);
        }

        private void label1_Click(object sender, EventArgs e)
        {
            conectarRotasSemanais();
            uptime = 300;
        }

        private void dataGridView1_DefaultCellStyleChanged(object sender, EventArgs e)
        {
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            //dataGridView1.Dock = DockStyle.Fill;
        }

        private void panel2_LocationChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellStateChanged(object sender, DataGridViewCellStateChangedEventArgs e)
        {
            //foreach (DataGridViewRow row in dataGridView1.Rows)
            //{
            //    if (row.Cells[6].Value.ToString() != "")
            //    {
            //        row.DefaultCellStyle.BackColor = Color.LightYellow;

            //    }
            //}
        }

       


        private void btnrotas_Click(object sender, EventArgs e)
        {
            Form2 cdrotas = new Form2();
            cdrotas.ShowDialog();
        }

       

        private void tabControlPrincipal_Selected(object sender, TabControlEventArgs e)
        {
            dataGridView1.ClearSelection();
            dataGridView1.CurrentCell = null;
            dataGridView3.ClearSelection();
            dataGridView3.CurrentCell = null;
            dataGridView4.ClearSelection();
            dataGridView4.CurrentCell = null;
        }
        void ptfg()
        {
            dataGridView3.AlternatingRowsDefaultCellStyle.BackColor = Color.LightGreen;
            dataGridView4.AlternatingRowsDefaultCellStyle.BackColor = Color.LightGreen;
            dataGridView1.ClearSelection();
            dataGridView1.CurrentCell = null;
            dataGridView3.ClearSelection();
            dataGridView3.CurrentCell = null;
            dataGridView4.ClearSelection();
            dataGridView4.CurrentCell = null;
            foreach (DataGridViewRow row in dataGridView3.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    if (row.Cells[i].Value.ToString() != "")
                    {
                        row.Cells[i].Style.ForeColor = Color.Red;
                        
                        row.Cells[i].Style.BackColor = Color.Yellow;
                    }
                }

            }
            foreach (DataGridViewRow row in dataGridView4.Rows)
            {
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    if (row.Cells[i].Value.ToString() == "Folga")
                    {
                        row.Cells[i].Style.BackColor = Color.CornflowerBlue;

                        row.Cells[i].Style.Alignment = DataGridViewContentAlignment.TopCenter;

                        row.Cells[i].Style.ForeColor = Color.White;
                        
                    }

                    if (row.Cells[i].Value.ToString() == DateTime.Now.ToString())
                    {
                        row.Cells[i].Style.ForeColor = Color.Red;
                    }
                }

            }
        }
        private void tabControlPrincipal_Click(object sender, EventArgs e)
        {
            ptfg();
        }
        
        
        private int seg;
        private int min;
        private int minu = 4;
        private int segun  = 59;
        private int prog = 0;
        
        private void timer1_Tick(object sender, EventArgs e)
        {
            
            circularProgressBar1.Minimum = 0;
            circularProgressBar1.Value = 0;

            
            circularProgressBar1.Maximum = 300;

            seg = segun--;
            min = minu;
            
            
            circularProgressBar1.SubscriptText = seg.ToString(); 
              circularProgressBar1.Text = min.ToString();
            circularProgressBar1.Value = prog++;
            if(seg == 0)
            {
                minu --;
                segun = 59;
            }
            if(prog == 300)
            {
                segun = 59;
                minu = 4;
                nop();               
            }
            
        }
       
        void nop()
        {
            timer.Stop();
            

            circularProgressBar1.Value = 0;
            conectarRotasSemanais();
            prog = 0;
            
            timer.Start();
            
        }
        private void dataGridView1_Validated(object sender, EventArgs e)
        {
            dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.DisplayedCellsExceptHeaders;
           dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void dataGridView1_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            this.dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            dataGridView1.Columns[1].DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            dataGridView1.ClearSelection();
            
        }

        private void lbltecfiltros_SizeChanged(object sender, EventArgs e)
        {
           /// lbltecfiltros.Left = (this.cbxtecfiltros.ClientSize.Width - lbltecfiltros.Size.Width) / 2;
        }

        private void cbxtecfiltros_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void PnFiltros_Paint(object sender, PaintEventArgs e)
        {
        }

        private ChromiumWebBrowser chrome;
        

        public void Concectfiltro()
        {

            chrome = new ChromiumWebBrowser("http://10.11.1.53:3000/public/dashboard/cb44f4a8-56c7-4d14-a7e5-3059a02ba311");
            this.panel3.Controls.Add(chrome);
            chrome.Dock = DockStyle.Fill;
            
            
            
        }

       

        private void datainifiltros_Validated(object sender, EventArgs e)
        {
            
        }

        private void btnPreFiltros_Click(object sender, EventArgs e)
        {
            
            Concectfiltro();
        }

        private void label1_Click_1(object sender, EventArgs e)
        {
            string ver = Properties.Settings.Default.Versão.ToString();
            toolTip1.Show(ver, label1, 15000);
        }

        private void circularProgressBar1_Click(object sender, EventArgs e)
        {
            conectarRotasSemanais();
        }

        private void label1_DoubleClick(object sender, EventArgs e)
        {

        }
    }
}
