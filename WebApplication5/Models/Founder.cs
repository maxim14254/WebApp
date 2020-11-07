using System;
using System.ComponentModel.DataAnnotations;


namespace WebApplication5
{
    public class Founder
    {
        public int Id { get; set; }
        public int INN { get; set; }
        public string FIO { get; set; }
        public DateTime DateCreate { get; set; }
        public DateTime? DateUpdate { get; set; }
        public int ClientId { get; set; }
    }
}