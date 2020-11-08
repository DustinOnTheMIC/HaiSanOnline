<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ADTool.aspx.cs" Inherits="DoAn.ADTool" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="auto-style2">
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1">Quản lí tài khoản</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="View" OnClick="Button1_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1">Quản lí sản phẩm</td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="View" OnClick="Button2_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1">Quản lí kho</td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="View" OnClick="Button3_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1">Thống kê</td>
            <td>
                <asp:Button ID="Button4" runat="server" Text="View" OnClick="Button4_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 437px;
        }
        .auto-style2 {
            width: 1200px;
        }
    </style>
</asp:Content>

