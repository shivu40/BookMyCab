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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select BookingDate,BookingTime,PickupLocation,DestinationLocation,RideStatus,Fare,Distance,driver.Name as [Driver Name] ,cab.RegistrationNo as [Cab No],Cab.ModelName as [Cab Model] from books,driver,Cab where books.DriverId=driver.EmailId and driver.CabId=Cab.RegistrationNo and CustomerId=@id;", con);
                cmd.Parameters.AddWithValue("@id",Session["userEmailId"].ToString());
                con.Open();
                custRides.DataSource = cmd.ExecuteReader();
                custRides.DataBind();
            }
        }
    }
}