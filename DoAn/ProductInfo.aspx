<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithAnotherMenu.Master" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="DoAn.ProductInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/cssProductInfoForm.css" rel="stylesheet" />
    <title>Chi Tiết Sản Phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    <h1 style="text-align: center;margin-top:100px">Let's Make An Order</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <div class="outer">
                <div class="image">
                    <asp:Image ID="Image1" Style="max-height: 500px;width: 350px;border-radius:10px 10px 10px 10px" runat="server" ImageUrl='<%# "~/Image/" + Eval("HINHANH")%>' />
                </div>
                <div class="thongtin">
                    <div class="info">
                        <div class="quantity">
                            <h4 style="margin-top: 20px; float: left">Số lượng (KG): </h4>
                            <asp:DropDownList CssClass="droplist" ID="DropDownList1" runat="server">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:Button ID="btnAddToCart" CssClass="btnaddtocart" runat="server" Text="Thêm vào giỏ" OnClick="btnAddToCart_Click" CommandArgument='<%#Eval("MAHANG") %>' />
                        </div>
                        <div class="Cart">
                            <asp:LinkButton ID="btnCartView" CssClass="btncartview" runat="server" OnClick="btnCartView_Click">Xem giỏ hàng</asp:LinkButton>
                        </div>
                    </div>
                    <div class="info">
                        <h4>Tên Sản Phẩm:</h4>
                        <asp:Label ID="tenHang" runat="server" Text='<%#Eval("TENHANG") %>'></asp:Label>
                    </div>
                    <div class="info">
                        <h4>Mô Tả:</h4>
                        <label id="moTa"><%#Eval("MOTA") %></label>
                    </div>
                    <div class="info">
                       <h4>Đặt hàng ngay, với:</h4> <asp:Label runat="server" id="donGia" Text='<%#Eval("DONGIA","{0:0,0}") %>'>  </asp:Label>
                    </div>
                    
                </div>
            </div>
        </ItemTemplate>

    </asp:DataList>
</asp:Content>
