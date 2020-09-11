using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace JobPortal
{
    public partial class ManageJobs : System.Web.UI.Page
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
                grdShowDeleted.Visible = false;
                bindShowGrid();
            }
        }
        protected void bindShowGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobs", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@command", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            grdShow.DataSource = dt;
            grdShow.DataBind();
        }
        protected void grdShow_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("cmdDelete"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_jobs", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@JobID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@command", "delete");
                cmd.ExecuteNonQuery();
                con.Close();

            }
            else if (e.CommandName.Equals("cmdEdit"))
            {
                Response.Redirect("AddJobs.aspx?id=" + e.CommandArgument);
            }
            bindShowGrid();
            displayDeleted();
        }

        protected void grdShowDeleted_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnRecover")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_jobs", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@JobID", e.CommandArgument);
                cmd.Parameters.AddWithValue("@command", "recover");
                cmd.ExecuteNonQuery();
                con.Close();
            }
            bindShowGrid();
            displayDeleted();
        }
        protected void displayDeleted()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobs", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@command", "getDeleted");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            grdShowDeleted.DataSource = ds;
            grdShowDeleted.DataBind();
        }



        protected void linDtnShowDeleted_Click1(object sender, EventArgs e)
        {
            if (grdShowDeleted.Visible == false)
            {
                grdShowDeleted.Visible = true;
                displayDeleted();
            }
            else
            {
                grdShowDeleted.Visible = false;
            }
        }
    }
}
