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
    public partial class frmNhanVien : Form
    {
        public frmNhanVien()
        {
            InitializeComponent();
        }
        NhanVienBus nv = new NhanVienBus();
        NhanVienEntity en_nv = new NhanVienEntity();
        void khoadk()
        {

            txtMaNV.Enabled = false;
            txtTenNV.Enabled = false;
            cboGT.Enabled = false;
            txtDiachi.Enabled = false;
            txtSDT.Enabled = false;
            txtTenDN.Enabled = false;
            txtMK.Enabled = false;
           
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnLuu.Enabled = false;
       
        }
        void modk()
        {

            txtMaNV.Enabled = true;
            txtTenNV.Enabled = true;
            cboGT.Enabled = true;
            txtDiachi.Enabled = true;
            txtSDT.Enabled = true;
            txtTenDN.Enabled = true;
            txtMK.Enabled = true;

            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;

        }

        void gannull()
        {
            txtMaNV.Text = "";
            txtTenNV.Text = "";
            cboGT.Text = "";
            txtSDT.Text = "";
            txtDiachi.Text = "";
            txtTenDN.Text = "";
            txtMK.Text = "";

        }
        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            dgvNhanvien.DataSource = nv.HienThiNhanVien("");
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
            txtMaNV.Enabled = false;
            them = false;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                en_nv.MaNV = txtMaNV.Text;
               nv.XoaNhanVien(en_nv);
            }
            catch (Exception ex)
            {
                MessageBox.Show("lỗi " + ex.Message);
            }
            gannull();
            khoadk();
            dgvNhanvien.DataSource = nv.HienThiNhanVien("");

        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            en_nv.MaNV = txtMaNV.Text;
            en_nv.TenNV = txtTenNV.Text;
            en_nv.GT = cboGT.Text;
            en_nv.DiaChi = txtDiachi.Text;
            en_nv.SDT = txtSDT.Text;
            en_nv.TenDangNhap = txtTenDN.Text;
            en_nv.MK = txtMK.Text;
           
            if (them == true)
            {
                if (txtMaNV.Text != "")
                {
                    try
                    {
                        nv.SuaNhanVien(en_nv);
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
                    nv.SuaNhanVien(en_nv);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            khoadk();
            dgvNhanvien.DataSource = nv.HienThiNhanVien("");
            gannull();
        }

       

      

        private void dgvNhanvien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtMaNV.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column1"].Value.ToString();

            txtTenNV.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column2"].Value.ToString();
            cboGT.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column3"].Value.ToString();
            txtDiachi.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column4"].Value.ToString();
            txtSDT.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column5"].Value.ToString();
            txtTenDN.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column6"].Value.ToString();
            txtMK.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column7"].Value.ToString();
        }

    

      

      

    }
}
