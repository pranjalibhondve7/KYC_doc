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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string cnfg = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cnfg);
            cmd = new SqlCommand();
            cmd.Connection = con;
            Session["name"] = txtuser.Text;
        }

        
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "Admin Login")
            {
                cmd.CommandText = "Select * from  Admin where Username='" + txtuser.Text.Trim() + "' and Password='" + txtpass.Text.Trim() + "'";
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Response.Write("<script>alert('Admin login successfully.........')</script>");
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Details.......')</script>");
                }
                con.Close();
            }
            if (DropDownList1.SelectedItem.Text == "User Login")
            {
                cmd.CommandText = "Select * from Registration_KYC where Username='" + txtuser.Text.Trim() + "' and Password='" + txtpass.Text.Trim() + "'";
                con.Open();
                
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Response.Write("<script>alert('User login successfully.........')</script>");
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Details.......')</script>");
                }
                con.Close();
            }
        }
    }
}