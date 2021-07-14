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
    public partial class WebForm4 : System.Web.UI.Page
    {
        public static int BookingRequestId;
        public static int BookingStatus = 0;
        public static int BookingId;
        protected void Page_Load(object sender, EventArgs e)
        {
           
               SalaryCalculator();
           
        }

        protected void SensingRequestTimer_Tick(object sender, EventArgs e)
        {
            if (BookingStatus == 0)
            {

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();

                using (SqlConnection con = new SqlConnection(cs))
                {


                    SqlCommand cmd = new SqlCommand("select * from BookingRequest,Customers where Customers.EmailId=BookingRequest.CustomerId and BookingRequest.Status=0 and BookingRequest.CabType=@CabType", con);
                    cmd.Parameters.AddWithValue("@CabType", DriverCabId());
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        SensingRequestTimer.Enabled = false;

                        while (dr.Read())
                        {
                            BookingRequestId = int.Parse(dr["RequestId"].ToString());
                            pickupLocation.InnerHtml = dr["PickupLocation"].ToString();
                            destinationLocation.InnerHtml = dr["DestinationLocation"].ToString();
                            customerName.InnerHtml = dr["Name"].ToString();
                            contactNumber.InnerHtml = dr["MobileNo"].ToString();
                            totalFare.InnerHtml = dr["TotalFare"].ToString();
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);

                    }


                }
            }
        }

        private void SalaryCalculator()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            decimal salary= 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select sum(DriverShare) as salary from Books where BookingDate=@BookingDate", con);
                cmd.Parameters.AddWithValue("@BookingDate", DateTime.Today);
                con.Open();
                object nullableValue = cmd.ExecuteScalar();
                
                   if(nullableValue!=DBNull.Value)
                    {

                        salary = Convert.ToDecimal(nullableValue.ToString());
                        Earning.Text = salary.ToString();
                    }
                   
                
                
            }
        }

        private int DriverCabId()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            int CabType=0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select Id from [Available Cabs],Driver,Cab where Driver.CabId=Cab.RegistrationNo and Cab.TypeId=[Available Cabs].Id and Driver.EmailId=@DriverId", con);
                cmd.Parameters.AddWithValue("@DriverId", Session["userEmailId"].ToString());
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        CabType = int.Parse(dr["Id"].ToString());
                    }
                }
                return CabType;
            }
          }

        private decimal DriverRate()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            decimal driverRate = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select DriverRatePerKM from [Available Cabs],Driver,Cab where Driver.CabId=Cab.RegistrationNo and Cab.TypeId=[Available Cabs].Id and Driver.EmailId=@DriverId", con);
                cmd.Parameters.AddWithValue("@DriverId", Session["userEmailId"].ToString());
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        driverRate = Convert.ToDecimal(dr["DriverRatePerKM"].ToString());
                    }
                }
                return driverRate;
            }
        }
        protected void acceptButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "hideModal();", true);
            FinishRide.Visible = true;
            BookingStatus = 1;
            decimal DriverShare, CompanyShare;
            
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from BookingRequest where RequestId=@RequestId", con);
                con.Open();
                cmd.Parameters.AddWithValue("@RequestId", BookingRequestId);
                SqlDataReader dr = cmd.ExecuteReader();
                BookingRequest bookingRequest = new BookingRequest();
                if (dr.HasRows)
                {

                   
                    while (dr.Read())
                    {
                        
                        bookingRequest.pickupLocation = dr["PickupLocation"].ToString();
                        bookingRequest.destinationLocation = dr["DestinationLocation"].ToString();
                        bookingRequest.totalFare = Convert.ToDecimal( dr["TotalFare"].ToString());
                        bookingRequest.distance = Convert.ToDecimal(dr["Distance"].ToString());
                        bookingRequest.customerId= dr["CustomerId"].ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('failed')</script>");
                }
                dr.Close();
                //Updating Booking Request Table
                cmd = new SqlCommand("update BookingRequest set Status=1 where RequestId=@RequestId", con);
                cmd.Parameters.AddWithValue("@RequestId", BookingRequestId);
                cmd.ExecuteNonQuery();

                 // Calculating DriverShare and Company Share
                DriverShare = DriverRate() * bookingRequest.distance;
                CompanyShare = bookingRequest.totalFare - DriverShare;


                

                //Inserting Booking Data in Books Table
                cmd = new SqlCommand("insert into Books values(@customerId,@driverId,@bookingTime,@distance,@fare,@bookingDate,@pickupLocation,@destinationLocation,0,@DriverShare,@CompanyShare,@BookingRequestId)", con);
                
                cmd.Parameters.AddWithValue("@customerId", bookingRequest.customerId);
                //cmd.Parameters.AddWithValue("@customerId", "shivamjadhav40@gmail.com");
                cmd.Parameters.AddWithValue("@driverId", Session["userEmailId"].ToString());
                cmd.Parameters.AddWithValue("@bookingTime", DateTime.Now.ToString("HH:mm:ss"));
                cmd.Parameters.AddWithValue("@distance", bookingRequest.distance);
                cmd.Parameters.AddWithValue("@fare", bookingRequest.totalFare);
                cmd.Parameters.AddWithValue("@bookingDate", DateTime.Today);
                cmd.Parameters.AddWithValue("@pickupLocation", bookingRequest.pickupLocation);
                cmd.Parameters.AddWithValue("@destinationLocation", bookingRequest.destinationLocation);
                cmd.Parameters.AddWithValue("@DriverShare", DriverShare);
                cmd.Parameters.AddWithValue("@CompanyShare", CompanyShare);
                cmd.Parameters.AddWithValue("@BookingRequestId", BookingRequestId);
                cmd.ExecuteNonQuery();


                //Inserting Payment
                cmd = new SqlCommand("select BookingId from Books where BookingRequestId=@RequestId", con);
                cmd.Parameters.AddWithValue("@RequestId", BookingRequestId);
                 dr = cmd.ExecuteReader();
                
                if (dr.HasRows)
                {


                    while (dr.Read())
                    {
                        BookingId = Convert.ToInt32(dr["BookingId"].ToString());
                       
                    }
                    
                }
                dr.Close();
                   
                    cmd = new SqlCommand("Insert into Payments values(@DriverId,@Date,@Fare,@DriverPayableAmount,@Distance,0,@BookingId) ", con);
                    cmd.Parameters.AddWithValue("@driverId", Session["userEmailId"].ToString());
                   
                    cmd.Parameters.AddWithValue("@Date", DateTime.Today);
                    cmd.Parameters.AddWithValue("@Fare", bookingRequest.totalFare);
                    cmd.Parameters.AddWithValue("@DriverPayableAmount", DriverShare);
                    cmd.Parameters.AddWithValue("@Distance", bookingRequest.distance);
                    cmd.Parameters.AddWithValue("@BookingId", BookingId);
                    cmd.ExecuteNonQuery();
                
                
                
                //Making the status of the driver busy
                cmd = new SqlCommand("update driver set status=1  where EmailId=@driverId ", con);
                cmd.Parameters.AddWithValue("@driverId", Session["userEmailId"].ToString());
                cmd.ExecuteNonQuery();
                
            }
        }

        protected void showBooking_Click(object sender, EventArgs e)
        {
            if( BookingStatus==0)
            {
                Response.Write("<script>alert('No bookings are Available')</script>");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
            }
        }

        protected void FinishRide_Click(object sender, EventArgs e)
        {
            SalaryCalculator();
            FinishRide.Visible = false;
            SensingRequestTimer.Enabled = true;
            //Making the status of the driver free
            BookingStatus = 0;
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update driver set status=0  where EmailId=@driverId ", con);
                cmd.Parameters.AddWithValue("@driverId", Session["userEmailId"].ToString());
                con.Open();
                cmd.ExecuteNonQuery();
               
            }
            //Generating the bill
            Response.Redirect("bill.aspx?BookingRequestId=" + BookingRequestId);
        }

        protected void rejectButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "hideModal();", true);
            SensingRequestTimer.Enabled=true;
            BookingStatus = 0;

        }

       

        
    }
}