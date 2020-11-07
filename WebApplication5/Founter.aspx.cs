using System;
using System.Linq;

namespace WebApplication5
{
    public partial class Founter : System.Web.UI.Page
    {
        Client client;
        int numb;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {   // получакм данные введеные на странице Сreate.aspx 
            int inn = Convert.ToInt32(Request.QueryString["inn"]);
            string name = Request.QueryString["name"];
            string type = Request.QueryString["type"];
            numb = Convert.ToInt32(Request.QueryString["numb"]);

            using (var context = new MyDbContext())// подключаемся к БД
            {
                if (String.Compare(name, null) != 0)// условие срабатыват один раз во время первой загрузке страницы
                {
                    client = new Client()//создаем экземпляр Client
                    {
                        INN = inn,
                        Name = name,
                        Type = type,
                        DateCreate = DateTime.Now
                    };
                    context.Clients.Add(client);// добавляем его в БД
                    context.SaveChanges();//сохраняем БД
                }
                else
                {
                    client = context.Clients.First(c => c.INN == inn);// если страница загружается второй и т.д. раз подряд экземпляр Client берем из БД
                }

                Founder founder = new Founder()// создаем экземпляр учредителя
                {
                    INN = Convert.ToInt32(INN.Value),
                    FIO = Name.Value,
                    DateCreate = DateTime.Now,
                    ClientId = client.Id
                };
                context.Founders.Add(founder);// добавляем его в БД
                client.FoundersCount += 1;// 
                context.SaveChanges();
                numb--;
            }
           
            if (numb != 0)// переменна numb это кол-во учредителей введенных на странице Create.aspx 
            {// если она не равнва 0  снова переходи на эту страницу, но без поля name что не сработало условие создание и добавление экземпляра Create.aspx
                Response.Redirect(String.Format("Founter.aspx?inn={0}&numb={1}&type={2}", inn, numb, type));
            }
            else
            {
                Response.Redirect(String.Format("FounterAll/Index?Nameclient={0}&id={1}", client.Name, client.Id));// переходи на страницу простотра всех учредителей
            }
        }
        
    }
}