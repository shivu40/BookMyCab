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
    public partial class bill : System.Web.UI.Page
    {
        public static int BookingRequestId;
        protected void Page_Load(object sender, EventArgs e)
        {
             BookingRequestId =Convert.ToInt32(Request.QueryString["BookingRequestId"]);
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from BookingRequest,Customers where BookingRequest.CustomerId=Customers.EmailId and RequestId=@RequestId", con);
                cmd.Parameters.AddWithValue("@RequestId", BookingRequestId);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        BookingRequest.Text = BookingRequestId.ToString();
                        CustomerName.Text = dr["Name"].ToString();
                        PickupLocation.Text = dr["PickupLocation"].ToString();
                        DestinationLocation.Text = dr["DestinationLocation"].ToString();
                        TotalFare.Text = dr["TotalFare"].ToString();
                        Distance.Text = dr["Distance"].ToString();
                    }
                }
             
            }
        }

        protected void Done_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                
                //finishing the ride 
                SqlCommand cmd = new SqlCommand("update Books set RideStatus=1  where BookingRequestId=@BookingRequestId ", con);
                cmd.Parameters.AddWithValue("@BookingRequestId", BookingRequestId);
                cmd.ExecuteNonQuery();  
            }
            Response.Redirect("~/DriverPage.aspx");
        }
    }
}