using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiBanHang.Entity
{
    class HoaDonBanEntity
    {
        private string _MaHDB;

        public string MaHDB
        {
            get { return _MaHDB; }
            set { _MaHDB = value; }
        }
        private string _MaKH;

        public string MaKH
        {
            get { return _MaKH; }
            set { _MaKH = value; }
        }
        private string _MaNV;

        public string MaNV
        {
            get { return _MaNV; }
            set { _MaNV = value; }
        }
        private string _TongTien;

        public string TongTien
        {
            get { return _TongTien; }
            set { _TongTien = value; }
        }
        private string _NgayBan;

        public string NgayBan
        {
            get { return _NgayBan; }
            set { _NgayBan = value; }
        }
    }
}
