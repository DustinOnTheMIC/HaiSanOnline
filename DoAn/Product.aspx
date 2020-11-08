<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithAnotherMenu.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="DoAn.Product" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <title>Sản Phẩm</title>
    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
    
    <link href="CSS/cssProduct.css" rel="stylesheet" />
    <div class="intro">
        <h1 id="intro" style="text-align: center;margin-top:100px;">You Will Like Our Products</h1>

    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2">
        <ItemTemplate>
            <div style="margin-left: 100px; margin-top: 20px">
                <div class="product">
                    <div class="image">
                        <asp:Image ID="Image1" style="border-radius:8px 0 0 8px;margin-left:-1px" runat="server" CssClass="image1" ImageUrl='<%#"~/Image/"+Eval("HINHANH") %>' />
                    </div>
                    <div class="info">
                        <div class="thongtin">
                            <h3><%#Eval("TENHANG") %></h3>
                        </div>
                        <div class="thongtin">
                            <%#Eval("DONGIA","{0:0,0}") %>
                        </div>
                        <div class="btnChiTiet">
                            <asp:LinkButton ID="btnChiTiet" CssClass="btn1" runat="server" CommandArgument='<%#Eval("MAHANG")%>' OnClick="btnChiTiet_Click">Chi Tiết</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
