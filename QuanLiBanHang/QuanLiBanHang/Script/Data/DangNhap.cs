using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace QuanLiBanHang.Data
{
    class DangNhap
    {
        KetNoiCSDL con = new KetNoiCSDL();
        public bool Login(string _name,string _pass)
        {
           string sql= @"select * from NHANVIEN WHERE TenDangNhap = '" + _name + "' AND MatKhau = '" + _pass + "'";
           DataTable dn = con.GetDataTable(sql);
           if (dn.Rows.Count > 0) return true;
           else return false;
        }
    }
}
