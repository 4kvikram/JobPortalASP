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
    public partial class AddJobs : System.Web.UI.Page
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
                bindCompany();
                bindJobProfile();
                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    displayData();
                }
            }
        }

        protected void displayData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobs", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@command", "getbyid");
            cmd.Parameters.AddWithValue("@JobID", Request.QueryString["id"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();
            //[jobProfileID], [companyID], [NoOfVacancy], [minExp], [maxExp], [minOfferedSal], [maxOfferedSal], [comments], [dt_created])
            ddlcompany.SelectedValue= ds.Rows[0]["companyID"].ToString();
            ddljobProfile.SelectedValue = ds.Rows[0]["jobProfileID"].ToString();
            txtVacancy.Text = ds.Rows[0]["NoOfVacancy"].ToString();
            ddlMinExp.SelectedValue= ds.Rows[0]["minExp"].ToString();
            ddlMaxExp.SelectedValue = ds.Rows[0]["maxExp"].ToString();
            txtminSal.Text= ds.Rows[0]["minOfferedSal"].ToString();
            txtmaxnSal.Text = ds.Rows[0]["maxOfferedSal"].ToString();
            txtcomment.Text = ds.Rows[0]["comments"].ToString();


            btnSave.Text = "Update";

        }

        protected void bindJobProfile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobProfile_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobProfile.DataValueField = "id";
            ddljobProfile.DataTextField = "jobProfileName";

            ddljobProfile.DataSource = dt;
            ddljobProfile.DataBind();
            ddljobProfile.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        protected void bindCompany()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_company_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlcompany.DataValueField = "id";
            ddlcompany.DataTextField = "cName";

            ddlcompany.DataSource = dt;
            ddlcompany.DataBind();
            ddlcompany.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "SAVE")
            {


                con.Open();
                SqlCommand cmd = new SqlCommand("usp_jobs", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@command", "insert");
                cmd.Parameters.AddWithValue("@jobProfileID",ddljobProfile.SelectedValue);
                cmd.Parameters.AddWithValue("@companyID", ddlcompany.SelectedValue);
                cmd.Parameters.AddWithValue("@NoOfVacancy", txtVacancy.Text);
                cmd.Parameters.AddWithValue("@minExp", ddlMinExp.SelectedValue);
                cmd.Parameters.AddWithValue("@maxExp", ddlMaxExp.SelectedValue);
                cmd.Parameters.AddWithValue("@minOfferedSal", txtminSal.Text);
                cmd.Parameters.AddWithValue("@maxOfferedSal", txtmaxnSal.Text);
                cmd.Parameters.AddWithValue("@comments", txtcomment.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                
                lblMessage.Text = "Record saved";
            }
            else
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_jobs", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@command", "update");
                cmd.Parameters.AddWithValue("@JobID", Request.QueryString["id"].ToString());
                cmd.Parameters.AddWithValue("@jobProfileID", ddljobProfile.SelectedValue);
                cmd.Parameters.AddWithValue("@companyID", ddlcompany.SelectedValue);
                cmd.Parameters.AddWithValue("@NoOfVacancy", txtVacancy.Text);
                cmd.Parameters.AddWithValue("@minExp", ddlMinExp.SelectedValue);
                cmd.Parameters.AddWithValue("@maxExp", ddlMaxExp.SelectedValue);
                cmd.Parameters.AddWithValue("@minOfferedSal", txtminSal.Text);
                cmd.Parameters.AddWithValue("@maxOfferedSal", txtmaxnSal.Text);
                cmd.Parameters.AddWithValue("@comments", txtcomment.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                lblMessage.Text = "Record Updated";
                //Response.Redirect("ManageJobs.aspx");
            }

        }

    }
}