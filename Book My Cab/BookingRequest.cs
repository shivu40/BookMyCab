using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_My_Cab
{
    public class BookingRequest
    {
        public string pickupLocation { get; set; }
        public string destinationLocation { get; set; }
        public string customerId { get; set; }
        public string name { get; set; }
        public decimal totalFare { get; set; }
        public decimal distance { get; set; }
    }
}