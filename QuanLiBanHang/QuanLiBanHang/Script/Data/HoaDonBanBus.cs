using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using QuanLiBanHang.Entity;

namespace QuanLiBanHang.Data
{
    class HoaDonBanBus
    {
        KetNoiCSDL con = new KetNoiCSDL();
        public DataTable BangHangHoaBan(string dk)
        {
            return con.GetDataTable(@"SELECT SANPHAM.MaSP, SANPHAM.TenSP, SANPHAM.SoLuong, SANPHAM.GiaBan, SANPHAM.MoTa, NHACUNGCAP.DiaChi "+
                "FROM SANPHAM INNER JOIN NHACUNGCAP ON SANPHAM.NhaCC = NHACUNGCAP.TenNCC"+ dk);
        }
        public void ThemHoaDon(HoaDonBanEntity hd)
        {
            KetNoiCSDL.MoKetNoi();
            string themhd = @"INSERT INTO HOADONBAN(MaHDB, MaKH, MaNV, NgayBan, TongTien) VALUES(@MaHD,@MaKH,@MaNV,@NgayBan,@TongTien)";
            SqlCommand cdm = new SqlCommand(themhd, KetNoiCSDL.connect);
           // cdm.CommandType = CommandType.StoredProcedure;
            cdm.Parameters.AddWithValue("@MaHD", hd.MaHDB);
            cdm.Parameters.AddWithValue("@MaKH", hd.MaKH);
            cdm.Parameters.AddWithValue("@MaNV", hd.MaNV);
            cdm.Parameters.AddWithValue("@NgayBan", hd.NgayBan);
            cdm.Parameters.AddWithValue("@TongTien", hd.TongTien);

            cdm.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();

        }
        public DataTable NhanVien(string dk)
        {
            return con.GetDataTable("SELECT MaNV,TenNV FROM NHANVIEN" + dk);
        }

        public DataTable KhachHang(string dk)
        {
            return con.GetDataTable("SELECT TenKH,MaKH FROM KhachHang" + dk);
        }
        public DataTable ThongtinKhachhang(string dk)
        {
            return con.GetDataTable("SELECT TenKH,DiaChi,SDT,LoaiKH FROM KhachHang " + dk);
        }
        public DataTable ThongtinHanghoa(string dk)
        {
            return con.GetDataTable("SELECT  MaSP,TenSP,GiaBan FROM  SANPHAM " + dk);
        }

    }
}
