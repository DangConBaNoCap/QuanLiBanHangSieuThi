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
            txtManv.Enabled = false;
            txtTennv.Enabled = false;
            cboGt.Enabled = false;
            txtDiachi.Enabled = false;
            txtSdt.Enabled = false;
            txtTendn.Enabled = false;
            txtMk.Enabled = false;
            
            btnThem.Enabled = true;
            btnSua.Enabled = true;
            btnXoa.Enabled = true;
            btnLuu.Enabled = false;
        }
        void modk()
        {
            txtManv.Enabled = true;
            txtTennv.Enabled = true;
            cboGt.Enabled = true;
            txtDiachi.Enabled = true;
            txtSdt.Enabled = true;
            txtTendn.Enabled = true;
            txtMk.Enabled = true;

            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnLuu.Enabled = true;
        }
        void gannull()
        {
            txtManv.Text = "";
            txtTennv.Text = "";
            cboGt.Text = "";
            txtSdt.Text = "";
            txtDiachi.Text = "";
            txtMk.Text = "";
            txtTendn.Text = "";

        }
        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            dgvNhanvien.DataSource = nv.HienThiNhanVien("");
            khoadk();
        }

        bool them;

        private void btnThem_Click_1(object sender, EventArgs e)
        {
            modk();
            gannull();
            them = true;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            modk();
            txtManv.Enabled = false;
            them = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            en_nv.MaNV = txtManv.Text;
            en_nv.TenNV = txtTennv.Text;
            en_nv.GT = cboGt.Text;
            en_nv.DiaChi = txtDiachi.Text;
            en_nv.SDT = txtSdt.Text;
            en_nv.TenDangNhap = txtTendn.Text;
            en_nv.MatKhau = txtMk.Text;
            if (them == true)
            {
                if (txtManv.Text != "")
                {
                    try
                    {
                        nv.ThemNhanVien(en_nv);
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

        private void txtTim_TextChanged(object sender, EventArgs e)
        {
           dgvNhanvien.DataSource= nv.TimNhanVien(txtTim.Text);
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                en_nv.MaNV = txtManv.Text;
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


        private void dgvNhanvien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtManv.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column1"].Value.ToString();
            txtTennv.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column2"].Value.ToString();
            cboGt.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column3"].Value.ToString();
            txtDiachi.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column4"].Value.ToString();
            txtSdt.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column5"].Value.ToString();
            txtTendn.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column6"].Value.ToString();
            txtMk.Text = dgvNhanvien.Rows[e.RowIndex].Cells["Column7"].Value.ToString();
        }

    }
}
