using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace JobPortal
{
    public partial class registrationPage : System.Web.UI.Page
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
                imgshow.Visible = false;
                boundCountry();
                boundQualification();
                boundJobProfile();
                boundSecQ();
                ddlState.Enabled = false;

                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    displayData();
                }
            }

        }
        protected void boundSecQ()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_securityQuestion_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlSecQ.DataValueField = "id";
            ddlSecQ.DataTextField = "secQue";
            ddlSecQ.DataSource = dt;
            ddlSecQ.DataBind();
            ddlSecQ.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        protected void boundJobProfile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_jobProfile_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlJobProfile.DataValueField = "id";
            ddlJobProfile.DataTextField = "jobProfileName";
            ddlJobProfile.DataSource = dt;
            ddlJobProfile.DataBind();
            ddlJobProfile.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        protected void boundQualification()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Qualification_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlQuali.DataValueField = "id";
            ddlQuali.DataTextField = "Qname";
            ddlQuali.DataSource = dt;
            ddlQuali.DataBind();
            ddlQuali.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void bindState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_state_get", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cid", ddlCounty.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            ddlState.DataValueField = "id";
            ddlState.DataTextField = "sName";

            ddlState.DataSource = dt;
            ddlState.DataBind();

            ddlState.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        protected void boundCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_country_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddlCounty.DataValueField = "id";
            ddlCounty.DataTextField = "CountryName";
            ddlCounty.DataSource = dt;
            ddlCounty.DataBind();
            ddlCounty.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

            reset();
        }
        protected void reset()
        {
            txtfName.Text = "";
            txtlName.Text = "";
            txtEmail.Text = "";
            txtPass.Text = "";
            txtddlsecQAns.Text = "";
            ddlCounty.SelectedValue = "0";
            ddlJobProfile.SelectedValue = "0";
            ddlQuali.SelectedValue = "0";
            ddlSecQ.SelectedValue = "0";
        }
        protected void displayData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_RegistrationDetails_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            da.Fill(ds);
            con.Close();

            txtfName.Text = ds.Rows[0]["fName"].ToString();
            txtlName.Text = ds.Rows[0]["lName"].ToString();
            txtEmail.Text = ds.Rows[0]["email"].ToString();
            txtddlsecQAns.Text = ds.Rows[0]["secQAns"].ToString();
            ddlCounty.SelectedValue = ds.Rows[0]["cuntryID"].ToString();
            ddlSecQ.SelectedValue = ds.Rows[0]["secQID"].ToString();
            ddlJobProfile.SelectedValue = ds.Rows[0]["jobprofID"].ToString();
            ddlQuali.SelectedValue = ds.Rows[0]["QualId"].ToString();
            rdoGender.SelectedValue = ds.Rows[0]["gender"].ToString();
            ddlQuali.SelectedValue = ds.Rows[0]["Qname"].ToString();



            if (ddlCounty.SelectedValue == "0")
            {
                ddlState.Enabled = false;
                ddlState.SelectedValue = "0";
            }
            else
            {

                ddlState.Enabled = true;
                bindState();
            }

            ddlState.SelectedValue = ds.Rows[0]["stateID"].ToString();

            chboxSkils.ClearSelection();

            string[] arr = ds.Rows[0]["skils"].ToString().Split(',');
            for (int i = 0; i < chboxSkils.Items.Count; i++)
            {
                for (int j = 0; j < arr.Length; j++)
                {
                    if (arr[j] == chboxSkils.Items[i].ToString())
                    {
                        chboxSkils.Items[i].Selected = true;
                        break;
                    }
                }
            }
            imgshow.Visible = true;
            imgshow.ImageUrl = "~//uploads//" + ds.Rows[0]["photo"].ToString();
            btnSubmit.Text = "Update";
            txtPass.Visible = false;
            txtConPass.Visible = false;
            lblconfirmPass.Visible = false;
            lblPass.Visible = false;
            lblPhoto.Visible = false;
            imgPhoto.Visible = false;


        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            string skils = "";
            for (int i = 0; i < chboxSkils.Items.Count; i++)
            {
                if (chboxSkils.Items[i].Selected)
                {
                    skils += chboxSkils.Items[i].Text + ",";
                }
            }
            skils = skils.TrimEnd(',');

            if (btnSubmit.Text == "Submit")
            {

                string fn = "";
                string fext = "";
                fn = Path.GetFileName(imgPhoto.PostedFile.FileName);
                fext = Path.GetExtension(imgPhoto.PostedFile.FileName);



                imgPhoto.SaveAs(Server.MapPath("uploads" + "\\" + fn));
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_RegistrationDetails_insert_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", 0);
                cmd.Parameters.AddWithValue("@fName", txtfName.Text);
                cmd.Parameters.AddWithValue("@lName", txtlName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                cmd.Parameters.AddWithValue("@cuntryID", ddlCounty.SelectedValue);
                cmd.Parameters.AddWithValue("@StateId", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@QualId", ddlQuali.SelectedValue);
                cmd.Parameters.AddWithValue("@jobprofID", ddlJobProfile.SelectedValue);
                cmd.Parameters.AddWithValue("@secQID", ddlSecQ.SelectedValue);
                cmd.Parameters.AddWithValue("@secQAns", txtddlsecQAns.Text);
                cmd.Parameters.AddWithValue("@gender", rdoGender.SelectedValue);
                cmd.Parameters.AddWithValue("@skils", skils);
                cmd.Parameters.AddWithValue("@photo", fn);
                cmd.ExecuteNonQuery();
                con.Close();
                reset();
                lblMessage.Text = "Record saved";


            }
            else if (btnSubmit.Text == "Update")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_RegistrationDetails_insert_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());
                cmd.Parameters.AddWithValue("@fName", txtfName.Text);
                cmd.Parameters.AddWithValue("@lName", txtlName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@pass", txtPass.Text);
                cmd.Parameters.AddWithValue("@cuntryID", ddlCounty.SelectedValue);
                cmd.Parameters.AddWithValue("@StateId", ddlState.SelectedValue);
                cmd.Parameters.AddWithValue("@QualId", ddlQuali.SelectedValue);
                cmd.Parameters.AddWithValue("@jobprofID", ddlJobProfile.SelectedValue);
                cmd.Parameters.AddWithValue("@secQID", ddlSecQ.SelectedValue);
                cmd.Parameters.AddWithValue("@secQAns", txtddlsecQAns.Text);
                cmd.Parameters.AddWithValue("@gender", rdoGender.SelectedValue);
                cmd.Parameters.AddWithValue("@skils", skils);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("ManageUserPage.aspx");
            }
        }

        protected void ddlCounty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCounty.SelectedValue == "0")
            {
                ddlState.Enabled = false;
                ddlState.SelectedValue = "0";
            }
            else
            {

                ddlState.Enabled = true;
                bindState();
            }


        }
    }
}