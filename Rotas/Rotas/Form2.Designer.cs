namespace Rotas
{
    partial class Form2
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form2));
            this.lbltitulo = new System.Windows.Forms.Label();
            this.panel6 = new System.Windows.Forms.Panel();
            this.lblfechar = new System.Windows.Forms.Label();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.panel7 = new System.Windows.Forms.Panel();
            this.PnSenha = new System.Windows.Forms.Panel();
            this.lblclose = new System.Windows.Forms.Label();
            this.LblSenha = new System.Windows.Forms.Label();
            this.textSenha = new System.Windows.Forms.TextBox();
            this.BtnSenha = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.lblfechardt = new System.Windows.Forms.Label();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel9 = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.chkhome = new System.Windows.Forms.CheckBox();
            this.chkplantao = new System.Windows.Forms.CheckBox();
            this.chkrotas = new System.Windows.Forms.CheckBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.chkupdate = new System.Windows.Forms.CheckBox();
            this.lblTituloRotas = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.cbxtipoalt = new System.Windows.Forms.ComboBox();
            this.datarotas = new System.Windows.Forms.DateTimePicker();
            this.cbxtecrotas = new System.Windows.Forms.ComboBox();
            this.cbxlojasrotas = new System.Windows.Forms.ComboBox();
            this.lbldata = new System.Windows.Forms.Label();
            this.lblrotaLoja = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.radioRota2 = new System.Windows.Forms.RadioButton();
            this.radioRota1 = new System.Windows.Forms.RadioButton();
            this.lblobs = new System.Windows.Forms.Label();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.btnCadRotas = new System.Windows.Forms.Button();
            this.lblmensagemrota = new System.Windows.Forms.Label();
            this.chkdel = new System.Windows.Forms.CheckBox();
            this.btnalterar = new System.Windows.Forms.Button();
            this.lblrotaTec = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.panel6.SuspendLayout();
            this.panel7.SuspendLayout();
            this.PnSenha.SuspendLayout();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.panel9.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbltitulo
            // 
            this.lbltitulo.AutoSize = true;
            this.lbltitulo.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbltitulo.Location = new System.Drawing.Point(474, 10);
            this.lbltitulo.Name = "lbltitulo";
            this.lbltitulo.Size = new System.Drawing.Size(47, 18);
            this.lbltitulo.TabIndex = 0;
            this.lbltitulo.Text = "Rotas";
            // 
            // panel6
            // 
            this.panel6.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel6.Controls.Add(this.lblfechar);
            this.panel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel6.Location = new System.Drawing.Point(0, 0);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(804, 528);
            this.panel6.TabIndex = 7;
            // 
            // lblfechar
            // 
            this.lblfechar.AutoSize = true;
            this.lblfechar.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblfechar.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblfechar.Location = new System.Drawing.Point(780, 0);
            this.lblfechar.Name = "lblfechar";
            this.lblfechar.Size = new System.Drawing.Size(22, 20);
            this.lblfechar.TabIndex = 3;
            this.lblfechar.Text = "☒";
            this.lblfechar.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lblfechar.MouseClick += new System.Windows.Forms.MouseEventHandler(this.lblfechar_MouseClick);
            // 
            // panel7
            // 
            this.panel7.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel7.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel7.Controls.Add(this.PnSenha);
            this.panel7.Controls.Add(this.panel3);
            this.panel7.Controls.Add(this.label2);
            this.panel7.Controls.Add(this.label1);
            this.panel7.Controls.Add(this.panel9);
            this.panel7.Controls.Add(this.lblTituloRotas);
            this.panel7.Controls.Add(this.label9);
            this.panel7.Controls.Add(this.cbxtipoalt);
            this.panel7.Controls.Add(this.datarotas);
            this.panel7.Controls.Add(this.cbxtecrotas);
            this.panel7.Controls.Add(this.cbxlojasrotas);
            this.panel7.Controls.Add(this.lbldata);
            this.panel7.Controls.Add(this.lblrotaLoja);
            this.panel7.Controls.Add(this.panel2);
            this.panel7.Location = new System.Drawing.Point(28, 72);
            this.panel7.Name = "panel7";
            this.panel7.Size = new System.Drawing.Size(749, 413);
            this.panel7.TabIndex = 25;
            // 
            // PnSenha
            // 
            this.PnSenha.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.PnSenha.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.PnSenha.Controls.Add(this.lblclose);
            this.PnSenha.Controls.Add(this.LblSenha);
            this.PnSenha.Controls.Add(this.textSenha);
            this.PnSenha.Controls.Add(this.BtnSenha);
            this.PnSenha.Location = new System.Drawing.Point(708, 132);
            this.PnSenha.Name = "PnSenha";
            this.PnSenha.Size = new System.Drawing.Size(234, 100);
            this.PnSenha.TabIndex = 30;
            this.PnSenha.Visible = false;
            // 
            // lblclose
            // 
            this.lblclose.AutoSize = true;
            this.lblclose.Location = new System.Drawing.Point(216, 2);
            this.lblclose.Name = "lblclose";
            this.lblclose.Size = new System.Drawing.Size(14, 16);
            this.lblclose.TabIndex = 3;
            this.lblclose.Text = "X";
            this.lblclose.Click += new System.EventHandler(this.lblclose_Click);
            // 
            // LblSenha
            // 
            this.LblSenha.AutoSize = true;
            this.LblSenha.Location = new System.Drawing.Point(130, 13);
            this.LblSenha.Name = "LblSenha";
            this.LblSenha.Size = new System.Drawing.Size(42, 16);
            this.LblSenha.TabIndex = 2;
            this.LblSenha.Text = "Senha";
            // 
            // textSenha
            // 
            this.textSenha.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.textSenha.Location = new System.Drawing.Point(36, 40);
            this.textSenha.Name = "textSenha";
            this.textSenha.Size = new System.Drawing.Size(157, 21);
            this.textSenha.TabIndex = 1;
            this.textSenha.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.textSenha.UseSystemPasswordChar = true;
            this.textSenha.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.textSenha_KeyPress);
            // 
            // BtnSenha
            // 
            this.BtnSenha.Location = new System.Drawing.Point(79, 72);
            this.BtnSenha.Name = "BtnSenha";
            this.BtnSenha.Size = new System.Drawing.Size(75, 23);
            this.BtnSenha.TabIndex = 0;
            this.BtnSenha.Text = "OK";
            this.BtnSenha.UseVisualStyleBackColor = true;
            this.BtnSenha.Click += new System.EventHandler(this.BtnSenha_Click);
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.lblfechardt);
            this.panel3.Controls.Add(this.dataGridView2);
            this.panel3.Location = new System.Drawing.Point(690, 74);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(607, 281);
            this.panel3.TabIndex = 43;
            this.panel3.Visible = false;
            // 
            // lblfechardt
            // 
            this.lblfechardt.AutoSize = true;
            this.lblfechardt.Dock = System.Windows.Forms.DockStyle.Right;
            this.lblfechardt.Font = new System.Drawing.Font("Century Gothic", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblfechardt.Location = new System.Drawing.Point(583, 0);
            this.lblfechardt.Name = "lblfechardt";
            this.lblfechardt.Size = new System.Drawing.Size(22, 20);
            this.lblfechardt.TabIndex = 44;
            this.lblfechardt.Text = "☒";
            this.lblfechardt.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.lblfechardt.MouseClick += new System.Windows.Forms.MouseEventHandler(this.lblfechardt_MouseClick);
            // 
            // dataGridView2
            // 
            this.dataGridView2.AllowUserToAddRows = false;
            this.dataGridView2.AllowUserToDeleteRows = false;
            this.dataGridView2.AllowUserToOrderColumns = true;
            this.dataGridView2.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dataGridView2.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView2.BackgroundColor = System.Drawing.Color.WhiteSmoke;
            this.dataGridView2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dataGridView2.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            this.dataGridView2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView2.EnableHeadersVisualStyles = false;
            this.dataGridView2.Location = new System.Drawing.Point(0, 0);
            this.dataGridView2.MultiSelect = false;
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.ReadOnly = true;
            this.dataGridView2.RowHeadersVisible = false;
            this.dataGridView2.Size = new System.Drawing.Size(605, 279);
            this.dataGridView2.TabIndex = 43;
            this.dataGridView2.Visible = false;
            this.dataGridView2.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellDoubleClick);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label2.Location = new System.Drawing.Point(414, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 18);
            this.label2.TabIndex = 42;
            this.label2.Text = "Selcionar Tipo";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Location = new System.Drawing.Point(65, 106);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(83, 18);
            this.label1.TabIndex = 41;
            this.label1.Text = "Selcionar Tipo";
            // 
            // panel9
            // 
            this.panel9.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel9.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel9.Controls.Add(this.label3);
            this.panel9.Controls.Add(this.chkhome);
            this.panel9.Controls.Add(this.chkplantao);
            this.panel9.Controls.Add(this.chkrotas);
            this.panel9.Controls.Add(this.panel1);
            this.panel9.Location = new System.Drawing.Point(39, 114);
            this.panel9.Name = "panel9";
            this.panel9.Size = new System.Drawing.Size(134, 176);
            this.panel9.TabIndex = 39;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label3.Location = new System.Drawing.Point(19, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(110, 18);
            this.label3.TabIndex = 43;
            this.label3.Text = "Modificar / Deletar";
            // 
            // chkhome
            // 
            this.chkhome.AutoSize = true;
            this.chkhome.Location = new System.Drawing.Point(22, 59);
            this.chkhome.Name = "chkhome";
            this.chkhome.Size = new System.Drawing.Size(90, 20);
            this.chkhome.TabIndex = 27;
            this.chkhome.Text = "HomeOffice";
            this.chkhome.UseVisualStyleBackColor = true;
            this.chkhome.CheckedChanged += new System.EventHandler(this.chkhome_CheckedChanged);
            // 
            // chkplantao
            // 
            this.chkplantao.AutoSize = true;
            this.chkplantao.Location = new System.Drawing.Point(22, 35);
            this.chkplantao.Name = "chkplantao";
            this.chkplantao.Size = new System.Drawing.Size(69, 20);
            this.chkplantao.TabIndex = 26;
            this.chkplantao.Text = "Plantão";
            this.chkplantao.UseVisualStyleBackColor = true;
            this.chkplantao.CheckedChanged += new System.EventHandler(this.chkplantao_CheckedChanged);
            // 
            // chkrotas
            // 
            this.chkrotas.AutoSize = true;
            this.chkrotas.Location = new System.Drawing.Point(22, 12);
            this.chkrotas.Name = "chkrotas";
            this.chkrotas.Size = new System.Drawing.Size(56, 20);
            this.chkrotas.TabIndex = 25;
            this.chkrotas.Text = "Rotas";
            this.chkrotas.UseVisualStyleBackColor = true;
            this.chkrotas.CheckedChanged += new System.EventHandler(this.chkrotas_CheckedChanged_1);
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.chkupdate);
            this.panel1.Location = new System.Drawing.Point(-1, 102);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(134, 73);
            this.panel1.TabIndex = 40;
            // 
            // chkupdate
            // 
            this.chkupdate.AutoSize = true;
            this.chkupdate.Font = new System.Drawing.Font("Century Gothic", 6.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkupdate.Location = new System.Drawing.Point(10, 23);
            this.chkupdate.Name = "chkupdate";
            this.chkupdate.Size = new System.Drawing.Size(111, 17);
            this.chkupdate.TabIndex = 28;
            this.chkupdate.Text = "Modificar / Deletar";
            this.chkupdate.UseVisualStyleBackColor = true;
            this.chkupdate.CheckedChanged += new System.EventHandler(this.chkupdate_CheckedChanged);
            // 
            // lblTituloRotas
            // 
            this.lblTituloRotas.AutoSize = true;
            this.lblTituloRotas.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblTituloRotas.Location = new System.Drawing.Point(414, 0);
            this.lblTituloRotas.Name = "lblTituloRotas";
            this.lblTituloRotas.Size = new System.Drawing.Size(111, 18);
            this.lblTituloRotas.TabIndex = 38;
            this.lblTituloRotas.Text = "Cadastro de Rotas";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(322, 246);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(29, 16);
            this.label9.TabIndex = 36;
            this.label9.Text = "Tipo";
            // 
            // cbxtipoalt
            // 
            this.cbxtipoalt.Enabled = false;
            this.cbxtipoalt.FormattingEnabled = true;
            this.cbxtipoalt.Items.AddRange(new object[] {
            "Folga",
            "Home Office"});
            this.cbxtipoalt.Location = new System.Drawing.Point(373, 238);
            this.cbxtipoalt.Name = "cbxtipoalt";
            this.cbxtipoalt.Size = new System.Drawing.Size(192, 24);
            this.cbxtipoalt.TabIndex = 35;
            // 
            // datarotas
            // 
            this.datarotas.CustomFormat = "yyyy-dd-MM";
            this.datarotas.Location = new System.Drawing.Point(357, 145);
            this.datarotas.Name = "datarotas";
            this.datarotas.Size = new System.Drawing.Size(240, 21);
            this.datarotas.TabIndex = 9;
            this.datarotas.ValueChanged += new System.EventHandler(this.datarotas_ValueChanged);
            // 
            // cbxtecrotas
            // 
            this.cbxtecrotas.Enabled = false;
            this.cbxtecrotas.FormattingEnabled = true;
            this.cbxtecrotas.Location = new System.Drawing.Point(398, 89);
            this.cbxtecrotas.Name = "cbxtecrotas";
            this.cbxtecrotas.Size = new System.Drawing.Size(145, 24);
            this.cbxtecrotas.TabIndex = 2;
            // 
            // cbxlojasrotas
            // 
            this.cbxlojasrotas.Enabled = false;
            this.cbxlojasrotas.FormattingEnabled = true;
            this.cbxlojasrotas.Location = new System.Drawing.Point(373, 191);
            this.cbxlojasrotas.Name = "cbxlojasrotas";
            this.cbxlojasrotas.Size = new System.Drawing.Size(192, 24);
            this.cbxlojasrotas.TabIndex = 7;
            // 
            // lbldata
            // 
            this.lbldata.AutoSize = true;
            this.lbldata.Location = new System.Drawing.Point(450, 126);
            this.lbldata.Name = "lbldata";
            this.lbldata.Size = new System.Drawing.Size(35, 16);
            this.lbldata.TabIndex = 11;
            this.lbldata.Text = "Data";
            // 
            // lblrotaLoja
            // 
            this.lblrotaLoja.AutoSize = true;
            this.lblrotaLoja.Location = new System.Drawing.Point(322, 192);
            this.lblrotaLoja.Name = "lblrotaLoja";
            this.lblrotaLoja.Size = new System.Drawing.Size(29, 16);
            this.lblrotaLoja.TabIndex = 10;
            this.lblrotaLoja.Text = "Loja";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.radioRota2);
            this.panel2.Controls.Add(this.radioRota1);
            this.panel2.Controls.Add(this.lblobs);
            this.panel2.Controls.Add(this.richTextBox1);
            this.panel2.Controls.Add(this.btnCadRotas);
            this.panel2.Controls.Add(this.lblmensagemrota);
            this.panel2.Controls.Add(this.chkdel);
            this.panel2.Controls.Add(this.btnalterar);
            this.panel2.Controls.Add(this.lblrotaTec);
            this.panel2.Location = new System.Drawing.Point(246, 57);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(410, 337);
            this.panel2.TabIndex = 40;
            // 
            // radioRota2
            // 
            this.radioRota2.AutoSize = true;
            this.radioRota2.Location = new System.Drawing.Point(231, 111);
            this.radioRota2.Name = "radioRota2";
            this.radioRota2.Size = new System.Drawing.Size(60, 20);
            this.radioRota2.TabIndex = 29;
            this.radioRota2.Text = "Rota 2";
            this.radioRota2.UseVisualStyleBackColor = true;
            this.radioRota2.Visible = false;
            // 
            // radioRota1
            // 
            this.radioRota1.AutoSize = true;
            this.radioRota1.Checked = true;
            this.radioRota1.Location = new System.Drawing.Point(152, 111);
            this.radioRota1.Name = "radioRota1";
            this.radioRota1.Size = new System.Drawing.Size(60, 20);
            this.radioRota1.TabIndex = 29;
            this.radioRota1.TabStop = true;
            this.radioRota1.Text = "Rota 1";
            this.radioRota1.UseVisualStyleBackColor = true;
            this.radioRota1.Visible = false;
            // 
            // lblobs
            // 
            this.lblobs.AutoSize = true;
            this.lblobs.Location = new System.Drawing.Point(75, 235);
            this.lblobs.Name = "lblobs";
            this.lblobs.Size = new System.Drawing.Size(29, 16);
            this.lblobs.TabIndex = 28;
            this.lblobs.Text = "Obs";
            // 
            // richTextBox1
            // 
            this.richTextBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.richTextBox1.Enabled = false;
            this.richTextBox1.Location = new System.Drawing.Point(126, 217);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(192, 51);
            this.richTextBox1.TabIndex = 27;
            this.richTextBox1.Text = "";
            // 
            // btnCadRotas
            // 
            this.btnCadRotas.Location = new System.Drawing.Point(171, 302);
            this.btnCadRotas.Name = "btnCadRotas";
            this.btnCadRotas.Size = new System.Drawing.Size(75, 23);
            this.btnCadRotas.TabIndex = 3;
            this.btnCadRotas.Text = "Cadastrar";
            this.btnCadRotas.UseVisualStyleBackColor = true;
            this.btnCadRotas.Click += new System.EventHandler(this.btnCadRotas_Click);
            // 
            // lblmensagemrota
            // 
            this.lblmensagemrota.AutoSize = true;
            this.lblmensagemrota.Location = new System.Drawing.Point(95, 266);
            this.lblmensagemrota.Name = "lblmensagemrota";
            this.lblmensagemrota.Size = new System.Drawing.Size(33, 16);
            this.lblmensagemrota.TabIndex = 19;
            this.lblmensagemrota.Text = "tetse";
            this.lblmensagemrota.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.lblmensagemrota.SizeChanged += new System.EventHandler(this.lblmensagemrota_SizeChanged);
            this.lblmensagemrota.TextChanged += new System.EventHandler(this.lblmensagemrota_TextChanged);
            // 
            // chkdel
            // 
            this.chkdel.AutoSize = true;
            this.chkdel.Location = new System.Drawing.Point(252, 304);
            this.chkdel.Name = "chkdel";
            this.chkdel.Size = new System.Drawing.Size(65, 20);
            this.chkdel.TabIndex = 26;
            this.chkdel.Text = "Deletar";
            this.chkdel.UseVisualStyleBackColor = true;
            this.chkdel.Visible = false;
            this.chkdel.CheckedChanged += new System.EventHandler(this.chkdel_CheckedChanged_1);
            // 
            // btnalterar
            // 
            this.btnalterar.Location = new System.Drawing.Point(90, 302);
            this.btnalterar.Name = "btnalterar";
            this.btnalterar.Size = new System.Drawing.Size(75, 23);
            this.btnalterar.TabIndex = 20;
            this.btnalterar.Text = "Alterar";
            this.btnalterar.UseVisualStyleBackColor = true;
            this.btnalterar.Click += new System.EventHandler(this.btnalterar_Click);
            // 
            // lblrotaTec
            // 
            this.lblrotaTec.AutoSize = true;
            this.lblrotaTec.Location = new System.Drawing.Point(55, 34);
            this.lblrotaTec.Name = "lblrotaTec";
            this.lblrotaTec.Size = new System.Drawing.Size(49, 16);
            this.lblrotaTec.TabIndex = 7;
            this.lblrotaTec.Text = "Técnico";
            // 
            // timer1
            // 
            this.timer1.Interval = 10000;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(804, 528);
            this.Controls.Add(this.panel7);
            this.Controls.Add(this.lbltitulo);
            this.Controls.Add(this.panel6);
            this.Font = new System.Drawing.Font("Century Gothic", 8.25F);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form2";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CadRotas";
            this.Load += new System.EventHandler(this.Form2_Load);
            this.panel6.ResumeLayout(false);
            this.panel6.PerformLayout();
            this.panel7.ResumeLayout(false);
            this.panel7.PerformLayout();
            this.PnSenha.ResumeLayout(false);
            this.PnSenha.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.panel9.ResumeLayout(false);
            this.panel9.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbltitulo;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.Label lblfechar;
        private System.Windows.Forms.ToolTip toolTip1;
        private System.Windows.Forms.Panel panel7;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel panel9;
        private System.Windows.Forms.CheckBox chkhome;
        private System.Windows.Forms.CheckBox chkplantao;
        private System.Windows.Forms.CheckBox chkrotas;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblTituloRotas;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ComboBox cbxtipoalt;
        private System.Windows.Forms.DateTimePicker datarotas;
        private System.Windows.Forms.ComboBox cbxtecrotas;
        private System.Windows.Forms.ComboBox cbxlojasrotas;
        private System.Windows.Forms.Label lbldata;
        private System.Windows.Forms.Label lblrotaLoja;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Label lblfechardt;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.Label lblobs;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button btnCadRotas;
        private System.Windows.Forms.Label lblmensagemrota;
        private System.Windows.Forms.CheckBox chkdel;
        private System.Windows.Forms.Button btnalterar;
        private System.Windows.Forms.Label lblrotaTec;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.CheckBox chkupdate;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.RadioButton radioRota2;
        private System.Windows.Forms.RadioButton radioRota1;
        private System.Windows.Forms.Panel PnSenha;
        private System.Windows.Forms.Label LblSenha;
        private System.Windows.Forms.TextBox textSenha;
        private System.Windows.Forms.Button BtnSenha;
        private System.Windows.Forms.Label lblclose;
    }
}