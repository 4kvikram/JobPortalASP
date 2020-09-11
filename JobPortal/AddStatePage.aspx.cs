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
    public partial class AddStatePage : System.Web.UI.Page
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
                bindCountry();
                ddlshowDeleted.Visible = false;
                grdShowDeleted.Visible = false;
            }
        }
        protected void bindCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_country_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcountry.DataValueField = "id";
            ddlcountry.DataTextField = "CountryName";

            ddlshowDeleted.DataValueField = "id";
            ddlshowDeleted.DataTextField = "CountryName";

            ddlShowcountry.DataValueField = "id";
            ddlShowcountry.DataTextField = "CountryName";

            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();
            ddlcountry.Items.Insert(0, new ListItem("Select Country", "0"));

            ddlShowcountry.DataSource = dt;
            ddlShowcountry.DataBind();
            ddlShowcountry.Items.Insert(0, new ListItem("Select Country", "0"));


            ddlshowDeleted.DataSource = dt;
            ddlshowDeleted.DataBind();
            ddlshowDeleted.Items.Insert(0, new ListItem("Select Country", "0"));

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_state_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@sName", txtstate.Text);
            cmd.Parameters.AddWithValue("@cid", ddlcountry.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void ddlShowcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            display();
        }
        protected void display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_state_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cid", ddlShowcountry.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDelete")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_state_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
        }

        protected void grdShowDeleted_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnRecover")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_state_recover", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
            displayDeletedState();
        }

        protected void btnShowDeleted_Click(object sender, EventArgs e)
        {
            if (ddlshowDeleted.Visible == false)
            {
                ddlshowDeleted.Visible = true;
                grdShowDeleted.Visible = true;
            }
            else
            {
                ddlshowDeleted.Visible = false;
                grdShowDeleted.Visible = false;
            }
        }
        protected void displayDeletedState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_state_select_deleted", con);
            cmd.Parameters.AddWithValue("id",ddlshowDeleted.SelectedValue);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            grdShowDeleted.DataSource = ds;
            grdShowDeleted.DataBind();
        }

        protected void ddlshowDeleted_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayDeletedState();
        }
    }
}