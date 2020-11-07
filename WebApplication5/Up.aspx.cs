using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Controllers;

namespace WebApplication5
{
    public partial class Up : System.Web.UI.Page
    {
        public static int inn;
        public static string name;
        public static string type;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            inn = Convert.ToInt32(Request.QueryString["inn"]);// получаем ИНН из строки запроса 
            name = Request.QueryString["name"];// получаем name из из строки запроса 
            type = Request.QueryString["type"];// получаем Тип из из строки запроса
            id = Convert.ToInt32(Request.QueryString["id"]);// получаем id из из строки запроса
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            using (var context = new MyDbContext())
            {
                Client client = context.Clients.First(c => c.Id == id);// находим клиента по id
                client.INN = Convert.ToInt32(INN.Value);// меняет у него ИНН
                client.Name = Name.Value;// меняет у него Имя
                client.DateUpdate = DateTime.Now;// меняет у него дату обновления

                context.SaveChanges();// сохрангяем
            }

            Response.Redirect("WriteAll");
        }
    }
}