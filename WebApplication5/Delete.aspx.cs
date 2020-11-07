using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Delete : System.Web.UI.Page
    {
        public static List<Client> clients=new List<Client>();
        public static string id;
        public static string inn;
        public static string w;
        public static string type;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string value = Name.Value;// получаем значение введеное в поле 
            using (var context = new MyDbContext())
            {
                try
                {
                    clients = new List<Client>();
                    int INN = Convert.ToInt32(value);
                    clients.Add(context.Clients.First(c => c.INN == INN));// находим клиента в БД по ИНН

                }
                catch
                {
                    clients = new List<Client>();
                    foreach(Client client in context.Clients)// пербираем всех клиентов в БД
                    {
                        if(String.Compare(value, client.Name) == 0)// отбираем всех с именем равным value (потому что одно и тоже имя может быть у нескольких клиентов)
                        {
                            clients.Add(client);// добавляем его в массив
                        }
                    }
                }
            }
        }
    }
}