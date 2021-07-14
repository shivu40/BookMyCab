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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {

           
            
            

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Users where Id=@id and Password=@password", con);
                cmd.Parameters.AddWithValue("@id", loginId.Text);
                cmd.Parameters.AddWithValue("@password", loginPassword.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if(dr.HasRows)
                {
                    Session["userEmailId"] = loginId.Text;
                    while(dr.Read())
                    {
                        Session["userType"] = dr["UserType"].ToString();
                        string userType = Session["userType"].ToString();
                        dr.Close();
                        if (userType == "Customer")
                        {
                            cmd = new SqlCommand("select * from Customers where EmailId=@id ", con);
                            cmd.Parameters.AddWithValue("@id", loginId.Text);
                            dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                Session["userName"] = dr["Name"].ToString();
                            }
                            dr.Close();
                            cmd = new SqlCommand("update Users set ActiveStatus=1 where Id=@id", con);
                            cmd.Parameters.AddWithValue("@id", loginId.Text);
                            cmd.ExecuteNonQuery();
                            Response.Redirect("~/LoginPage.aspx");
                        }
                        else if (userType == "Driver")
                        {
                            cmd = new SqlCommand("select * from Driver where EmailId=@id ", con);
                            cmd.Parameters.AddWithValue("@id", loginId.Text);
                            dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                Session["userName"] = dr["Name"].ToString();
                            }
                            dr.Close();
                            cmd = new SqlCommand("update Users set ActiveStatus=1 where Id=@id", con);
                            cmd.Parameters.AddWithValue("@id", loginId.Text);
                            cmd.ExecuteNonQuery();
                            Response.Redirect("~/DriverPage.aspx");
                        }
                        else if (userType == "Admin")
                        {
                            dr.Close();
                            cmd = new SqlCommand("update Users set ActiveStatus=1 where Id=@id", con);
                            cmd.Parameters.AddWithValue("@id", loginId.Text);
                            cmd.ExecuteNonQuery();
                            Response.Redirect("~/AdminPage.aspx");
                        }
                        
                        
                    
                    }
                    
                   
                }
                else
                {
                    dr.Close();
                    Response.Write("<script> alert('Your Email Id or Password is Incorrect');</script>");
                }
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            
        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Users where id=@id", con);
                cmd.Parameters.AddWithValue("@id", regEmailId.Text);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    Response.Write("<script> alert('This Email Id has been taken');</script>");
                   
                   
                    
                }
                else
                {
                    dr.Close();
                    
                    cmd = new SqlCommand("insert into Users values(@emailId,@password,'Customer',0);", con);
                    cmd.Parameters.AddWithValue("@emailId", regEmailId.Text);
                    cmd.Parameters.AddWithValue("@password",regPassword.Text);
                    //cmd.Parameters.AddWithValue("@userType", "Customer");
                    //cmd.Parameters.AddWithValue("@activeStatus", "offline");
                    int affectUser = cmd.ExecuteNonQuery();
                    cmd = new SqlCommand("insert into Customers values(@emailId,@name,@mobileNo);", con);
                    cmd.Parameters.AddWithValue("@emailId", regEmailId.Text);
                    cmd.Parameters.AddWithValue("@name", regName.Text);
                    cmd.Parameters.AddWithValue("@mobileNo", regMobileNo.Text);

                    int affectCust = cmd.ExecuteNonQuery();
                    if (affectCust >0 && affectUser > 0)
                    {
                        
                        Response.Write("<script> alert('registration successful');</script>");
                    }
                    else
                    {
                       
                        Response.Write("<script> alert('registration failed');</script>");

                    }
                }
            }
        }
    }
}