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
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //setuserinfo();
        }
        protected void setuserinfo()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_RegistrationDetails_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            lbluserName.Text = ds.Tables[0].Rows[0]["fName"].ToString() +" "+ ds.Tables[0].Rows[0]["lName"].ToString();
            imgUser.ImageUrl = "~//uploads//" + ds.Tables[0].Rows[0]["photo"].ToString();
        }
    }
}