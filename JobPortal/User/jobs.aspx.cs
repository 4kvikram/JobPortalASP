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
    public partial class jobs : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }
            else if (!IsPostBack)
            {
                bindGrid();
            }
        }
        protected void bindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobs", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@command", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            datashow.DataSource = dt;
            datashow.DataBind();
        }

        protected void datashow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdApply"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_ApplyedJobs", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@JobID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@userid", Session["id"].ToString());
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if(i>0)
                {
                    Response.Redirect("JobConfirmation.aspx");
                }
            }
            
        }
    }
}