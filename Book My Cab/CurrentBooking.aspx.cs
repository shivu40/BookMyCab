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
    public partial class CurrentBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Response.Write("<script>alert('Please Wait while your cab is booked')</script>");
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Books,Driver,Cab where RideStatus=0 and Books.DriverId=Driver.EmailId and CustomerId=@CustomerId and Driver.CabId=Cab.RegistrationNo", con);
                con.Open();
                cmd.Parameters.AddWithValue("@customerId", Session["userEmailId"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    BookingStatus.Text = "";

                    while (dr.Read())
                    {
                        BookingRequestId.Text = dr["BookingRequestId"].ToString();
                        DriverName.Text = dr["Name"].ToString();
                        ContactNo.Text = dr["MobileNo"].ToString();
                        VehicleNo.Text = dr["RegistrationNo"].ToString();
                        VehicleName.Text = dr["ModelName"].ToString();
                        TotalFare.Text = dr["Fare"].ToString();
                        
                    }

                }
                else
                {
                    BookingStatus.Text = "No Current Bookings are available";
                    BookingRequestId.Text = "";
                    DriverName.Text = "";
                    ContactNo.Text = "";
                    VehicleName.Text = "";
                    VehicleNo.Text = "";
                    TotalFare.Text = "";
                    BookingStatus.Text = "No Current Bookings are available";
                }
            }
        }

        protected void BookingSensor_Tick(object sender, EventArgs e)
        {
             string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Books,Driver,Cab where RideStatus=0 and Books.DriverId=Driver.EmailId and CustomerId=@CustomerId and Driver.CabId=Cab.RegistrationNo", con);
                con.Open();
                cmd.Parameters.AddWithValue("@customerId", Session["userEmailId"].ToString());
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    BookingStatus.Text = "";

                    while (dr.Read())
                    {
                        BookingRequestId.Text = dr["BookingRequestId"].ToString();
                        DriverName.Text = dr["Name"].ToString();
                        ContactNo.Text = dr["MobileNo"].ToString();
                        VehicleNo.Text = dr["RegistrationNo"].ToString();
                        VehicleName.Text = dr["ModelName"].ToString();
                        TotalFare.Text = dr["Fare"].ToString();
                        
                    }

                }
                else
                {
                    BookingStatus.Text = "No Current Bookings are available";
                    BookingRequestId.Text = "";
                    DriverName.Text = "";
                    ContactNo.Text = "";
                    VehicleName.Text = "";
                    VehicleNo.Text = "";
                    TotalFare.Text = "";
                }
            }
        }

        protected void HomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginPage.aspx");
        }
    }
}