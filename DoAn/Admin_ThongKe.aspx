<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_ThongKe.aspx.cs" Inherits="DoAn.Admin_ThongKe" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back" />   
    <div>
        <strong>THỐNG KÊ ĐƠN HÀNG</strong><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center"  BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="193px" Width="633px">
            <Columns>
                <asp:BoundField HeaderText="Mã đơn hàng" DataField="MADH" ItemStyle-Font-Bold="true"/>
                <asp:BoundField HeaderText="Tên đăng nhập" DataField="TENDN"/>
                <%--<asp:BoundField HeaderText="Mã hàng" DataField="MAHANG"/>
                <asp:BoundField HeaderText="Tên hàng" DataField="TENHANG"/>
                <asp:BoundField HeaderText="Đơn giá" DataField="DONGIA"  DataFormatString="{0:0;0}"/>
                <asp:BoundField HeaderText="Số lượng" DataField="SOLUONG"/>--%>
                <asp:BoundField HeaderText="Ngày" DataField="NGAY" HtmlEncode="false" DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField HeaderText="Địa chỉ" DataField="DIACHI"/>                
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <br />
    </div>
    <div>
        <table style="width: 500px;">
            <tr>
                <td>Mã đơn hàng</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Xem chi tiết" OnClick="Button2_Click" />
                </td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Đóng" />
                </td>
            </tr>            
        </table>
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="131px" Width="1090px">
                 <Columns>
                <asp:BoundField HeaderText="Mã đơn hàng" DataField="MADH" ItemStyle-Font-Bold="true"/>
                <asp:BoundField HeaderText="Tên đăng nhập" DataField="TENDN"/>
                <asp:BoundField HeaderText="Mã hàng" DataField="MAHANG"/>
                     <asp:TemplateField HeaderText="Ảnh">
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Image ID="Image1" runat="server" Width="100px" ImageUrl='<%#"~/Image/"+Eval("HINHANH") %>' />
                         </ItemTemplate>
                     </asp:TemplateField>
                <asp:BoundField HeaderText="Tên hàng" DataField="TENHANG"/>
                <asp:BoundField HeaderText="Đơn giá" DataField="DONGIA"  DataFormatString="{0:0,0}"/>
                <asp:BoundField HeaderText="Số lượng" DataField="SOLUONG"/>
                <asp:BoundField HeaderText="Thành tiền"  DataField="THANHTIEN" DataFormatString="{0:0,0}"/>
                <asp:BoundField HeaderText="Ngày" DataField="NGAY" HtmlEncode="false" DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField HeaderText="Địa chỉ" DataField="DIACHI"/>                
            </Columns>
                 <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                 <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                 <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                 <RowStyle BackColor="White" ForeColor="#003399" />
                 <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                 <SortedAscendingCellStyle BackColor="#EDF6F6" />
                 <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                 <SortedDescendingCellStyle BackColor="#D6DFDF" />
                 <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    
</asp:Content>
