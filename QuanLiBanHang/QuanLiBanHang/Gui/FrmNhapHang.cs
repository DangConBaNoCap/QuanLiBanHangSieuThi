using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using QuanLiBanHang.Data;
namespace QuanLiBanHang.Gui
{
    public partial class FrmNhapHang : Form
    {
        public FrmNhapHang()
        {
            InitializeComponent();
        }
        LoaiHangBus lh = new LoaiHangBus();
        NhaCCBus ncc = new NhaCCBus();
        public void LoadDuLieu()
        {
            cboLoaiHang.DataSource=lh.HienThiSanPham("");
            cboLoaiHang.DisplayMember = "TenLH";
            cboLoaiHang.SelectedValue = "MaLH";

            cboNhaCC.DataSource = ncc.HienThiKhachHang("");
            cboNhaCC.DisplayMember = "NhaCC";
            cboNhaCC.SelectedValue = "NhaCC";
        }

        private void FrmNhapHang_Load(object sender, EventArgs e)
        {
            LoadDuLieu();
        }
    }
}
