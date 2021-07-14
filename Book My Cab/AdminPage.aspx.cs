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
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                //Retrieiving No. of Drivers Online
                SqlCommand cmd = new SqlCommand("select count(Id) as DriversOnline from users where ActiveStatus=1 and usertype='Driver'", con);
               DriverOnline.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
               //Retrieiving No. of Customers Online
                cmd = new SqlCommand("select count(Id) as CustomersOnline from users where ActiveStatus=1 and usertype='Customer'", con);
               CustomersOnline.Text= (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
               //Retrieiving total No. of Users Online
                cmd = new SqlCommand("select count(Id) as TotalUsersOnline from users where ActiveStatus=1 ", con);
               TotalUsersOnline.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving No. of Busy Drivers 
               cmd = new SqlCommand("select count(EmailId) as BusyDrivers from Driver where Status=1 ", con);
               BusyDrivers.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving No. of Free Drivers
               cmd = new SqlCommand("select count(EmailId) as FreeDrivers from Driver,users where Status=0 and Driver.EmailId=Users.Id and Users.ActiveStatus=1 ", con);
               FreeDrivers.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();

            }
        }

        protected void Updater_Tick(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                //Retrieiving No. of Drivers Online
                SqlCommand cmd = new SqlCommand("select count(Id) as DriversOnline from users where ActiveStatus=1 and usertype='Driver'", con);
                DriverOnline.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving No. of Customers Online
                cmd = new SqlCommand("select count(Id) as CustomersOnline from users where ActiveStatus=1 and usertype='Customer'", con);
                CustomersOnline.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving total No. of Users Online
                cmd = new SqlCommand("select count(Id) as TotalUsersOnline from users where ActiveStatus=1 ", con);
                TotalUsersOnline.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving No. of Busy Drivers 
                cmd = new SqlCommand("select count(EmailId) as BusyDrivers from Driver where Status=1 ", con);
                BusyDrivers.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();
                //Retrieiving No. of Free Drivers
                cmd = new SqlCommand("select count(EmailId) as FreeDrivers from Driver,users where Status=0 and Driver.EmailId=Users.Id and Users.ActiveStatus=1 ", con);
                FreeDrivers.Text = (Convert.ToInt32(cmd.ExecuteScalar())).ToString();

            }
        }
    }
}