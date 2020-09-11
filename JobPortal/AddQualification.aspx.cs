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
    public partial class AddQualification : System.Web.UI.Page
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
                grdShowDeleted.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Qualification_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Qname", txtQname.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            display();
        }
        protected void display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_Qualification_select", con);
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
                SqlCommand cmd = new SqlCommand("usp_Qualification_Delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
        }

        protected void linDtnShowDeleted_Click(object sender, EventArgs e)
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

        protected void grdShowDeleted_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnRecover")
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("usp_Qualification_recover", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            display();
            displayDeleted();
        }
        protected void displayDeleted()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_qualification_select_deleted", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            grdShowDeleted.DataSource = ds;
            grdShowDeleted.DataBind();
        }

    }
}