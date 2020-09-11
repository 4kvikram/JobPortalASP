using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace JobPortal
{
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email",txtEmail.Text);
            cmd.Parameters.AddWithValue("@pass",txtPass.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            { 
                if(dt.Rows[0]["role"].ToString()=="1")
                {
                    Session["id"] = dt.Rows[0]["id"];
                    Response.Redirect("AdminHomePage.aspx");
                }
                else
                {

                Session["id"] = dt.Rows[0]["id"];
                Response.Redirect("~\\User\\UserHomePage.aspx");
                }
            }
            
            else
            {
                lblmessg.Text = "Invalid Input";
            }

        }
    }
}