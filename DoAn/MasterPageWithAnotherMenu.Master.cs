using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class MasterPageWithAnotherMenu : System.Web.UI.MasterPage
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            string query="select * from LOAIHANG";
            try
            {
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connectionString);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                this.DataList1.DataSource = dataTable;
                this.DataList1.DataBind();
            }catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnLoaiSP_Click(object sender, EventArgs e)
        {
            Context.Items["MALOAI"] = ((LinkButton)sender).CommandArgument;
            Server.Transfer("product.aspx");
        }

        protected void btnPayForm_Click(object sender, EventArgs e)
        {
            string userLogin = Context.Request.Cookies["TENDN"] != null ? Context.Request.Cookies["TENDN"].Value : "";
            Context.Items["TENDN"] = userLogin;
            Server.Transfer("PayForm.aspx");
        }

        protected void btnExit_OnClick1(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
        protected void btnExit_OnClick2(object sender, EventArgs e)
        {
            Panel2.Visible = true;
        }

        protected void btnExit1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string tenDN = tbUserName1.Text;
            string matKhau = tbPassword1.Text;
            string tenKH = tbName.Text;
            string sdt = tbSDT.Text;
            string query = "select * from TAIKHOAN where TENDN = '" + tenDN + "'";

            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connection);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count == 0)
            {
                DangKy(tenDN, matKhau, tenKH, sdt);
                Response.Cookies["TENDN"].Value = tenDN;
                Panel2.Visible = false;
            }
            else
            {
                lblMessage.Text = "Tên đăng nhập đã trùng, vui lòng chọn tên khác";
            }
        }
        protected void DangKy(string tenDN, string matKhau, string tenKH, string sdt)
        {
            SqlConnection sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
            string query = "insert into TAIKHOAN (TENDN, MATKHAU, TENKH, SDT, LOAITK) values ('{0}','{1}','{2}','{3}',2)";
            query = String.Format(query, tenDN, matKhau, tenKH, sdt);
            SqlCommand command = new SqlCommand(query, sqlConnection);
            command.ExecuteNonQuery();
            sqlConnection.Close();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string TENDN = tbUserName.Text;
            string passLogin = tbPassword.Text;
            string query = "select * from TAIKHOAN where TENDN='{0}' and MATKHAU= '{1}'";
            query = String.Format(query, TENDN, passLogin);
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connection);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count == 0)
            {
                Label1.Text = "Sai tên đăng nhập hoặc mật khẩu.";
                return;
            }
            else
            {
                query = "select LOAITK from TAIKHOAN where TENDN = '" + TENDN + "'";
                SqlConnection sql = new SqlConnection(connectionString);
                SqlDataAdapter sqlData = new SqlDataAdapter(query, connection);
                DataTable data = new DataTable();
                sqlDataAdapter.Fill(data);           //Lấy loại tài khoản fill vô data table
                foreach (DataRow dataRow in dataTable.Rows)
                {                                    //Lấy row loại tk trong data table
                    if (dataRow["LOAITK"].Equals(1)) //So sánh với loại tài khoản = 1 (admin)
                    {
                        Response.Cookies["TENDN"].Value = TENDN;
                        Server.Transfer("ADTool.aspx");
                    }
                }
                Response.Cookies["TENDN"].Value = TENDN;
                Response.Redirect(Request.Url.AbsoluteUri);     //Khách vô lại product
            }
            Panel1.Visible = true;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
    }
}