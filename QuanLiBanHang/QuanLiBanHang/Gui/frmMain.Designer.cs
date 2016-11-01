namespace QuanLiBanHang.Gui
{
    partial class frmMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.QuanLiToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuQuanLi = new System.Windows.Forms.ToolStripMenuItem();
            this.menuNhanvien = new System.Windows.Forms.ToolStripMenuItem();
            this.kháchHàngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.hệThốngToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.đổiMậtKhâuToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.hướngDẫnToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.Color.LawnGreen;
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.QuanLiToolStripMenuItem,
            this.menuQuanLi,
            this.hệThốngToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(796, 27);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // QuanLiToolStripMenuItem
            // 
            this.QuanLiToolStripMenuItem.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QuanLiToolStripMenuItem.Name = "QuanLiToolStripMenuItem";
            this.QuanLiToolStripMenuItem.Size = new System.Drawing.Size(88, 23);
            this.QuanLiToolStripMenuItem.Text = "Bán Hàng";
            this.QuanLiToolStripMenuItem.Click += new System.EventHandler(this.QuanLiToolStripMenuItem_Click);
            // 
            // menuQuanLi
            // 
            this.menuQuanLi.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuNhanvien,
            this.kháchHàngToolStripMenuItem});
            this.menuQuanLi.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menuQuanLi.Name = "menuQuanLi";
            this.menuQuanLi.Size = new System.Drawing.Size(75, 23);
            this.menuQuanLi.Text = "Quản Lí";
            // 
            // menuNhanvien
            // 
            this.menuNhanvien.Name = "menuNhanvien";
            this.menuNhanvien.Size = new System.Drawing.Size(157, 24);
            this.menuNhanvien.Text = "Nhân viên";
            this.menuNhanvien.Click += new System.EventHandler(this.menuNhanvien_Click);
            // 
            // kháchHàngToolStripMenuItem
            // 
            this.kháchHàngToolStripMenuItem.Name = "kháchHàngToolStripMenuItem";
            this.kháchHàngToolStripMenuItem.Size = new System.Drawing.Size(157, 24);
            this.kháchHàngToolStripMenuItem.Text = "Khách hàng";
            // 
            // hệThốngToolStripMenuItem
            // 
            this.hệThốngToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.đổiMậtKhâuToolStripMenuItem,
            this.hướngDẫnToolStripMenuItem});
            this.hệThốngToolStripMenuItem.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.hệThốngToolStripMenuItem.Name = "hệThốngToolStripMenuItem";
            this.hệThốngToolStripMenuItem.Size = new System.Drawing.Size(87, 23);
            this.hệThốngToolStripMenuItem.Text = "Hệ Thống";
            // 
            // đổiMậtKhâuToolStripMenuItem
            // 
            this.đổiMậtKhâuToolStripMenuItem.Name = "đổiMậtKhâuToolStripMenuItem";
            this.đổiMậtKhâuToolStripMenuItem.Size = new System.Drawing.Size(168, 24);
            this.đổiMậtKhâuToolStripMenuItem.Text = "Đổi mật khẩu";
            // 
            // hướngDẫnToolStripMenuItem
            // 
            this.hướngDẫnToolStripMenuItem.Name = "hướngDẫnToolStripMenuItem";
            this.hướngDẫnToolStripMenuItem.Size = new System.Drawing.Size(168, 24);
            this.hướngDẫnToolStripMenuItem.Text = "Hướng dẫn";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(0, 27);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(796, 259);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 1;
            this.pictureBox1.TabStop = false;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(796, 286);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "frmMain";
            this.Text = "frmMain";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem QuanLiToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem menuQuanLi;
        private System.Windows.Forms.ToolStripMenuItem menuNhanvien;
        private System.Windows.Forms.ToolStripMenuItem hệThốngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem kháchHàngToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem đổiMậtKhâuToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem hướngDẫnToolStripMenuItem;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}