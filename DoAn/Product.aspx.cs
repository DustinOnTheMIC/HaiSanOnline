using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class Product : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            string query;
            if (Page.IsPostBack) return;
            if (Context.Items["MALOAI"] == null)
            {
                query = "select * from HANG";
            }
            else
            {
                string maloai = Context.Items["MALOAI"].ToString();
                query = "select * from HANG where MALOAI = '" + maloai + "'";
            }
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

        protected void btnChiTiet_Click(object sender, EventArgs e)
        {
            string TENDN = Context.Request.Cookies["TENDN"] != null ? Context.Request.Cookies["TENDN"].Value : "";
            string mahang = ((LinkButton)sender).CommandArgument;
            Context.Items["MAHANG"] = mahang;
            Context.Items["TENDN"] = TENDN;
            Server.Transfer("ProductInfo.aspx");
        }
    }
}