using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace WebApplication5.Controllers
{
    public class FounterAllController : Controller
    {
        public static List<Founder> founters;
        public static string a;
        public static int IdClient;
        public static Client client;
        public static string disabled;

        // GET: FounterAll
        public ActionResult Index(string Nameclient, int id)
        {
            IdClient = id;
            a = Nameclient;
            using (var context = new MyDbContext())
            {
                founters = new List<Founder>();
                foreach (Founder founter in context.Founders)//перебираем всех учредителей по ClientId
                {
                    if (id == founter.ClientId)
                    {
                        founters.Add(founter);// добавляем учредителя в массив 
                    }
                }

                client = context.Clients.First(c => c.Id == id);// находим клиента у по id
               
                disabled = "";// переменная блокировки кнопки Добавить
                if (String.Compare(client.Type, "Юр. лицо") != 0)// кнопка блокируется если тип клиета ИП
                {
                    disabled = "disabled = \"disabled\"";// данная строка присваевается элементу HTML Button2 
                }
            }
            return View();
        }

        public void Get()// активируется при нажатии на кнопку Добавить
        {
            Response.Redirect(String.Format("/Founter.aspx?inn={0}&numb=1&type={1}", client.INN, client.Type)); // переход на страницу добавления учредителя
        }
    }
}