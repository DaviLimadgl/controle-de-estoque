using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using MySql.Data;
using MySqlX.XDevAPI;
using ComboBox = System.Windows.Forms.ComboBox;
using Org.BouncyCastle.Crypto.Modes;

namespace Rotas
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
          
            lbltitulo.Left = (this.ClientSize.Width - lbltitulo.Size.Width) / 2;
            btnalterar.Left = (this.panel2.Width - btnalterar.Size.Width) / 2;
            btnCadRotas.Left = (this.panel2.Width - btnCadRotas.Size.Width) / 2;
            this.panel3.Left = (this.panel7.Width - panel3.Size.Width) / 2;
            this.PnSenha.Left = (this.panel7.Width - PnSenha.Size.Width) / 2;
            lblTituloRotas.Left = (this.panel7.Width - lblTituloRotas.Width) / 2;
            //label1.Left = (this.panel9.Width - label1.Width) / 2;
            label3.Left = (this.panel9.Width - label3.Width) / 2;
            this.LblSenha.Left = (this.PnSenha.Width - LblSenha.Size.Width) / 2;
            this.textSenha.Left = (this.PnSenha.Width - textSenha.Size.Width) / 2;
            this.BtnSenha.Left = (this.PnSenha.Width - BtnSenha.Size.Width) / 2;
            lblmensagemrota.Text = "";
            //label2.Left = (this.panel2.Width - label2.Width) / 2;
            //lblmensagemrota.Text = "aswdasqfsdefsdvsd2f1v321df3v21df31v3df21v3d1f3v1df321v3df21v3d21fv321dfv321d3f21v3d21fv321df3v21d3f21v3d2f1v";

            
            //LblTitulo.Left = (this.ClientSize.Width - LblTitulo.Size.Width) / 2;
            //LblTitulo.Left = (this.ClientSize.Width - LblTitulo.Size.Width) / 2;

        }
        string data_source = "datasource=www.db4free.net;port=3306;User=jairrodrigo;password=Jr971033;database=suporte_nl";

        private string id;
        private string banco;
        private string tipovalor;
        
        private void setcadup(string cdup)
        {
          
        }
        
        private void lblfechar_MouseClick(object sender, MouseEventArgs e)
        {
            this.Close();
        }
        List<CheckBox> parts = new List<CheckBox>();

       

        private void datarotas_ValueChanged(object sender, EventArgs e)
        {
            //if(chkrotas.Checked)
            //{
            //    if (datarotas.Value.DayOfWeek.Equals(DayOfWeek.Saturday))
            //    {
            //        toolTip1.Show("Sabado Não está habilitado para rotas, selecione outro dia!", cbxtecrotas, 5000);
            //        datarotas.Value = DateTime.Now;
            //        return;
            //        //
            //    }
            //    if (datarotas.Value.DayOfWeek.Equals(DayOfWeek.Sunday))
            //    {
            //        toolTip1.Show("Domingo Não está habilitado para rotas, selecione outro dia!", cbxtecrotas, 5000);
            //        datarotas.Value = DateTime.Now;
            //        return;
            //        //
            //    } 
            //}
        }
        
        private void btnCadRotas_Click(object sender, EventArgs e)
        {

            if (tipovalor == "rotas")
            {
                if (cbxtecrotas.SelectedItem == null)
                {
                    toolTip1.Show("Selecione algum Tecnico", cbxtecrotas, 1000);
                    return;
                }
                if (cbxlojasrotas.SelectedItem == null)
                {
                    toolTip1.Show("Selecione alguma Loja", cbxlojasrotas, 1000);
                    return;
                }
                //if (Convert.ToDateTime(datarotas.Value).ToShortDateString() == DateTime.Now.ToShortDateString())
                //{
                //    toolTip1.Show("A data de rota não pode ser para o mesmo dia", cbxtecrotas, 1000);
                //    return;
                //}
                else
                {
                    try
                    {
                        MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                        cnn.Open();
                        MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO " + banco + " ( tecnico, loja, data, alteradopor, obs, col_rota) VALUES ( ?, ?, ?, ?, ?, ?)", cnn);

                        cd_lj.Parameters.Add("@tecnico", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                        cd_lj.Parameters.Add("@loja", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                        cd_lj.Parameters.Add("@data", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                        cd_lj.Parameters.Add("@alteradopor", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                        cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = richTextBox1.Text;
                        if (radioRota1.Checked)
                        {
                            cd_lj.Parameters.Add("@rota", MySql.Data.MySqlClient.MySqlDbType.Int32, 20).Value = 1;
                        }
                        else
                        {
                            cd_lj.Parameters.Add("@rota", MySql.Data.MySqlClient.MySqlDbType.Int32, 20).Value = 2;
                        }
                        
                        //cd_lj.Parameters.Add("@dominio", MySql.Data.MySqlClient.MySqlDbType.VarChar, 100).Value = textDominio.Text;





                        cd_lj.ExecuteNonQuery();
                        cnn.Close();
                        lblmensagemrota.ForeColor = Color.Blue;
                        lblmensagemrota.Text = "Rota para -  " + cbxlojasrotas.Text + "   - cadastrada com sucesso!";
                        //nulotext();


                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            if (tipovalor == "plantoes")
            {


                if (cbxtecrotas.SelectedItem == null)
                {
                    toolTip1.Show("Selecione algum Tecnico", cbxtecrotas, 1000);
                    return;
                }
                //if (cbxlojasrotas.SelectedItem == null)
                //{
                //    toolTip1.Show("Selecione alguma Loja", cbxlojasrotas, 1000);
                //    return;
                //}
                //if (Convert.ToDateTime(datarotas.Value).ToShortDateString() == DateTime.Now.ToShortDateString())
                //{
                //    toolTip1.Show("A data de rota não pode ser para o mesmo dia", cbxtecrotas, 1000);
                //    return;
                //}
                else
                {
                    try
                    {
                        MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                        cnn.Open();
                        MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO " + banco + " (tecnico, data) VALUES ( ?, ?)", cnn);

                        cd_lj.Parameters.Add("@tecnico", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                        //cd_lj.Parameters.Add("@loja", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                        cd_lj.Parameters.Add("@data", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                        //cd_lj.Parameters.Add("@alteradopor", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                        //cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = richTextBox1.Text;
                        //cd_lj.Parameters.Add("@dominio", MySql.Data.MySqlClient.MySqlDbType.VarChar, 100).Value = textDominio.Text;





                        cd_lj.ExecuteNonQuery();
                        cnn.Close();
                        lblmensagemrota.ForeColor = Color.Blue;
                        lblmensagemrota.Text = "Plantão para -  " + cbxtecrotas.Text + "   - cadastrada com sucesso!";
                        //nulotext();


                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            if (tipovalor == "home")
            {

                if (cbxtecrotas.SelectedItem == null)
                {
                    toolTip1.Show("Selecione algum Tecnico", cbxtecrotas, 1000);
                    return;
                }
                if (cbxtipoalt.SelectedItem == null)
                {
                    toolTip1.Show("Selecione algum Tipo", cbxtipoalt, 1000);
                    return;
                }
                //if (Convert.ToDateTime(datarotas.Value).ToShortDateString() == DateTime.Now.ToShortDateString())
                //{
                //    toolTip1.Show("A data de rota não pode ser para o mesmo dia", cbxtecrotas, 1000);
                //    return;
                //}
                else
                {
                    try
                    {
                        MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                        cnn.Open();
                        MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO " + banco + " (tecnico, tipo, data, alteradopor) VALUES ( ?, ?, ?, ?)", cnn);

                        cd_lj.Parameters.Add("@tecnico", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                        cd_lj.Parameters.Add("@tipo", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtipoalt.Text;
                        cd_lj.Parameters.Add("@data", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                        cd_lj.Parameters.Add("@alteradopor", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                        //cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = richTextBox1.Text;
                        //cd_lj.Parameters.Add("@dominio", MySql.Data.MySqlClient.MySqlDbType.VarChar, 100).Value = textDominio.Text;





                        cd_lj.ExecuteNonQuery();
                        cnn.Close();
                        lblmensagemrota.ForeColor = Color.Blue;
                        lblmensagemrota.Text = cbxtipoalt.Text + " para -  " + cbxtecrotas.Text + "   - cadastrada com sucesso!";
                        //nulotext();


                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
        }

        private void Form2_Load(object sender, EventArgs e) 
        {
            //label2.Left = (this.ClientSize.Width - label2.Size.Width) / 2;

            try 
            {
                MySqlConnection connection = new MySqlConnection(data_source);

                string selectQuery = "SELECT tecnico FROM tecnico";
                connection.Open();
                MySqlCommand command = new MySqlCommand(selectQuery, connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    cbxtecrotas.Items.Add(reader.GetString("tecnico"));
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {
                MySqlConnection connection = new MySqlConnection(data_source);

                string selectQuery = "SELECT loja FROM tb_ip_dominio";
                connection.Open();
                MySqlCommand command = new MySqlCommand(selectQuery, connection);
                MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {

                    cbxlojasrotas.Items.Add(reader.GetString("loja"));
                    
                    

                }
                cbxlojasrotas.Items.Add("Centro do Rio");
                cbxlojasrotas.Items.Add("Acredit");

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
            
        }

        
        private void btnCadFolgas_Click(object sender, EventArgs e)
        {
           
                try
                {
                    MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                    cnn.Open();
                    MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("INSERT INTO folga_hoffice (tecnico, tipo, data, alteradopor) VALUES ( ?, ?, ?, ?)", cnn);

                    
                    cd_lj.Parameters.Add("@alteradopor", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                    //cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = null;
                    //cd_lj.Parameters.Add("@dominio", MySql.Data.MySqlClient.MySqlDbType.VarChar, 100).Value = textDominio.Text;





                    cd_lj.ExecuteNonQuery();
                    cnn.Close();
                   
                    //nulotext();


                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            
        }
        private string senha;

        private void btnalterar_Click(object sender, EventArgs e)
        {
            if (senha == null)
            {
                textSenha.Text = null;
                PnSenha.Visible = true;
                btnalterar.Enabled = false;
                chkdel.Enabled = false;
            }
            else
            {

                if (!chkhome.Checked && !chkplantao.Checked && !chkrotas.Checked)
                {
                    toolTip1.Show("Por favor, escolha algum tipo", panel9, 5000);
                    return;
                }
                if (chkdel.Checked)
                {
                    MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                    cnn.Open();
                    MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("DELETE FROM " + banco + " WHERE id=@id", cnn);

                    //cd_lj.Parameters.Add("@tecnico", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                    //cd_lj.Parameters.Add("@loja", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                    //cd_lj.Parameters.Add("@data", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                    //cd_lj.Parameters.Add("@alteradopor", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                    //cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = null;
                    //cd_lj.Parameters.Add("@dominio", MySql.Data.MySqlClient.MySqlDbType.VarChar, 100).Value = textDominio.Text;



                    cd_lj.Parameters.Add("@id", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = id.ToString();

                    cd_lj.ExecuteNonQuery();
                    cnn.Close();
                    lblmensagemrota.ForeColor = Color.Blue;
                    lblmensagemrota.Text = "Ação para -  " + cbxtecrotas.Text + "   - deletado com sucesso!";
                }
                else
                {

                    if (chkrotas.Checked)
                    {
                        try
                        {
                            MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                            cnn.Open();
                            MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("UPDATE " + banco + " SET tecnico=@tec, loja=@lj, data=@dt, alteradopor=@al, col_rota=@rt, obs=@obs WHERE id=@id", cnn);

                            cd_lj.Parameters.Add("@tec", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                            cd_lj.Parameters.Add("@lj", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                            cd_lj.Parameters.Add("@dt", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                            cd_lj.Parameters.Add("@al", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                            if (radioRota1.Checked)
                            {
                                cd_lj.Parameters.Add("@rt", MySql.Data.MySqlClient.MySqlDbType.Int32, 20).Value = 1;
                            }
                            else
                            {
                                cd_lj.Parameters.Add("@rt", MySql.Data.MySqlClient.MySqlDbType.Int32, 20).Value = 2;
                            }
                            cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = richTextBox1.Text;
                            cd_lj.Parameters.Add("@id", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = id.ToString();
                            

                            cd_lj.ExecuteNonQuery();
                            cnn.Close();
                            lblmensagemrota.Text = "Alteração para Rota de - " + cbxtecrotas.Text + " - realizado com sucesso!";
                            //nulotext();


                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message);
                        }
                    }
                    else if (chkplantao.Checked)
                    {
                        try
                        {
                            MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                            cnn.Open();
                            MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("UPDATE " + banco + " SET tecnico=@tec, data=@dt WHERE id=@id", cnn);

                            cd_lj.Parameters.Add("@tec", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                            //cd_lj.Parameters.Add("@lj", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                            cd_lj.Parameters.Add("@dt", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                            //cd_lj.Parameters.Add("@al", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                            //cd_lj.Parameters.Add("@obs", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = richTextBox1.Text;
                            cd_lj.Parameters.Add("@id", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = id.ToString();





                            cd_lj.ExecuteNonQuery();
                            cnn.Close();

                            //nulotext();
                            lblmensagemrota.Text = "Alteração para Plantão de - " + cbxtecrotas.Text + " - realizado com sucesso!";
                            timer1.Start();

                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message);
                        }
                    }
                    else if (chkhome.Checked)
                    {

                        try
                        {
                            MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);
                            cnn.Open();
                            MySql.Data.MySqlClient.MySqlCommand cd_lj = new MySql.Data.MySqlClient.MySqlCommand("UPDATE " + banco + " SET tecnico=@tec, data=@dt, alteradopor=@al, tipo=@tipo WHERE id=@id", cnn);

                            cd_lj.Parameters.Add("@tec", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxtecrotas.Text;
                            //cd_lj.Parameters.Add("@lj", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = cbxlojasrotas.Text;
                            cd_lj.Parameters.Add("@dt", MySql.Data.MySqlClient.MySqlDbType.DateTime, 45).Value = datarotas.Value.ToString("yyyy/MM/dd");
                            cd_lj.Parameters.Add("@al", MySql.Data.MySqlClient.MySqlDbType.VarChar, 45).Value = Environment.UserName.ToString();
                            cd_lj.Parameters.Add("@tipo", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = cbxtipoalt.Text;
                            cd_lj.Parameters.Add("@id", MySql.Data.MySqlClient.MySqlDbType.VarChar, 500).Value = id.ToString();





                            cd_lj.ExecuteNonQuery();
                            cnn.Close();

                            //nulotext();
                            lblmensagemrota.ForeColor = Color.Blue;
                            lblmensagemrota.Text = "Alteração para -  " + cbxtipoalt.Text + "   - realizado com sucesso!";
                            timer1.Start();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message);
                        }
                    }
                }
                senha = null;
            }
        }

        private void lblmensagemrota_TextChanged(object sender, EventArgs e)
        {
            lblmensagemrota.MaximumSize = new Size(300, 0);
            lblmensagemrota.AutoSize = true;
            lblmensagemrota.Left = (this.panel2.Width - lblmensagemrota.Size.Width) / 2;
        }

        private void chkrotas_CheckedChanged_1(object sender, EventArgs e)
        {
            if (chkrotas.Checked)
            {
                banco = "rotas";
                tipovalor = "rotas";
                radioRota1.Visible = true;
                radioRota2.Visible = true;
                chkhome.Enabled = false;
                chkplantao.Enabled = false;
                cbxlojasrotas.Enabled = true;
                cbxtecrotas.Enabled = true;
                richTextBox1.Enabled = true;
                if (chkupdate.Checked)
                {
                    UP();
                    dataGridView2.Columns[7].Visible = false;
                    dataGridView2.Columns[6].Visible = false;
                    dataGridView2.Columns[0].Visible = false;
                }
                
                
            }
            else
            {
                radioRota1.Visible = false;
                radioRota2.Visible = false;
                chkhome.Enabled = true;
                chkplantao.Enabled = true;
                cbxlojasrotas.Enabled = false;
                cbxtecrotas.Enabled = false;
                panel3.Visible = false;
                richTextBox1.Enabled=false;
            }
        }

        private void chkplantao_CheckedChanged(object sender, EventArgs e)
        {

            if (chkplantao.Checked)
            {
                banco = "plantoes";
                tipovalor = "plantoes";
                chkhome.Enabled = false;
                chkrotas.Enabled = false;
                //cbxtipoalt.Enabled = true;
                cbxtecrotas.Enabled = true;
                if (chkupdate.Checked)
                {
                    UP();
                    
                    dataGridView2.Columns[0].Visible = false;
                }


            }
            else
            {
                chkhome.Enabled = true;
                chkrotas.Enabled = true;
                //cbxtipoalt.Enabled = false;
                cbxtecrotas.Enabled = false;
            }
        }

        private void chkupdate_MouseHover(object sender, EventArgs e)
        {
            toolTip1.Show("Use esta função para Modificar, Ou Deletar Rotas, Plantões ou Folgas cadastradas. Ao habilitar obrigatoriamente deve marcar alguma chekbox acima",chkupdate,5000);
        }

        private void label2_SizeChanged(object sender, EventArgs e)
        {
            
        }
        
        void UP()
        {
            panel3.Visible = true;
            dataGridView2.Visible = true;
            try
            {

                MySql.Data.MySqlClient.MySqlConnection cnn = new MySql.Data.MySqlClient.MySqlConnection(data_source);

                DataTable table = new DataTable();
                cnn.Open();
                MySqlCommand csmd = new MySqlCommand();

                csmd = cnn.CreateCommand();
                this.dataGridView2.DefaultCellStyle.WrapMode = DataGridViewTriState.True;

                //dtagrid rota principal
                cnn.CreateCommand();
                csmd.CommandText = "Select * From " + banco+ " ORDER BY data DESC";
                MySqlDataReader sdr = csmd.ExecuteReader();
                table.Load(sdr);
                cnn.Close();
                dataGridView2.DataSource = table;
                dataGridView2.AlternatingRowsDefaultCellStyle.BackColor = Color.LightGreen;

               

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void chkhome_CheckedChanged(object sender, EventArgs e)
        {
           
          
            if (chkhome.Checked)
            {
                tipovalor = "home";
                banco = "folga_hoffice";
                //chkhome.Enabled = false;
                chkrotas.Enabled = false;
                chkplantao.Enabled = false;
                //cbxtipoalt.Enabled = true;
                cbxtipoalt.Enabled = true;
                cbxtecrotas.Enabled = true;
                if (chkupdate.Checked)
                {
                    UP();
                    dataGridView2.Columns[5].Visible = false;
                    
                    dataGridView2.Columns[0].Visible = false;
                }
            }
            else
            {
                chkhome.Enabled = true;
                chkrotas.Enabled = true;
                chkplantao.Enabled = true;
                //cbxtipoalt.Enabled = false;
                cbxtipoalt.Enabled = false;
                cbxtecrotas.Enabled = false;
            }
        }

        private void chkupdate_CheckedChanged(object sender, EventArgs e)
        {
            if (chkupdate.Checked)
            {
                chkhome.Checked = false;
                chkrotas.Checked = false;
                chkplantao.Checked = false;
                btnCadRotas.Visible = false;
                btnalterar.Visible = true;
                chkdel.Visible = true;
               
            }
            else
            {
                btnalterar.Visible = false;
                btnCadRotas.Visible = true;
                chkdel.Visible=false;
                panel3.Visible = false;
            }
        }

        private void chkdel_CheckedChanged(object sender, EventArgs e)
        {
            if (chkdel.Checked)
            {
                btnalterar.Text = "deletar";

            }
        }

        private void dataGridView2_ColumnHeaderCellChanged(object sender, DataGridViewColumnEventArgs e)
        {
            this.panel3.Left = (this.panel1.Width - panel3.Size.Width ) / 2;
        }

       
        private void lblfechardt_Click(object sender, EventArgs e)
        {
            this.panel3.Dispose();
        }

       
        private void dataGridView2_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (chkrotas.Checked)
            {
                var Id = dataGridView2.Rows[e.RowIndex].Cells[0].Value;
                var tec = dataGridView2.Rows[e.RowIndex].Cells[1].Value;
                var loja = dataGridView2.Rows[e.RowIndex].Cells[2].Value;
                //var data = dataGridView2.Rows[e.RowIndex].Cells[3].Value;
                //dataGridView2.Rows[e.RowIndex].Cells[3].Value = datarotas.Value.ToString("dd-MM-yyyy");
                datarotas.Value = Convert.ToDateTime(dataGridView2.Rows[e.RowIndex].Cells[3].Value.ToString());
                var obs = dataGridView2.Rows[e.RowIndex].Cells[5].Value;
                var rt = dataGridView2.Rows[e.RowIndex].Cells[8].Value;
                id = Id.ToString();
                richTextBox1.Text = obs.ToString();
                cbxlojasrotas.Text = loja.ToString();
                cbxtecrotas.Text = tec.ToString();
                //MessageBox.Show(rt.ToString());
                if(rt.ToString() == "1")
                {
                    radioRota1.Checked = true;
                }
                else
                {
                    radioRota2.Checked = true;  
                }
                //datarotas.Value = new DateTime(long.Parse(data.ToString()));

            }
            if (chkplantao.Checked)
            {
                var Id = dataGridView2.Rows[e.RowIndex].Cells[0].Value;
                var tec = dataGridView2.Rows[e.RowIndex].Cells[2].Value;
                //var loja = dataGridView2.Rows[e.RowIndex].Cells[2].Value;
                //var data = dataGridView2.Rows[e.RowIndex].Cells[3].Value;
                //dataGridView2.Rows[e.RowIndex].Cells[3].Value = datarotas.Value.ToString("dd-MM-yyyy");
                datarotas.Value = Convert.ToDateTime(dataGridView2.Rows[e.RowIndex].Cells[1].Value.ToString());
                //var obs = dataGridView2.Rows[e.RowIndex].Cells[5].Value;
                id = Id.ToString();

                //cbxlojasrotas.Text = loja.ToString();
                cbxtecrotas.Text = tec.ToString();
                //datarotas.Value = new DateTime(long.Parse(data.ToString()));

            }
            
            if (chkhome.Checked)
            {
                var Id = dataGridView2.Rows[e.RowIndex].Cells[0].Value;
                var tec = dataGridView2.Rows[e.RowIndex].Cells[1].Value;
                var tipo = dataGridView2.Rows[e.RowIndex].Cells[3].Value;
                //var data = dataGridView2.Rows[e.RowIndex].Cells[3].Value;
                //dataGridView2.Rows[e.RowIndex].Cells[3].Value = datarotas.Value.ToString("dd-MM-yyyy");
                datarotas.Value = Convert.ToDateTime(dataGridView2.Rows[e.RowIndex].Cells[2].Value.ToString());
                //var obs = dataGridView2.Rows[e.RowIndex].Cells[5].Value;
                id = Id.ToString();

                cbxtipoalt.Text = tipo.ToString();
                cbxtecrotas.Text = tec.ToString();
                //datarotas.Value = new DateTime(long.Parse(data.ToString()));

            }


            panel3.Visible = false;
            dataGridView2.Visible = false;
        }

        private void lblfechardt_MouseClick(object sender, MouseEventArgs e)
        {
            panel3.Visible=false;
        }

        private void lblmensagemrota_SizeChanged(object sender, EventArgs e)
        {
            lblmensagemrota.ForeColor = Color.Blue;
            lblmensagemrota.MaximumSize = new Size(300, 0);
            lblmensagemrota.AutoSize = true;
            lblmensagemrota.Left = (this.panel2.Width - lblmensagemrota.Size.Width) / 2;
            //timer1.Start();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
          
                lblmensagemrota.Visible = false;
                timer1.Stop();
         
        }

        private void chkdel_CheckedChanged_1(object sender, EventArgs e)
        {
            if (chkdel.Checked)
            {
                btnalterar.Text = "Deletar";
            }
            else
            {
                btnalterar.Text = "Alterar";
            }
            
        }
        void oksenha()
        {
            if (textSenha.Text != "opdsef")
            {
                toolTip1.Show("Senha Invalida", textSenha, 3000);
                return;
            }
            else
            {
                btnalterar.Enabled = true;
                senha = "oksenha";
                PnSenha.Visible = false;
                chkdel.Enabled = true;
            }
        }
        private void BtnSenha_Click(object sender, EventArgs e)
        {
            oksenha();
        }

        private void textSenha_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)13)
            {
                oksenha();
            }
        }

        private void lblclose_Click(object sender, EventArgs e)
        {
            PnSenha.Visible = false;
            btnalterar.Enabled = true;
            chkdel.Enabled = true;
        }
    }
}
