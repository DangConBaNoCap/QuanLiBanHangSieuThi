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
using QuanLiBanHang.Entity;
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

        private void btnThem_Click(object sender, EventArgs e)
        {
            SanPhamEntity sp = new SanPhamEntity();
            sp.TenSP = txtTenSP.Text;
            sp.SoLuong = int.Parse(txtSoLuong.Text);
            sp.MaLH = cboLoaiHang.SelectedValue.ToString();
            sp.GiaNhap = int.Parse(txtGiaNhap.ToString());
            sp.GiaBan = int.Parse(txtGiaBan.ToString());
            sp.MoTa = rtbMoTa.Text;
            sp.NSX = dtNgaySX.Value.ToString();
            sp.NhaCC = cboNhaCC.SelectedValue.ToString();
            SanPhamBus temp = new SanPhamBus();
            temp.ThemSanPham(sp);

        }
    }
}
