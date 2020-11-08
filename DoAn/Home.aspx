<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DoAn.WebForm1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Trang Chủ</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="CSS/cssHome.css" rel="stylesheet" />    
    <div class="product1">
        <div class="image" style="height: 600px">
            <img src="Image/tom.jpg" style="height: 600px; border-radius:5px 0 0 5px" />
        </div>
        <div class="info" style="margin-right:130px">
            <asp:Button CssClass="btn1" ID="btnOrderTom" runat="server" CommandArgument='<%#Eval("MALOAI") %>' Text="Đặt hàng ngay" OnClick="btnOrderTom_Click" />
            <br />
            <h2>Có thể bạn chưa biết</h2>
            <a>Nên bỏ vỏ khi ăn tôm.
               Vỏ tôm tuy cứng nhưng gần như không hề canxi. 
               <br /><br />
               Lý do vỏ tôm cứng là do có thành phần chính là kitin (chitin) -
               một dạng polymer cấu thành lớp vỏ cho phần lớn các loài giáp xác, 
               vỏ của một số loài tôm tương đối khó tiêu hóa.
               <br /><br />
               Trong khi đó, nguồn canxi của tôm đến chủ yếu từ thịt tôm, 
               chân tôm và càng tôm (tối với các loài tôm lớn như tôm hùm).
            </a>
        </div>
    </div>
    <div class="product1">
        <div class="infoCa">
            <h2 style="margin-bottom: 10px; margin-top: 30px">Một số lợi ích khi ăn cá</h2>
            <a>Cá là một trong những thực phẩm lành mạnh chứa nhiều dưỡng chất thiết 
                yếu cho cơ thể như protein,
                vitamin D… Không những thế, cá còn là nguồn cung cấp axit béo omega-3 –
                chất béo quan trọng đối với cơ thể và bộ não của con người. </a>
        </div>
        <div class="image" style="height: 780px; float: right">
            <img src="Image/ca.png" style="height: 780px; border-radius:0 0 5px 0"" />
        </div>
        <div class="infoBodyCa">
            <h4>Làm giảm nguy cơ đau tim và đột quỵ</h4>
            <a>Một nghiên cứu được quan sát trên 40.000 đàn ông Hoa Kỳ cho thấy rằng
                những người thường xuyên bổ sung cá trong bữa ăn hằng ngày 
                sẽ có nguy cơ mắc bệnh tim thấp hơn đến 15%.</a>
        </div>
        <div class="infoBodyCa">
            <h4>Tăng cường sức khỏe não bộ</h4>
            <a>Tuổi tác càng tăng, chức năng hoạt động của não càng suy giảm,
                gây ra các vấn đề suy nhược thần kinh nhẹ cho đến các bệnh
                thoái hóa thần kinh nghiêm trọng như Alzheimer.
                Nhiều nghiên cứu cho thấy rằng việc ăn cá 
                thường xuyên làm chậm tốc độ suy nhược thần kinh.</a>
        </div>
        <div class="infoBodyCa">
            <h4>Ngăn ngừa và điều trị trầm cảm</h4>
            <a>Trầm cảm là bệnh rối loạn tinh thần phổ biến ở người với 
                các biểu hiện đặc trưng như suy giảm tâm trạng, năng lượng và chán nản với cuộc sống.
                Trầm cảm hiện nay là một trong những vấn đề sức khỏe đáng lo ngại nhất thế giới.</a>
            <br /><br />
            <a>Nghiên cứu đã phát hiện ra rằng lợi ích của cá có thể 
                làm giảm nguy cơ bị trầm cảm. Do axit béo omega-3 có tác
                dụng chống trầm cảm và hỗ trợ trong việc điều trị chứng bệnh này.
                Ngoài ra, hoạt chất này còn giúp cải thiện 
                các bệnh tâm lý khác như rối loạn lưỡng cực.</a>
        </div>
        <asp:Button CssClass="btn2" ID="btnOrderCa" CommandArgument='<%#Eval("MALOAI") %>' OnClick="btnOrderCa_Click" runat="server" Text="Đặt hàng ngay" />
    </div>
    <div class="product1">
        <div style="height: 560.5px">
            <div class="image" style="height: 510px; float: left">
                <img src="Image/muc.jpg" style="border-radius:6px 0 0 6px" />
            </div>
            <div class="infoMuc">
                <h2>Sự thật thú vị về mực</h2>
                <a>Mực Sepia được chế tạo từ chất của con mực.</a>
                <br /><br />
                <a>Họa sỹ Rembrandt và Da Vinci đều dùng mực Sepia để vẽ các tác phẩm của họ.</a>
                <br /><br />
                <a>Mực của các loài động vật thân mềm được thêm vào để tạo 
                    màu cho các món ăn như pasta, cá, cơm, và nó có vị mặn nếu cho nhiều</a>
            </div>
            <asp:Button CssClass="btn1" ID="btnOrderMuc" CommandArgument='<%#Eval("MALOAI") %>' OnClick="btnOrderMuc_Click" runat="server" Text="Đặt hàng ngay" />
        </div>
    </div>
    <div class="product1" style="height:659.5px">
        <div class="infoCa">
            <h2 style="margin-bottom: 5px; margin-top: 30px">Một số lợi ích khi ăn cá</h2>
            <a>Cá là một trong những thực phẩm lành mạnh chứa nhiều dưỡng chất thiết 
                yếu cho cơ thể như protein,
                vitamin D… Không những thế, cá còn là nguồn cung cấp axit béo omega-3 –
                chất béo quan trọng đối với cơ thể và bộ não của con người. </a>
        </div>
        <div class="image" style="height: 500px; float: right">
            <img src="Image/cua.jpg" style="height: 500px; display:inline-block; border-bottom-right-radius:6px" />
        </div>
        <div class="infoBodyCa">
            <h4>Làm giảm nguy cơ đau tim và đột quỵ</h4>
            <a>Một nghiên cứu được quan sát trên 40.000 đàn ông Hoa Kỳ cho thấy rằng
                những người thường xuyên bổ sung cá trong bữa ăn hằng ngày 
                sẽ có nguy cơ mắc bệnh tim thấp hơn đến 15%.</a>
        </div>
        <div class="infoBodyCa">
            <h4>Tăng cường sức khỏe não bộ</h4>
            <a>Tuổi tác càng tăng, chức năng hoạt động của não càng suy giảm,
                gây ra các vấn đề suy nhược thần kinh nhẹ cho đến các bệnh
                thoái hóa thần kinh nghiêm trọng như Alzheimer.
                Nhiều nghiên cứu cho thấy rằng việc ăn cá 
                thường xuyên làm chậm tốc độ suy nhược thần kinh.</a>
        </div>
        <asp:Button CssClass="btn2" ID="Button1" CommandArgument='<%#Eval("MALOAI") %>' OnClick="btnOrderCua_Click" runat="server" Text="Đặt hàng ngay" />
    </div>
</asp:Content>

