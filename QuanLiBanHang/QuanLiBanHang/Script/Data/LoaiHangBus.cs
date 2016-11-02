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
    public class LoaiHangBus
    {
        KetNoiCSDL con = new KetNoiCSDL();

        public DataTable HienThiSanPham(string dk)
        {

            return con.GetDataTable(@"SELECT *FROM LOAIHANG" + dk);
        }
    }
}
