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
    public partial class frmBanHang : Form
    {
        public frmBanHang()
        {
            InitializeComponent();
        }
        KetNoiCSDL con = new KetNoiCSDL();
        HoaDonBanBus hd = new HoaDonBanBus();
        HoaDonBanEntity en_hd = new HoaDonBanEntity();
        NhanVienEntity nv = new NhanVienEntity();
        KhachHangEntity kh = new KhachHangEntity();
        ChiTietHonDonBus cthd = new ChiTietHonDonBus();
        ChiTietHonDonEntity en_cthd = new ChiTietHonDonEntity();

       
        DataTable sanpham = new DataTable();
        bool them;
        string masp;
        int xoa,dem = 0;
       
        void khoadk()
        {
            btnBanhang.Enabled = false;
          
            dgvHanghoa.Enabled = false;
            dgvMuahang.Enabled = false;
            btnXoa.Enabled = false;
            btnLammoi.Enabled = false;
         

            txtTenkh.ReadOnly = true;
            txtDiachi.ReadOnly = true;
            txtSdt.ReadOnly = true;
            txtLoaikh.ReadOnly = true;
        }

        void modk()
        {
            btnBanhang.Enabled = true;
          
            dgvHanghoa.Enabled = true;
            dgvMuahang.Enabled = true;
           
            btnXoa.Enabled = true;
            btnLammoi.Enabled = true;
           

            txtTenkh.ReadOnly = true;
            txtDiachi.ReadOnly = true;
            txtSdt.ReadOnly = true;
            txtLoaikh.ReadOnly = true;
        }
        private void frmBanHang_Load(object sender, EventArgs e)
        {
            dgvHanghoa.DataSource = hd.BangHangHoaBan("");
            cboNhanvien.DisplayMember = "TenNV";
            cboNhanvien.ValueMember = "MaNV";
            cboNhanvien.DataSource = hd.NhanVien("");
            cboKhachhang.DisplayMember = "TenKH";
            cboKhachhang.ValueMember = "MaKH";
            cboKhachhang.DataSource =hd.KhachHang("");
            khoadk();
            txtSoluong.Enabled = false;
           
           
        }

        private void dgvMuahang_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            xoa = e.RowIndex;
        }
       
        private void btnXoa_Click(object sender, EventArgs e)
        { 
            sanpham.Rows.RemoveAt(xoa);
        }

        private void cboKhachhang_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ma = cboKhachhang.SelectedValue.ToString();
            DataTable ttkh = hd.ThongtinKhachhang("where MaKH='"+ma.Trim()+"'");
            txtTenkh.Text = ttkh.Rows[0]["TenKH"].ToString();
            txtDiachi.Text = ttkh.Rows[0]["DiaChi"].ToString();
            txtSdt.Text = ttkh.Rows[0]["SDT"].ToString();
            txtLoaikh.Text = ttkh.Rows[0]["LoaiKH"].ToString();
            modk();
        }
        
        
        private void dgvHanghoa_CellClick(object sender, DataGridViewCellEventArgs e)
        {

          if (dem!=0)
           {
             masp = dgvHanghoa.Rows[e.RowIndex].Cells["Column1"].Value.ToString();
             DataTable sanphamban = sanpham.Clone();
            sanphamban = hd.ThongtinHanghoa("Where MaSP='" + masp.Trim() + "'");
            sanphamban.Columns.Add("SoLuong", typeof(int));
            sanphamban.Columns.Add("ThanhTien", typeof(int));
            sanphamban.Rows[0]["SoLuong"] = 1;
            sanphamban.Rows[0]["ThanhTien"] = int.Parse(sanphamban.Rows[0]["SoLuong"].ToString()) * int.Parse(sanphamban.Rows[0]["GiaBan"].ToString());
            DataRow r = sanphamban.Rows[0];
            sanpham.ImportRow(r);
           
           }
            else
           {
            masp = dgvHanghoa.Rows[e.RowIndex].Cells["Column1"].Value.ToString();
            txtSoluong.Enabled = true;
            sanpham = hd.ThongtinHanghoa("Where MaSP='" + masp.Trim() + "'");
            sanpham.Columns.Add("SoLuong", typeof(int));
            sanpham.Columns.Add("ThanhTien", typeof(int));
            sanpham.Rows[0]["SoLuong"] = 1;
            sanpham.Rows[0]["ThanhTien"] = int.Parse(sanpham.Rows[0]["SoLuong"].ToString()) * int.Parse(sanpham.Rows[0]["GiaBan"].ToString());
            dgvMuahang.DataSource = sanpham;
            
           }
           dem++;
           
        }


        private void txtSoluong_TextChanged(object sender, EventArgs e)
        {
            sanpham.Rows[sanpham.Rows.Count - 1]["SoLuong"] = txtSoluong.Text;
            sanpham.Rows[sanpham.Rows.Count - 1]["ThanhTien"] = int.Parse(sanpham.Rows[sanpham.Rows.Count - 1]["SoLuong"].ToString()) * int.Parse(sanpham.Rows[sanpham.Rows.Count - 1]["GiaBan"].ToString());
          
         }

        private void btnLammoi_Click(object sender, EventArgs e)
        {
            for (int i = sanpham.Rows.Count - 1; i >= 0; i--)
                sanpham.Rows.RemoveAt(sanpham.Rows.Count - 1);

        }

        private void btnBanhang_Click(object sender, EventArgs e)
        {
            try
            { 
            int i,tong=0;
            if (sanpham.Rows.Count > 0)
            {
                string mahd = con.SinhMa("HOADONBAN", "HDB");
                en_hd.MaHDB = mahd;
                en_hd.MaKH = cboKhachhang.SelectedValue.ToString();
                en_hd.MaNV = cboNhanvien.SelectedValue.ToString();
                en_hd.NgayBan = DateTime.Today.AddDays(0).ToString();
                for (i = 0; i < sanpham.Rows.Count - 1; i++)
                    tong = tong + int.Parse(sanpham.Rows[i]["ThanhTien"].ToString());
                en_hd.TongTien = tong.ToString();
                hd.ThemHoaDon(en_hd);
               
                for (i = 0; i < sanpham.Rows.Count; i++)
                {
                    en_cthd.MaHD = mahd;
                    en_cthd.MaSP = sanpham.Rows[i]["MaSP"].ToString();
                    en_cthd.DonGia = sanpham.Rows[i]["GiaBan"].ToString();
                    en_cthd.SoLuong = sanpham.Rows[i]["SoLuong"].ToString();
                    en_cthd.ThanhTien = sanpham.Rows[i]["ThanhTien"].ToString();
                    cthd.ThemChiTietHonDon(en_cthd);
                }
                MessageBox.Show("Đã bán hàng");
                dem = 0;
              //  khoadk();
                sanpham.Dispose();
            }
               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

       

       
        
    }
}
