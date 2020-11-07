using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string inn = INN.Value;
            string name = Name.Value;
            string type = Type.Value;
            string i= Founter.Value;// кол-во учредителей
            if (i == "") // условие выполняется если пользователь выбрал ИП
                i = "1";

            Response.Redirect(String.Format("Founter.aspx?inn={0}&name={1}&type={2}&numb={3}", inn, name, type, i));// переход на станицу добавления уредителя для данного клиента


        }
    }
    
}