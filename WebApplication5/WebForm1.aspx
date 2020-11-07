<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="height: 146px; margin: 2% auto; border:2px solid black; width: 446px;">
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Height="58px" Text="Добавить" Width="206px" OnClick="Button1_Click"  style="margin-left: 10px; margin-top: 10px;" />
        <asp:Button ID="Button2" runat="server" Height="58px" Text="Удалить" Width="206px" style="margin-left: 10px" OnClick="Button2_Click" /><br/>

        <asp:Button ID="Button3" runat="server" Height="58px" Text="Чтение и редактирование" Width="421px" style="margin-top: 10px; margin-left: 10px;" OnClick="Button3_Click" />


        


        <br />


    </form>
</body>
</html>
