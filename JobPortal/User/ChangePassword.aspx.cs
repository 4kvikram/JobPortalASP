using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace JobPortal.User
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }
            else if(!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_change_password", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",Session["id"]);
            cmd.Parameters.AddWithValue("@oldpass",txtold.Text);
            cmd.Parameters.AddWithValue("@newpass", txtnew.Text);
            int i= cmd.ExecuteNonQuery();
            con.Close();
            if(i>0)
            {
                lblmessage.Text = "Password changed";
            }
            else
            {
                lblmessage.Text ="Error....!!!!";
            }
        }
    }
}