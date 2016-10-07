using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QuanLiBanHang.Data;
using QuanLiBanHang.Entity;

namespace QuanLiBanHang.Gui
{
    public partial class frmDangNhap : Form
    {
        DangNhap dn = new DangNhap();
        public frmDangNhap()
        {
            InitializeComponent();
        }
       
        private void btnDangnhap_Click(object sender, EventArgs e)
        {
            bool check = dn.Login(txtTaikhoan.Text, txtMatkhau.Text);
            if (check == true)
            {
                frmMain main = new frmMain();
                this.Hide();
                main.ShowDialog();
               
            }
            else
                MessageBox.Show("Đăng nhập không thành công");
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
