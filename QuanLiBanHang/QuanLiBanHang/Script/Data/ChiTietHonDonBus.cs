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
    class ChiTietHonDonBus
    {
        
        public void ThemChiTietHonDon(ChiTietHonDonEntity hd)
        {
            KetNoiCSDL.MoKetNoi();
            string cthd = @"INSERT INTO CHITIETHOADONBAN(MaHD, MaSP, SoLuong, DonGia, ThanhTien) VALUES(@MaHD,@MaSP,@SoLuong,@DonGia,@ThanhTien)";
            SqlCommand cdm = new SqlCommand(cthd, KetNoiCSDL.connect);
            //cdm.CommandType = CommandType.StoredProcedure;
            cdm.Parameters.AddWithValue("@MaHD", hd.MaHD);
            cdm.Parameters.AddWithValue("@MaSP", hd.MaSP);
            cdm.Parameters.AddWithValue("@SoLuong", hd.SoLuong);
            cdm.Parameters.AddWithValue("@DonGia", hd.DonGia);
            cdm.Parameters.AddWithValue("@ThanhTien", hd.ThanhTien);
            cdm.ExecuteNonQuery();
            KetNoiCSDL.DongKetNoi();
        }
    }
}
