<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="WebApplication5.Create" %>

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
            width: 390px;
            height: 253px;
            border:2px solid black; 
            margin: 0 auto;
            font-size:20px;
        }
        .auto-style2 {
            width: 145px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            margin-left: 12px;
            margin-top: 22px;
        }

	</style>
	<script>
        var b1 = false;//
        var b2 = false;// переменные для блокировки кнопки (когда не все поля заполнены)
        var b3 = false;//
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

        function block2(input)//тоже самое, толь для поля Кол-во учредителей (onkeyup)
        {
            var value = input.value;
            var rep = /[-\.;":'a-zA-Zа-яА-Я]/;
            if (rep.test(value)) {
                value = value.replace(rep, '');
                input.value = value;
            }
            if (value != '')
            {
                b3 = true;

            }
            else
            {
                b3 = false;

            }
            block();
        }

        function block()// функция проверки заполненности всех полей
        {
            if (b1 && b2 && b3) {// каждая переменная b отвечает за заполненность определенного поле
               document.getElementById('Button1').removeAttribute('disabled');
         
            }
            else {
                document.getElementById('Button1').setAttribute('disabled', 'disabled');
            }
        }
        function MyBlur(select)//функция автоматического блокирования и присваивания полю Кол-во учредителей значения (onclick)
        {                      // функция активируется после каждого изменения поля Тип
            var value = select.value;
            var a = document.getElementById('Founter');
            if (value == 'ИП')// если пользватель выбрал ИП поле кол-во учредителей заблокируется и ему автоматически присвоется 1
            {  
                a.setAttribute('disabled', 'disabled');
                a.value = '1';
            }
            else
            {
                a.removeAttribute('disabled');
                a.value = '';
            }
            block2(a);// повтовно вызываем функцию проверки заполенности поля Кол-во уредителей, для обновления переменной блокровки поля
        }
    </script>
</head>
<body>
     <h2 align="center">Добавление нового клиента</h2>
    <br/>
<form id="form2" runat="server">
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
			<tr>
				<td class="auto-style2">Тип:</td>
				<td>
					<select name="Type" style="font-size:20px; margin-top: 2px;" class="auto-style3" runat="server" id="Type" onclick="MyBlur(this);" >
                        <option value="Юр. лицо">Юр. лицо</option>
                        <option value="ИП">ИП</option>
					</select>
				</td>
			</tr>
            <tr>
				<td class="auto-style2">Кол-во учредителей:</td>
				<td><input type="text" runat="server" id="Founter" onkeyup="block2(this);" /> </td>
			</tr>
		</table>

        <asp:Button ID="Button1" runat="server" CssClass="auto-style4" Text="Добавить" Width="144px" OnClick="Button1_Click" disabled="disabled" />

    </div>
</form>
</body>
</html>
