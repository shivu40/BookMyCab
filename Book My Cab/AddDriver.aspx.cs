using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
namespace Book_My_Cab
{
    public partial class AddDriver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
             
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Driver where EmailId=@EmailId", con);
                 cmd.Parameters.AddWithValue("@EmailId", driverEmailId.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script>alert('This Email Id has already been taken')</script>");
                   
                }
                else
                {

                    dr.Close();
                    //Registering Driver as a user
                    cmd = new SqlCommand("insert into Users values(@emailId,@password,'Driver',0)", con);
                    cmd.Parameters.AddWithValue("@emailId", driverEmailId.Text);
                    cmd.Parameters.AddWithValue("@password", RandomPassword());
                    
                    int affectUser = cmd.ExecuteNonQuery();
                    
                    
                    //Registering the cab
                    cmd = new SqlCommand("insert into Cab values(@cabRegistrationNo,@ModelName,@TypeId)", con);
                    cmd.Parameters.AddWithValue("@cabRegistrationNo", cabRegistrationNo.Text);
                    cmd.Parameters.AddWithValue("@ModelName", cabModelName.Text);
                    cmd.Parameters.AddWithValue("@TypeId", TypeId.SelectedValue);
                    cmd.ExecuteNonQuery();
                    //Registering driver as a Driver
                    cmd = new SqlCommand("insert into Driver values(@driverEmailId,@driverName,@driverMobileNo,@driverAddress,@driverLicenseNo,0,@cabRegistrationNo,0,0)", con);
                    cmd.Parameters.AddWithValue("@driverEmailId", driverEmailId.Text);
                    cmd.Parameters.AddWithValue("@driverName", driverName.Text);
                    cmd.Parameters.AddWithValue("@driverAddress", driverAddress.Text);
                    cmd.Parameters.AddWithValue("@driverMobileNo", driverMobileNo.Text);
                    cmd.Parameters.AddWithValue("@driverLicenseNo", driverLicenseNo.Text);
                    cmd.Parameters.AddWithValue("@cabRegistrationNo", cabRegistrationNo.Text);
                    int affectDriver = cmd.ExecuteNonQuery();
                    if (affectDriver > 0 && affectUser > 0)
                    {

                        Response.Write("<script> alert('registration successful');</script>");
                        DriverDetails.DataBind();
                    }
                    else
                    {

                        Response.Write("<script> alert('registration failed');</script>");

                    }
                }
            }
        }

        private string RandomPassword()
        {
            RandomGenerator generator = new RandomGenerator();
            string pass = generator.RandomPassword();
            return pass;
        }

        protected void GoBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");
        } 
    }
    public class RandomGenerator
    {
        // Generate a random number between two numbers  
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        // Generate a random string with a given size  
        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

        // Generate a random password  
        public string RandomPassword()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(4, true));
            builder.Append(RandomNumber(1000, 9999));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }
    }  
 
}