using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DoAn
{
    public partial class Admin_ThongKe : System.Web.UI.Page
    {
        Tool tool = new Tool();
        string conn = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            sync();            
        }

        private void sync()
        {
            GridView1.DataSource = tool.GetData("select * from DONHANG");
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("ADTool.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            string mdh = TextBox1.Text;
            if(mdh == "")
            {
                Label1.Text = "Không có đơn hàng này!";
            }
            GridView2.DataSource = tool.GetData("select *, DONHANG.DONGIA*DONHANG.SOLUONG AS THANHTIEN from DONHANG, HANG where DONHANG.MAHANG = HANG.MAHANG and DONHANG.MADH ='" + mdh + "'");
            GridView2.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
        }
    }
}