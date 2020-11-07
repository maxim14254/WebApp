using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace WebApplication5.Controllers
{
    public class WriteAllController : Controller
    {
        // GET: WriteAll
        public static List<Client> clients;
        public static string domainName = System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);// получаем доменное имя
        public ActionResult Index()
        {
            using (var context = new MyDbContext())
            {
                clients = context.Clients.ToList();// добавляем всех клиентов в массив               
            }
            return View();
            
        }
    }

}