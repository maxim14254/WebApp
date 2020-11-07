using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApplication5
{
    public class Client
    {
        public int Id { get; set; } 
        public int INN { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public DateTime DateCreate { get; set; }
        public DateTime? DateUpdate { get; set; }
        public int FoundersCount { get; set; }
        public override string ToString()
        {
            return String.Format("Id=\"{0}\" ИНН=\"{1}\" Имя=\"{2}\" Тип=\"{3}\"", Id, INN, Name, Type);
        }
    }
}