using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOrderTom_Click(object sender, EventArgs e)
        {
            Context.Items["MALOAI"] = "2";
            Server.Transfer("Product.aspx");
        }

        protected void btnOrderCa_Click(object sender, EventArgs e)
        {
            Context.Items["MALOAI"] = "1";
            Server.Transfer("Product.aspx");
        }

        protected void btnOrderMuc_Click(object sender, EventArgs e)
        {
            Context.Items["MALOAI"] = "3";
            Server.Transfer("Product.aspx");
        }

        protected void btnOrderCua_Click(object sender, EventArgs e)
        {
            Context.Items["MALOAI"] = "4";
            Server.Transfer("Product.aspx");
        }
    }
}