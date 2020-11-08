using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAn
{
    
    public partial class ProductInfo : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        DataTable dataTable;
        string maHang;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            //string tendn = Request.Cookies["TENDN"] != null ? Request.Cookies["TENDN"].Value : "";
            //if (tendn == "")
            //{
            //    Response.Write("<script>alert('Chưa Đăng Nhập');</script>");
            //    //Response.Redirect(Request.Url.AbsoluteUri);
            //    Server.Transfer("LoginForm.aspx");                
            //}
            maHang = Context.Items["MAHANG"] != null ? Context.Items["MAHANG"].ToString() : null;
            if (maHang == null)
            {
                Response.Write("<script>alert('Chưa chọn thực phẩm');</script>");
                Server.Transfer("Product.aspx");
            }
            query = "select * from HANG where MAHANG = '" + maHang + "'";
            try
            {
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, connectionString);
                dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                this.DataList1.DataSource = dataTable;
                this.DataList1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void TaoGio()
        {
            dataTable = new DataTable();
            dataTable.Rows.Clear();
            dataTable.Columns.Add("TENDN", typeof(string));
            dataTable.Columns.Add("MAHANG", typeof(string));
            dataTable.Columns.Add("TENHANG", typeof(string));
            dataTable.Columns.Add("SOLUONG", typeof(int));
            dataTable.Columns.Add("DONGIA", typeof(double));
            dataTable.Columns.Add("HINH", typeof(string));
            Session["GioHangDB"] = dataTable;
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            
            Button add = (Button)sender;
            DataListItem item = (DataListItem)add.Parent;

            string hinh = "";
            //string TENDN = Context.Request.Cookies["TENDN"].Value.ToString();
            string tenHang = ((Label)item.FindControl("tenHang")).Text;
            string donGia = ((Label)item.FindControl("donGia")).Text;
            string maHang = add.CommandArgument.ToString();
            string soLuong = ((DropDownList)item.FindControl("DropDownList1")).SelectedValue;
            bool confirm = false;
            Image image = (Image)item.FindControl("Image1");

            string getUrl = image.ImageUrl.ToString();
            string[] arrListStr = getUrl.Split('/');

            for (int i = 0; i < arrListStr.Length; i++)
            {
                hinh = arrListStr[arrListStr.Length - 1];
            }

            dataTable = (DataTable)Session["GioHangDB"];
            if (dataTable == null) TaoGio();
            //foreach (DataRow dataRow in dataTable.Rows)
            //{
            //    if (dataRow["TENDN"].Equals(TENDN))
            //    {
            //        if (dataRow["MAHANG"].Equals(maHang))
            //        {
            //            dataRow["SOLUONG"] = Convert.ToInt32(soLuong);
            //            confirm = true;
            //            break;
            //        }
            //    }
            //}
            foreach (DataRow dataRow in dataTable.Rows)
            {                
                    if (dataRow["MAHANG"].Equals(maHang))
                    {
                        dataRow["SOLUONG"] = Convert.ToInt32(soLuong);
                        confirm = true;
                        break;
                    }                
            }
            if (!confirm)
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["TENDN"] = null;
                dataRow["MAHANG"] = maHang;
                dataRow["TENHANG"] = tenHang;
                dataRow["SOLUONG"] = soLuong;
                dataRow["DONGIA"] = donGia;
                dataRow["HINH"] = hinh;
                dataTable.Rows.Add(dataRow);
            }
            Session["GioHangDB"] = dataTable;
        }

        protected void btnCartView_Click(object sender, EventArgs e)
        {
            if (Session["GioHangDB"] == null)
            {
                Response.Write("<script>alert('Giỏ Hàng hiện tại đang trống');</script>");                
            }
            Server.Transfer("PayForm.aspx");
        }
    }
}