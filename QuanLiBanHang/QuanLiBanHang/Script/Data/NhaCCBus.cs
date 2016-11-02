using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace QuanLiBanHang.Data
{
    class NhaCCBus
    {
        KetNoiCSDL con = new KetNoiCSDL();
        public DataTable HienThiKhachHang(string dk)
        {
            return con.GetDataTable(@"SELECT *FROM NHACUNGCAP" + dk);
        }
    }
}
