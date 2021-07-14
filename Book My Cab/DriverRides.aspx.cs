using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Book_My_Cab
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select Customers.Name as [Customer Name],Customers.MobileNo as [Contact No.],BookingDate,BookingTime,PickupLocation,DestinationLocation,RideStatus,Fare,Distance  from books,Customers where books.CustomerId=Customers.EmailId  and DriverId=@id", con);
                cmd.Parameters.AddWithValue("@id", Session["userEmailId"].ToString());
               
                con.Open();
                DriverRides.DataSource = cmd.ExecuteReader();
                DriverRides.DataBind();
            }
        }
    }
}