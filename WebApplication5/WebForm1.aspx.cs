using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)// кнопка создание клиента
        {
            Response.Redirect("Create.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)// кнопка удаления клиента
        {
            Response.Redirect("Delete.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)// кнопка вывода и редактирования БД
        {
            Response.Redirect("WriteAll");
        }
    }
}