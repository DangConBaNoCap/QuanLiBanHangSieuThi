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
    public partial class frmKhachHang : Form
    {
        public frmKhachHang()
        {
            InitializeComponent();
        }
        KhachHangBus kh = new KhachHangBus();
        KhachHangEntity en_kh = new KhachHangEntity();
        void khoadk()
        {

            txtMaKH.Enabled = false;
            txtTenKH.Enabled = false;
            cboGT.Enabled = false;
            txtDiachi.Enabled = false;
            txtSDT.Enabled = false;
            txtGhiChu.Enabled = false;
            cboLoaiKH.Enabled = false;

            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnLuu.Enabled = false;

        }
        void modk()
        {

            txtMaKH.Enabled = true;
            txtTenKH.Enabled = true;
            cboGT.Enabled = true;
            txtDiachi.Enabled = true;
            txtSDT.Enabled = true;
            txtGhiChu.Enabled = true;
            cboLoaiKH.Enabled = true;

            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;

        }

        void gannull()
        {
            txtMaKH.Text = "";
            txtTenKH.Text = "";
            cboGT.Text = "";
            txtSDT.Text = "";
            txtDiachi.Text = "";
            txtGhiChu.Text = "";


        }

        private void frmKhachHang_Load(object sender, EventArgs e)
        {
            dgvKhachhang.DataSource = kh.HienThiKhachHang("");
            khoadk();
        }

        bool them;
        private void btnThem_Click(object sender, EventArgs e)
        {
            modk();
            them = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            modk();
            them = false;
            txtMaKH.Enabled = false;
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            en_kh.MaKH = txtMaKH.Text;
            en_kh.TenKH = txtTenKH.Text;
            en_kh.GT = cboGT.Text;
            en_kh.DiaChi = txtDiachi.Text;
            en_kh.SDT = txtSDT.Text;
            en_kh.LoaiKH = cboLoaiKH.Text;
            en_kh.GhiChu = txtGhiChu.Text;

            if (them == true)
            {
                if (txtMaKH.Text != "")
                {
                    try
                    {
                       kh.ThemKhachHang(en_kh);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
                else
                {
                    MessageBox.Show("ban chua nhap manv");
                }
            }
            else
            {
                try
                {
                   kh.SuaKhachHang(en_kh);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            khoadk();
            dgvKhachhang.DataSource = kh.HienThiKhachHang("");
            gannull();

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                en_kh.MaKH = txtMaKH.Text;
                kh.XoaKhachHang(en_kh);
            }
            catch (Exception ex)
            {
                MessageBox.Show("lỗi " + ex.Message);
            }
            gannull();
            khoadk();
            dgvKhachhang.DataSource = kh.HienThiKhachHang("");
        }

        private void dgvKhachhang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaKH.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column1"].Value.ToString();

            txtTenKH.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column2"].Value.ToString();
            cboGT.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column3"].Value.ToString();
            txtDiachi.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column4"].Value.ToString();
            txtSDT.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column5"].Value.ToString();
            cboLoaiKH.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column6"].Value.ToString();
            txtGhiChu.Text = dgvKhachhang.Rows[e.RowIndex].Cells["Column7"].Value.ToString();
        }

       
    }
}
