using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYC_doc
{
    public partial class DashBoard1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            cmd = new SqlCommand();
            cmd.Connection = con;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            if (!IsPostBack)
            {
                dataload();
            }
        }
        private void dataload()
        {
            cmd.CommandText = "select * from Registration_KYC";
            con.Open();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }
        protected void btnApprove_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            cmd.CommandText = "update Registration_KYC set isApproved='YES' where id=" + id + "";
            con.Open();
            int u1 = cmd.ExecuteNonQuery();
            if (u1 > 0)
            {
                Response.Write("<script>alert('KYC request is approve')</script>");
            }
            else
            {
                Response.Write("<script>alert('KYC request is Deny')</script>");
            }
            con.Close();
        }

        protected void btnReject_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            cmd.CommandText = "update Registration_KYC set isRejected='YES' where id=" + id + "";
            con.Open();
            int u1 = cmd.ExecuteNonQuery();
            if (u1 > 0)
            {
                Response.Write("<script>alert('KYC request is Rejected')</script>");
            }
            else
            {
                Response.Write("<script>alert('KYC request is not Rejected')</script>");
            }
            con.Close();
        }
    }
}
