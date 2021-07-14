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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            string type;
            type = Request.QueryString["type"].ToString();
            //type = "updateLocation";
            string driverId = Session["userEmailId"].ToString();
            //string driverId = "nupur@gmail.com";
            if (type == "custInfo")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select * from Books,Customers where DriverId=@driverId and books.CustomerId=Customers.EmailId and RideStatus=0", con);
                    cmd.Parameters.AddWithValue("@driverId", driverId);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        Customer customer = new Customer();
                        while (dr.Read())
                        {
                            customer.pickupLocation = dr["PickupLocation"].ToString();
                            customer.destinationLocation = dr["DestinationLocation"].ToString();
                            customer.name = dr["Name"].ToString();
                            customer.emailId = dr["CustomerId"].ToString();
                            customer.mobileNo = long.Parse(dr["MobileNo"].ToString());
                            customer.totalFare = Convert.ToDecimal(dr["Fare"]);

                            JavaScriptSerializer js = new JavaScriptSerializer();
                            Context.Response.Write(js.Serialize(customer));
                        }

                    }
                    else
                    {
                        Response.Write("none");
                    }
                }
            }
            else if (type == "freeDriver")
            {
                string customerId = Request.QueryString["customerId"].ToString();
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("update books set RideStatus=1 where DriverId=@driverId and CustomerId=@customerId", con);
                    cmd.Parameters.AddWithValue("@driverId", driverId);
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("update driver set status=0 where EmailId=@driverId", con);
                    cmd.Parameters.AddWithValue("@driverId", driverId);
                    cmd.ExecuteNonQuery();
                }
            }
            else if(type=="updateLocation")
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    decimal latitude = Convert.ToDecimal(Request.QueryString["lat"]);
                    decimal longitude = Convert.ToDecimal(Request.QueryString["long"]);
                    //decimal latitude = 22.9734229M;
                    //decimal longitude = 22.9734229M;
                    SqlCommand cmd = new SqlCommand("update Driver set lat=@lat,long=@long where EmailId=@driverId", con);
                    cmd.Parameters.AddWithValue("@driverId", driverId);
                    cmd.Parameters.AddWithValue("@lat", latitude);
                    cmd.Parameters.AddWithValue("@long", longitude);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('location sent');</script>");
                }
            }
        }
    }
}