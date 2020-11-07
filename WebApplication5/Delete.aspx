<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="WebApplication5.Delete" %>

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
            margin: 0 auto;
            border:2px solid black; 
            font-size:20px;
        }

	    .auto-style2 {
            margin-left: 78px;
            margin-top: 33px;
        }
        .auto-style3 {
            width: 263px;
            margin-left: 18px;
        }

	    .auto-style4 {
            font-family:Arial; 
            font-size:20px; 
        }

	    </style>
</head>
<body onload="Load()">
    <form id="form1" runat="server">
        <h2 align="center">Удаление клиентов</h2>
        <br/>
        <div class="auto-style1"  >
             <br/><br/>
        
            <input type="text" runat="server" id="Name" onkeyup="block1(this);" class="auto-style3" placeholder="ИНН или имя клиента" />

        <asp:Button ID="Button1" runat="server" Text="Удалить" Width="144px" CssClass="auto-style2" OnClick="Button1_Click"/>
         
    </div>
            
				<%for (int i = 0; i < WebApplication5.Delete.clients.Count; i++)// перебираем всех найденных клиентов 
                  {
                %> 
                    <%--выводим полное имя клиента и присваеваем ему запрос на удаление--%>
                   <div style="margin: 0 auto 0 37%; display:inline;"> <a href="https://localhost:44339/Delete?id= <%=WebApplication5.Delete.clients[i].Id %>" class="auto-style4" id="url"><%=WebApplication5.Delete.clients[i].ToString() %><br /></a></div>
                <%
                  }%> 
                <%clients.Clear(); %>
				    
              

        
    </form>
</body>
</html>
