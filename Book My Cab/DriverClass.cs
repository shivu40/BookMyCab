using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_My_Cab
{
    public class DriverClass
    {
       
       public string EmailId { get; set; }
        public string Name{get;set;}
        public long MobileNo{get;set;}
        
        public string RegistrationNo{get;set;}
        public string ModelName{get;set;}
    }
    public class Location
    { 
        public decimal lat { get; set; }
        public decimal lng { get; set; }
    }
}