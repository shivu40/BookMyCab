using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
namespace Book_My_Cab
{
    public partial class BookCabs : System.Web.UI.Page
    {
        public static int CabType = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void BookCab_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {


                SqlCommand cmd = new SqlCommand(" select * from users where ActiveStatus=1 and usertype='Driver'", con);
                con.Open();
                SqlDataReader dr= cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    dr.Close();
                    
                    cmd = new SqlCommand("insert into BookingRequest values(@customerId,@pickupLocation,@destinationLocation,@fare,@bookingTime,@bookingDate,@distance,0,@CabType)", con);

                    cmd.Parameters.AddWithValue("@customerId", Session["userEmailId"].ToString());
                    //cmd.Parameters.AddWithValue("@customerId", "shivamjadhav40@gmail.com");
                    cmd.Parameters.AddWithValue("@pickupLocation", pickupLocation.Text);
                    cmd.Parameters.AddWithValue("@destinationLocation", destinationLocation.Text);
                    cmd.Parameters.AddWithValue("@fare", Convert.ToDecimal(estimatedFare.Text));
                    cmd.Parameters.AddWithValue("@bookingTime", DateTime.Now.ToString("HH:mm:ss"));
                    cmd.Parameters.AddWithValue("@bookingDate", DateTime.Today);
                    cmd.Parameters.AddWithValue("@distance", Convert.ToDecimal(estimatedDistance.Text));
                    cmd.Parameters.AddWithValue("@CabType", CabType);

                    cmd.ExecuteNonQuery();

                    Response.Redirect("~/CurrentBooking.aspx");
                    
                }
                else
                {
                    Response.Write("<script>alert('Sorry no Drivers are available at this time. Try again later')</script>");
                }
                
                
               
            }
           
        }

        protected void micro_Click(object sender, ImageClickEventArgs e)
        {
            noColor();
            micro.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFBE7D");
            CabType = 1;
        }

        protected void primeSedan_Click(object sender, ImageClickEventArgs e)
        {
            noColor();
            primeSedan.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFBE7D");
            CabType = 2;
        }

        protected void primePlay_Click(object sender, ImageClickEventArgs e)
        {
            noColor();
            primePlay.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFBE7D");
            CabType = 3;
        }

        protected void primeSuv_Click(object sender, ImageClickEventArgs e)
        {
            noColor();
            primeSuv.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFBE7D");
            CabType = 4;
        }
        private void noColor()
        {
            micro.BackColor=System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            primeSedan.BackColor = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            primePlay.BackColor = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
            primeSuv.BackColor = System.Drawing.ColorTranslator.FromHtml("#EAEAEA");
        }

        

        protected void RideEstimation_Click(object sender, EventArgs e)
        {
            
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            float fare;
            float distance;
            Thread.Sleep(1000);
            distance = float.Parse(estimatedDistance.Text);
            using (SqlConnection con = new SqlConnection(cs))
            {

                SqlCommand cmd = new SqlCommand("select * from [Available Cabs] where id=@id", con);
                cmd.Parameters.AddWithValue("@id", CabType);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                { 
                while (dr.Read())
                 {
                     
                    fare = float.Parse(dr["RatePerKM"].ToString());
                    
                    estimatedFare.Text = (fare*distance).ToString();
                   
                 }
                }
                else
                {
                    Response.Write("<script>alert('fare estiamtion failed')</script>");
                }
            }
        }

        protected void RideEstimation_Click1(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            float fare;
            Response.Write("<script>alert('fare estiamtion failed')</script>");
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from [Available Cabs] where id=@id", con);
                cmd.Parameters.AddWithValue("@id", CabType);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        fare = float.Parse(dr["RatePerKM"].ToString());
                        estimatedFare.Text = fare.ToString();

                    }
                }
                else
                {
                    Response.Write("<script>alert('fare estiamtion failed')</script>");
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('fare estiamtion failed')</script>");
            
        }
       
    }
}