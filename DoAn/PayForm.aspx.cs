using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class PayForm : System.Web.UI.Page
    {

        string connectionString = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        double tong = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string TENDN = Context.Request.Cookies["TENDN"] != null ? Context.Request.Cookies["TENDN"].Value : "";

            
            if (Page.IsPostBack) return;
            try
            {
                DataTable dataTable = (DataTable)Session["GioHangDB"];
                GridView.DataSource = dataTable;
                GridView.DataBind();

                double tong = 0;
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    
                    double thanhtien = Convert.ToDouble(dataTable.Rows[i]["SOLUONG"]) * Convert.ToDouble(dataTable.Rows[i]["DONGIA"]);
                    tong = tong + thanhtien;
                }
                
                this.lbl.Text = "Tổng cộng: " + tong;
            }
            catch (Exception ex)
            {
                
            }
            
            try
            {

                string query = "Select SDT from TAIKHOAN where TENDN = '"+TENDN+"' ";
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connectionString);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                this.DataList1.DataSource = dataTable;
                this.DataList1.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            string TENDN = Context.Request.Cookies["TENDN"] != null ? Context.Request.Cookies["TENDN"].Value : "";
            
            if (TENDN == "")
            {
                Response.Write("<script>alert('Đăng nhập để mua hàng');</script>");
                return;
            }
            
            SqlCommand sqlCommand;
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            DataTable dataTable = (DataTable)Session["GioHangDB"];
            try
            {
                foreach (DataRow dataRow in dataTable.Rows)
                {
                    string query = "insert into DONHANG (MAHANG, TENDN, TENHANG, DONGIA, SOLUONG, NGAY, DIACHI)" +
                        " values('"+dataRow["MAHANG"]+"','"+TENDN+"','"+dataRow["TENHANG"]+"','"
                        +dataRow["DONGIA"]+"','"+dataRow["SOLUONG"]+"',getdate(),'"+tbAddress.Text+"')";
                    sqlCommand = new SqlCommand(query, sqlConnection);
                    sqlCommand.ExecuteNonQuery();
                }

                sqlConnection.Close();
                Session.Clear();
                Server.Transfer("Home.aspx");

            }
            catch (Exception ex)
            {

            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            DataTable dataTable = (DataTable)Session["GioHangDB"];
            this.GridView.DataSource = dataTable;
            try
            {
                foreach (DataRow dataRow in dataTable.Rows)
                {
                    for (int i = GridView.Rows.Count - 1; i >= 0; i--)
                    {
                        GridViewRow row = GridView.Rows[i];

                        bool isChecked = ((CheckBox)row.FindControl("CheckBox")).Checked;
                        if (((CheckBox)row.FindControl("CheckBox")).Checked)
                        {
                            dataTable.Rows[i].Delete();
                        }
                    }
                    Response.Redirect(Request.RawUrl);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void lblMaHang_Click1(object sender, EventArgs e)
        {
            string maHang = ((LinkButton)sender).CommandArgument.ToString();
            Context.Items["MAHANG"] = maHang;
            Server.Transfer("ProductInfo.aspx");
        }

        

        private void sync()
        {
            DataTable dataTable = (DataTable)Session["GioHangDB"];
            GridView.DataSource = dataTable;
            GridView.DataBind();
            double tong = 0;
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                double thanhtien = Convert.ToDouble(dataTable.Rows[i]["SOLUONG"]) 
                    * Convert.ToDouble(dataTable.Rows[i]["DONGIA"]);
                tong = tong + thanhtien;
            }
            this.lbl.Text = "Tổng cộng: " + tong;
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {

            DataTable dataTable = (DataTable)Session["GioHangDB"];
            DropDownList ddlList = (DropDownList)GridView.FindControl("DropDownList1");
            ddlList.SelectedValue = "2";
            

        }

        protected void DropDownList1_DataBinding(object sender, EventArgs e)
        {

        }
    }
}