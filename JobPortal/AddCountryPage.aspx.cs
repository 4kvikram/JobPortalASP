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
    public partial class AddCountryPage : System.Web.UI.Page
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
                display();
                grdshowdltcountry.Visible = false;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_country_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@countryName", txtCuntryName.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            display();
        }
        protected void display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_country_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            gd.DataSource = ds;
            gd.DataBind();
        }

        protected void gd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnDelete")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_country_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
        }

        protected void grdshowdltcountry_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnRecover")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_country_recover", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
            displayDeletedCountry();
        }

        protected void linbtnshowdltcountry_Click(object sender, EventArgs e)
        {
            if (grdshowdltcountry.Visible == false)
            {
                grdshowdltcountry.Visible = true;
                displayDeletedCountry();
            }
            else
            {
                grdshowdltcountry.Visible = false;
            }

        }
        protected void displayDeletedCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_country_select_deleted", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            grdshowdltcountry.DataSource = ds;
            grdshowdltcountry.DataBind();
        }
    }
}