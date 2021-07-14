using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
namespace Book_My_Cab
{
    public partial class ajaxOperations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            string type ;
            int id ;
            type = Request.QueryString["type"].ToString();
            id = int.Parse(Request.QueryString["id"]);
            //id = 1;
            //type = "bookCab";
            
            if(type=="getFare")
            {
                float fare;
                
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select * from [Available Cabs] where id=@id", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {

                        fare = float.Parse(dr["RatePerKM"].ToString());
                        Response.Write(fare);

                    }
                }
            }
            else if(type=="bookCab")
            {
                decimal distance = Convert.ToDecimal(Request.QueryString["estimatedDistance"]);
                string pickupLocation = Request.QueryString["pickupLocation"].ToString();
                string destinationLocation = Request.QueryString["destinationLocation"].ToString();
                decimal fare = Convert.ToDecimal(Request.QueryString["estimatedFare"]);
                //decimal distance = Convert.ToDecimal(25.25);
                //decimal fare = Convert.ToDecimal(25.25);
                //string destinationLocation = "dewas";
                //string pickupLocation = "dewas";

                
                using (SqlConnection con = new SqlConnection(cs))
                {

                    SqlCommand cmd = new SqlCommand("insert into BookingRequest values(@customerId,@pickupLocation,@destinationLocation,@fare,@bookingTime,@bookingDate,@distance,0)", con);
                    
                        con.Open();
                        cmd.Parameters.AddWithValue("@customerId", Session["userEmailId"].ToString());
                        //cmd.Parameters.AddWithValue("@customerId", "shivamjadhav40@gmail.com");
                       
                        cmd.Parameters.AddWithValue("@bookingTime", DateTime.Now.ToString("HH:mm:ss"));
                        cmd.Parameters.AddWithValue("@distance", distance);
                        cmd.Parameters.AddWithValue("@fare", fare);
                        cmd.Parameters.AddWithValue("@bookingDate", DateTime.Today);
                        cmd.Parameters.AddWithValue("@pickupLocation", pickupLocation);
                        cmd.Parameters.AddWithValue("@destinationLocation", destinationLocation);
                        cmd.ExecuteNonQuery();     
                }
            }
            
           

            
            
        
        }
    }
}