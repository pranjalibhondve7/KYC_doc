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
    public partial class Gridview : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string cnfg = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cnfg);
            cmd = new SqlCommand();
            cmd.Connection = con;
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            cmd.CommandText = "Select * from Registration_KYC";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
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
        }
       
        protected void btnaccept_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            con.Open();
            cmd.CommandText = "Update Registration_KYC set isApproved='YES' where ID=" + id + "";

            int u1 = cmd.ExecuteNonQuery();
            if (u1 > 0)
            {
                Response.Write("<script>alert('Your KYC Request Accepted........')</script>");
                Response.Redirect("Doc_Upload.aspx");
            }
            else
            {
                Response.Write("<script>alert('Your KYC Request Rejected........ Please Upload Valid Documents')</script>");
                Response.Redirect("Doc_Upload.aspx");
            }
            con.Close();
        }

        protected void btnreject_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            con.Open();
            cmd.CommandText = "Update Registration_KYC set isRejected='YES' where ID=" + id + "";

            int u1 = cmd.ExecuteNonQuery();
            if (u1 > 0)
            {
                Response.Write("<script>alert('Your KYC Request Rejected........ Please Upload ValidDocuments ')</script>");
                Response.Redirect("Doc_Upload.aspx");
            }
            else
            {
                Response.Write("<script>alert('Your KYC Request Accepted........')</script>");
                Response.Redirect("Doc_Upload.aspx");
            }
            con.Close();
        }
    }
}