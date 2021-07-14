using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_My_Cab
{
    public class Customer
    {
        public string pickupLocation { get; set; }
        public string destinationLocation { get; set; }
        public long mobileNo { get; set; }
        public string emailId { get; set; }
        public string name {get; set; }
        public decimal totalFare { get; set; }
    }
}