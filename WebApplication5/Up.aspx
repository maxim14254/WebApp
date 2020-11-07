<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Up.aspx.cs" Inherits="WebApplication5.Up" %>

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

	    .auto-style1 
        {
            width: 390px;
            height: 187px;
            border:2px solid black; 
            margin: 0 auto;
            font-size:20px;
        }
        .auto-style2 {
            width: 145px;
        }
        </style>
    <script>
        var b1 = true;
        var b2 = true;// переменные для блокировки кнопки (когда не все поля заполнены)
        function proverka(input)// функция проверки ввода в поле ИНН (onkeyup)
        {
            var value = input.value;
            var rep = /[-\.;":'a-zA-Zа-яА-Я]/;
            if (rep.test(value))// сравниваем данные с поле ИНН с буквами
			{
                value = value.replace(rep, '');// очищаем поле ИНН
                input.value = value;
            }
            if (value != '')// если поле ИНН пустое блокируем кнопку
            {
                b1 = true;

            }
            else
            {
                b1 = false;

            }
            block();// функция проверки заполенности всех полей
        }

        function block1(input)//функция проверки заполенности поля Наименование (onkeyup)
        {
            var value = input.value;
            if (value != '')
            {
                b2 = true;

            }
            else {
                b2 = false;

            }
            block();
        }

        function block()// функция проверки заполненности всех полей
        {
            if (b1 && b2) {// каждая переменная b отвечает за заполненность определенного поле
               document.getElementById('Button1').removeAttribute('disabled');
         
            }
            else {
                document.getElementById('Button1').setAttribute('disabled', 'disabled');
            }
        }

        function ready() {// функция для автоматического заполнения полей ИНН и Наименование
            document.getElementById('INN').value = <%=inn%>;
            document.getElementById('Name').value = '<%=name%>';
        }

        document.addEventListener("DOMContentLoaded", ready);// вызывам функцию ready при срабатывание события DOMContentLoaded
    </script>
</head>
<body>
    <h2 align="center">Измениние клиента</h2>
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
				<td class="auto-style2">Наименование:</td>
				<td><input type="text" runat="server" id="Name" onkeyup="block1(this);" /> </td>

			</tr>
		</table>

        <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Text="OK" Width="144px" OnClick="Button1_Click" style="margin-left: 12px; margin-top: 24px" />
    </div>
    </form>
</body>
</html>
