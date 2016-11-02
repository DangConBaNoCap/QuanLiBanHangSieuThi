using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
//using QuanLiBanHang.Data;
using QuanLiBanHang.Entity;
namespace QuanLiBanHang.Data
{
   public class SanPhamBus
    {
        KetNoiCSDL con = new KetNoiCSDL();

        public DataTable HienThiSanPham(string dk)
        {

            return con.GetDataTable(@"SELECT *FROM SANPHAM" + dk);
        }

        public void ThemSanPham(SanPhamEntity nv)
        {

            KetNoiCSDL.MoKetNoi();
            string sql = "INSERT INTO SANPHAM(MaSP, TenSP,MaLH,SoLuong,GiaNhap,GiaBan,MoTa,NSX,HinhAnh,NhaCC) VALUES(@MaSP,@TenSP,@MaLH,@SoLuong,@GiaNhap,@GiaBan,@MoTa,@NSX,@HinhAnh,@NhaCC)";
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MaSP", nv.MaSP);
            cmd.Parameters.AddWithValue("@TenSP", nv.TenSP);
            cmd.Parameters.AddWithValue("@MaLH", nv.MaLH);
            cmd.Parameters.AddWithValue("@SoLuong", nv.SoLuong);
            cmd.Parameters.AddWithValue("@GiaNhap", nv.GiaNhap);
            cmd.Parameters.AddWithValue("@GiaBan", nv.GiaBan);
            cmd.Parameters.AddWithValue("@MoTa", nv.MoTa);
            cmd.Parameters.AddWithValue("@NSX", nv.NSX);
            cmd.Parameters.AddWithValue("@HinhAnh", nv.HinhAnh);
            cmd.Parameters.AddWithValue("@NhaCC", nv.NhaCC);
            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }

        public void SuaSanPham(SanPhamEntity nv)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = "UPDATE SANPHAM SET  TenSP=@TenSP, MaLH =@MaLH, SoLuong =@SoLuong, GiaNhap =@GiaNhap, GiaBan =@GiaBan, MoTa =@MoTa,NSX=@NSX,HinhAnh=@HinhAnh,NhaCC=@NhaCC Where MaSP=@MaSP";

            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TenSP", nv.TenSP);
            cmd.Parameters.AddWithValue("@MaLH", nv.MaLH);
            cmd.Parameters.AddWithValue("@SoLuong", nv.SoLuong);
            cmd.Parameters.AddWithValue("@GiaNHap", nv.GiaNhap);
            cmd.Parameters.AddWithValue("@GiaBan", nv.GiaBan);
            cmd.Parameters.AddWithValue("@MoTa", nv.MoTa);
            cmd.Parameters.AddWithValue("@NSX", nv.NSX);
            cmd.Parameters.AddWithValue("@HinhAnh", nv.GiaBan);
            cmd.Parameters.AddWithValue("@NhaCC", nv.MoTa);
            cmd.ExecuteNonQuery();

            KetNoiCSDL.DongKetNoi();

        }

        public void XoaNhanVien(SanPhamEntity nv)
        {
            KetNoiCSDL.MoKetNoi();
            string sql = @"DELETE SANPHAM WHERE MaSP=@MaSP";
            SqlCommand cmd = new SqlCommand(sql, KetNoiCSDL.connect);
            cmd.Parameters.AddWithValue("@MaSP", nv.MaSP);
            cmd.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }
      
    }
}
