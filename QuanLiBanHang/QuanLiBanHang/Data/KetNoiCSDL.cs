using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace QuanLiBanHang.Data
{
    class KetNoiCSDL
    {
         public static SqlConnection connect;
        public static SqlConnection _connect;
       public static string server = QuanLiBanHang.Properties.Settings.Default.QuanLiBanHangConnection.ToString();

        public static bool MoKetNoi()
        {
            if (KetNoiCSDL.connect == null)
            {
                try
                {
                    //XtraMessageBox.Show(server);
                    KetNoiCSDL.connect = new SqlConnection(server);
                }
                catch
                {
                    MessageBox.Show("Không Thể Kết Nối Đến Cơ Sở Dữ Liệu\n", "Cảnh Báo");
                    return false;
                }

            }
            if (KetNoiCSDL.connect.State != ConnectionState.Open)
            {
                KetNoiCSDL.connect.Open();
            }
            return true;
        }

        public static void DongKetNoi()
        {
            try
            {
                if (KetNoiCSDL.connect != null)
                {
                    if (KetNoiCSDL.connect.State == ConnectionState.Open)
                        KetNoiCSDL.connect.Close();
                }
            }
            catch
            {
                MessageBox.Show("Không Thể Đóng Kết Nối", "Cảnh Báo");
            }
        }


        public void ThucThiCauLenhSQL(string strSQL)
        {
            try
            {
                MoKetNoi();
                SqlCommand cmd = new SqlCommand(strSQL, connect);
                cmd.ExecuteNonQuery();
                DongKetNoi();
            }
            catch (Exception e)
            {
                MessageBox.Show("Không Thể Thực Thi SQL, error: " + e.Message, "Cảnh Báo");
            }
        }

        public DataTable GetDataTable(string strSQl)
        {
            MoKetNoi();
            try
            {

                DataTable dt = new DataTable();
                SqlDataAdapter sqlda = new SqlDataAdapter(strSQl, connect);
                sqlda.Fill(dt);
                DongKetNoi();
                return dt;
            }
            catch (Exception e)
            {
                MessageBox.Show("Không Thể Lấy Dữ Liệu, error: " + e.Message, "Cảnh Báo");
                return null;
            }
        }

        public string GetValue(string strSQL)
        {

            try
            {
                string kq = null;

                MoKetNoi();
                SqlCommand cmd = new SqlCommand(strSQL, connect);
                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read())
                {
                    kq = read[0].ToString();
                }
                DongKetNoi();

                return kq;
            }

            catch (Exception e)
            {
                MessageBox.Show("Không Thể Lấy Dữ Liệu\n" + e.Message, "Cảnh Báo");
                return null;
            }

        }

        public SqlDataAdapter GetCmd(string strSQL)
        {
            //MoKetNoi();

            SqlDataAdapter sql = new SqlDataAdapter(strSQL, connect);
            SqlCommandBuilder cmd = new SqlCommandBuilder(sql);

            sql.InsertCommand = cmd.GetInsertCommand();
            sql.UpdateCommand = cmd.GetUpdateCommand();
            sql.DeleteCommand = cmd.GetDeleteCommand();

            return sql;
        }

        public bool KiemTraKetNoi()
        {
            try
            {
                _connect = new SqlConnection(QuanLiBanHang.Properties.Settings.Default.QuanLiBanHangConnection.ToString());
                _connect.Open();
                _connect.Close();
            }
            catch
            {
                MessageBox.Show("Không Thể Kết Nối Đến Cơ Sở Dữ Liệu", "Cảnh Báo");
                return false;
            }
            return true;
        }
        public void TaoBang(string strSQL)
        {
            _connect = new SqlConnection(QuanLiBanHang.Properties.Settings.Default.QuanLiBanHangConnection.ToString());
            try
            {
                _connect.Open();
                SqlCommand cmd = new SqlCommand(strSQL, _connect);
                cmd.ExecuteNonQuery();
                _connect.Close();

            }
            catch (Exception e)
            {
                MessageBox.Show("Không Thể Thực Thi SQL, error: " + e.Message, "Cảnh Báo");
                return;
            }
        }

        public string SinhMa(string table, string tiento)
        {
            DataTable tempTable = new DataTable();
            tempTable = GetDataTable("select * from " + table);

            string kq = "";

            if (tiento == "")
            {
                kq = (int.Parse(tempTable.Rows[tempTable.Rows.Count - 1][0].ToString()) + 1).ToString();
                return kq;
            }

            if (tempTable.Rows.Count > 0)
            {
                string tempStr = tempTable.Rows[tempTable.Rows.Count - 1][0].ToString();

                int i = Convert.ToInt32(tempStr.Substring(tiento.Length));
                i++;
                kq = tiento + i.ToString("0000000");
            }
            else kq = tiento + "00000001";

            return kq;
        }
    }
}
