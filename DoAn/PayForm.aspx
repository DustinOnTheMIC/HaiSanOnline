<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PayForm.aspx.cs" Inherits="DoAn.PayForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/cssPayForm.css" rel="stylesheet" />
    <title>Giỏ Hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <div class="intro">
        <h3>Đơn Hàng</h3>
    </div>
    <div class="bill">
        <asp:GridView ID="GridView" CssClass="gridview" GridLines="None" runat="server" AutoGenerateColumns="False" Width="1100px">
            <Columns>
                <asp:TemplateField HeaderText="Mã Hàng">
                    <ItemTemplate>
                        <asp:LinkButton ID="lblMaHang" OnClick="lblMaHang_Click1" CausesValidation="false" CommandArgument='<%#Eval("MAHANG") %>' runat="server"><%#Eval("MAHANG") %></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ảnh">
                    <ItemTemplate>
                        <asp:Image Style="height: 150px; border-radius: 8px 8px 8px 8px" ID="Image1" ImageUrl='<%#"~/Image/"+Eval("HINH") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Tên hàng" DataField="TENHANG" />
                <asp:TemplateField HeaderText="Số lượng">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server"  OnDataBound="DropDownList1_DataBound">
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Đơn giá">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DONGIA","{0:0,0}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DONGIA","{0:0,0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Chọn">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>


            </Columns>
        </asp:GridView>
        <div>
            <asp:Button CssClass="btnReturn" ID="btnReturn" CausesValidation="false" runat="server" Text="Trả hàng" OnClick="btnReturn_Click" />
        </div>
        <div>
            <asp:Label CssClass="lbl2" ID="lbl" runat="server"></asp:Label>
        </div>
    </div>

    <div class="payform">
        <h3>Thông Tin Giao Hàng</h3>
        <div class="form1">
            <div class="rowone">
                <h5>Địa chỉ nhận:</h5>
                <asp:TextBox CssClass="textbox" ID="tbAddress" runat="server"></asp:TextBox>
            </div>
            <div class="rowtow">

                <h5>Số điện thoại:</h5>
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <asp:TextBox CssClass="textbox" ID="tbPhoneNumber" Width="445px" runat="server" Text='<%#Eval("SDT") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:DataList>

            </div>
            <div class="rowthree">
                <h5 style="text-align: left">Ghi chú:</h5>
                <asp:TextBox CssClass="textbox" ID="tbNote" runat="server"></asp:TextBox>
            </div>
            <div class="validator">
                <div>
                    <asp:RequiredFieldValidator CssClass="onevalidator" ID="vali1" runat="server" ErrorMessage="Vui lòng điền địa chỉ" ControlToValidate="tbAddress"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblSDT" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="btn">
                <asp:Button CssClass="btnbuy" ID="btnBuyNow" runat="server" Text="Buy Now" OnClick="btnBuyNow_Click" />
            </div>
        </div>
    </div>
</asp:Content>
