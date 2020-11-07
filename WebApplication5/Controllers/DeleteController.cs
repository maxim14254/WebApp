using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication5.Controllers
{
    public class DeleteController : Controller
    {
        // GET: Default
        public void Index(int id)
        {
            using (var context = new MyDbContext())
            {
                List<Founder> founders = new List<Founder>();
                Client client = context.Clients.First(c => c.Id == id);// находим клиета по id

                foreach (Founder founder in context.Founders)// перебираем всех учредителей у этого клиента
                {
                    if(founder.ClientId == id)
                    {
                        founders.Add(founder);// сохраняем их  в массив
                    }
                }
                context.Founders.RemoveRange(founders);// удаляем учредителей
                context.Clients.Remove(client);// удаляем клиетна
                context.SaveChanges();// сохраняем изменения
            }
            Response.Redirect("WebForm1.aspx");// возвращаемся на главную страницу
        }
    }
}