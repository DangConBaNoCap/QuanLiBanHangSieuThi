using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLiBanHang.Gui
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
        }

        private void menuNhanvien_Click(object sender, EventArgs e)
        {
            frmNhanVien nv = new frmNhanVien();
            nv.ShowDialog();

        }

        private void QuanLiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmBanHang bh = new frmBanHang();
            bh.ShowDialog();
        }

        

       

        
    }
}
