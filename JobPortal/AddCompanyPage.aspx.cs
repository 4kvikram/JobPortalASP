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
    public partial class AddCompanyPage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }
            else if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    displayData();
                }
            }
        }
        protected void displayData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_company_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();

            txtCompanyName.Text = ds.Rows[0]["cName"].ToString();
            txturl.Text = ds.Rows[0]["url"].ToString();
            txtAddress.Text = ds.Rows[0]["address"].ToString();
            TextEmail.Text = ds.Rows[0]["email"].ToString();
            TxtcontactPerson.Text = ds.Rows[0]["hrName"].ToString();
            TxtContactNo.Text = ds.Rows[0]["hrcontact"].ToString();
            btnSave.Text = "Update";

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "SAVE")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_company_insert_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", 0);
                cmd.Parameters.AddWithValue("@cName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@url", txturl.Text);
                cmd.Parameters.AddWithValue("@email", TextEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@hrName", TxtcontactPerson.Text);
                cmd.Parameters.AddWithValue("@hrcontact", TxtContactNo.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Record saved";
            }
            else if (btnSave.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_company_insert_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                cmd.Parameters.AddWithValue("@cName", txtCompanyName.Text);
                cmd.Parameters.AddWithValue("@url", txturl.Text);
                cmd.Parameters.AddWithValue("@email", TextEmail.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@hrName", TxtcontactPerson.Text);
                cmd.Parameters.AddWithValue("@hrcontact", TxtContactNo.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ManageCompanyPage.aspx");
            }
        }

    }
}