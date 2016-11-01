using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLiBanHang.Entity
{
    class NhanVienEntity
    {
        private string _MaNV;

        public string MaNV
        {
            get { return _MaNV; }
            set { _MaNV = value; }
        }
        private string _TenNV;

        public string TenNV
        {
            get { return _TenNV; }
            set { _TenNV = value; }
        }
        private string _MatKhau;

        public string MatKhau
        {
            get { return _MatKhau; }
            set { _MatKhau = value; }
        }
        private string _GT;

        public string GT
        {
            get { return _GT; }
            set { _GT = value; }
        }
        private string _DiaChi;

        public string DiaChi
        {
            get { return _DiaChi; }
            set { _DiaChi = value; }
        }
        private string _SDT;

        public string SDT
        {
            get { return _SDT; }
            set { _SDT = value; }
        }
        private string _TenDangNhap;
        public string TenDangNhap
        {
          get { return _TenDangNhap; }
          set { _TenDangNhap = value; }
        }
    }
}
