using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication5.Controllers;

namespace WebApplication5
{
    public partial class UpFounter : System.Web.UI.Page
    {
        public static int inn;
        public static string fio;
        public static int IdClient;
        protected void Page_Load(object sender, EventArgs e)
        {   // получакм данные введеные на странице FounterAll/Index
            inn = Convert.ToInt32(Request.QueryString["inn"]);
            fio = Request.QueryString["name"];
            IdClient= Convert.ToInt32(Request.QueryString["id"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Client client;
            using (var context = new MyDbContext())
            {
                client = context.Clients.First(c => c.Id == IdClient);// находим клиента по id
                Founder founder = context.Founders.First(c => c.INN == inn);// находим учредителя по ИНН
                // изменям данные об учредителе
                founder.INN = Convert.ToInt32(INN.Value);
                founder.FIO = Name.Value;
                founder.DateUpdate = DateTime.Now;

                context.SaveChanges();// сохоаняем данные в БД

            }
           
            Response.Redirect(String.Format("{0}/FounterAll/Index?Nameclient={1}&id={2}", WriteAllController.domainName, client.Name, IdClient));// переходим назад на страницу FounterAll/Index
        }
    }
}