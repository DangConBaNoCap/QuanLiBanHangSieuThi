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
    class KhachHangBus
    {
        KetNoiCSDL con = new KetNoiCSDL();
        public DataTable HienThiKhachHang(string dk)
        {
            return con.GetDataTable(@"SELECT *FROM KHACHHANG" + dk);
        }

        public void ThemKhachHang(KhachHangEntity kh)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = @"INSERT INTO KHACHHANG(MaKH, GT, TenKH, DiaChi, SDT, LoaiKH, GhiChu) VALUES(@MaKH,@GT,@TenKH,@DiaChi,@SDT,@LoaiKH,@GhiChu)";
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaKH",kh.MaKH);
            cmd.Parameters.AddWithValue("@GT",kh.GT );
            cmd.Parameters.AddWithValue("@TenKH", kh.TenKH);
            cmd.Parameters.AddWithValue("@DiaChi", kh.DiaChi);
            cmd.Parameters.AddWithValue("@SDT", kh.SDT);
            cmd.Parameters.AddWithValue("@LoaiKH", kh.LoaiKH);
            cmd.Parameters.AddWithValue("@GhiChu", kh.GhiChu);

            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }

        public void SuaKhachHang(KhachHangEntity kh)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = "UPDATE  KHACHHANG SET  TenKH =@TenKH, GT =@GT, DiaChi =@DiaChi, SDT =@SDT, LoaiKH =@LoaiKH, GhiChu =@GhiChu";
           
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaKH", kh.MaKH);
            cmd.Parameters.AddWithValue("@GT", kh.GT);
            cmd.Parameters.AddWithValue("@TenKH", kh.TenKH);
            cmd.Parameters.AddWithValue("@DiaChi", kh.DiaChi);
            cmd.Parameters.AddWithValue("@SDT", kh.SDT);
            cmd.Parameters.AddWithValue("@LoaiKH", kh.LoaiKH);
            cmd.Parameters.AddWithValue("@GhiChu", kh.GhiChu);
            cmd.ExecuteNonQuery();

            KetNoiCSDL.DongKetNoi();
        }
        public void XoaKhachHang(KhachHangEntity Kh)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = @"DELETE KHACHHANG WHERE Makh=@MaKH";
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.Parameters.AddWithValue("@MaKH", Kh.MaKH);
            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }

       
    }
}
