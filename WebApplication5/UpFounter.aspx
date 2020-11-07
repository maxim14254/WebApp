<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpFounter.aspx.cs" Inherits="WebApplication5.UpFounter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
	 input
	{
        font-size:20px;
		margin-top: 2px;
	}

	    .auto-style1 {
            width: 306px;
            height: 173px;
            border:2px solid black;
            margin: 0 auto;
            font-size:20px;
        }

	    .auto-style2 {
            margin-top: 21px;
        }

	</style>
	<script>
        var b1 = true;
        var b2 = true;
        function proverka(input)
        {
            var value = input.value;
            var rep = /[-\.;":'a-zA-Zа-яА-Я]/;
			if (rep.test(value))
			{
                value = value.replace(rep, '');
                input.value = value;
            }
            if (value != '')
            {
                b1 = true;
                block();
            }
            else
            {
                b1 = false;
                block();
            }
        }

        function block1(input)
        {
            var value = input.value;
            if (value != '')
            {
                b2 = true;
                block();
            }
            else {
                b2 = false;
                block();
            }
        }

        function block()
        {
            if (b1 && b2) {
                document.getElementById('Button1').removeAttribute('disabled');
            }
            else {
                document.getElementById('Button1').setAttribute('disabled', 'disabled');
            }
        }

        function ready() {
            document.getElementById('INN').value = <%=inn%>;
            document.getElementById('Name').value = '<%=fio%>'
        }

        document.addEventListener("DOMContentLoaded", ready);
    </script>
</head>
<body>
    <h2 align="center">Изменение учредителя</h2>
    <br/>
    <form id="form1" runat="server">
        <div class="auto-style1" >
        <br/>
        
        <table class = "t1">
			<tr>
				<td class="auto-style2">ИНН:</td>
				<td> <input type="text" runat="server" id="INN" onkeyup="proverka(this);" /> </td>
			</tr>
			<tr>
				<td class="auto-style2">ФИО:</td>
				<td><input type="text" runat="server" id="Name" onkeyup="block1(this);" /> </td>

			</tr>
		</table>

        <asp:Button ID="Button1" runat="server" Text="ОК" Width="144px" style="margin-left: 21px; " OnClick="Button1_Click"  CssClass="auto-style2"/>

    </div>
    </form>
</body>
</html>
