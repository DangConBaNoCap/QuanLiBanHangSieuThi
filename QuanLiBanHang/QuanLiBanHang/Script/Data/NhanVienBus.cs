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
    class NhanVienBus
    {

        KetNoiCSDL con = new KetNoiCSDL();

        public DataTable HienThiNhanVien(string dk)
        {
       
                return  con.GetDataTable(@"SELECT *FROM NHANVIEN"+ dk);
        }

        public void ThemNhanVien(NhanVienEntity nv)
        {

            KetNoiCSDL.MoKetNoi();
            string sql = "INSERT INTO NHANVIEN(MaNV, MatKhau, TenNV, GT, DiaChi, SDT, TenDangNhap) VALUES(@MaNV,@MatKhau,@TenNV,@GT,@DiaChi,@SDT,@SDT,@TenDn)";
            SqlCommand cmd = new SqlCommand(sql,KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaNV", nv.MaNV);
            cmd.Parameters.AddWithValue("@MatKhau",nv.MatKhau);
            cmd.Parameters.AddWithValue("@TenNV", nv.TenNV);
            cmd.Parameters.AddWithValue("@GT", nv.GT);
            cmd.Parameters.AddWithValue("@DiaChi", nv.DiaChi);
            cmd.Parameters.AddWithValue("@SDT", nv.SDT);
            cmd.Parameters.AddWithValue("@TenDn", nv.TenDangNhap);

            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }

        public void SuaNhanVien(NhanVienEntity nv)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = "UPDATE NHANVIEN SET MatKhau =@MatKhau, TenNV =@TenNV, DiaChi =@DiaChi, GT =@GT, SDT =@SDT, TenDangNhap =@TenDn Where MaNV=@MaNV";
           
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MatKhau", nv.MatKhau);
            cmd.Parameters.AddWithValue("@TenNV",nv.TenNV);
            cmd.Parameters.AddWithValue("@GT", nv.GT);
            cmd.Parameters.AddWithValue("@DiaChi", nv.DiaChi);
            cmd.Parameters.AddWithValue("@SDT", nv.SDT);
            cmd.Parameters.AddWithValue("@TenDn", nv.TenDangNhap);
            cmd.ExecuteNonQuery();

            KetNoiCSDL.DongKetNoi();
           
        }

        public void XoaNhanVien(NhanVienEntity nv)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = @"DELETE NHANVIEN WHERE MaNV=@MaNV";
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.Parameters.AddWithValue("@MaNV", nv.MaNV);
            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }
      

        public DataTable TimNhanVien(string  dk)
        {
            return con.GetDataTable(@"SELECT *FROM NHANVIEN WHERE TenNV LIKE N'%" +dk+"%'");
        }
    }
}
