using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class ADTool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_QLTK.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_QLSP.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_QLK.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_ThongKe.aspx");
        }
    }
}