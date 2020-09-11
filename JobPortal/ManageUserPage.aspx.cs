using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace JobPortal
{
    public partial class ManageUserPage : System.Web.UI.Page
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
                display();

            }
        }

        protected void gd_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.Equals("cmdEdit"))
            {
                Response.Redirect("registrationPage.aspx?id=" + e.CommandArgument);
            }
            else if (e.CommandName.Equals("linkbtnstatus"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_registration_changestatus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
        }
        protected void display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_RegistrationDetails_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", 0);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            gd.DataSource = ds;
            gd.DataBind();

        }
    }
}