using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KYC_doc
{
    public partial class Doc_Upload : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string cnfg = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cnfg);
            cmd = new SqlCommand();
            cmd.Connection = con;          
        }       
        protected void btnregister_Click(object sender, EventArgs e)
        {
            string ext = Path.GetExtension(fuadhar.FileName);             
            string AdharUpload = "~/Images/" + fuadhar.FileName;
            fuadhar.PostedFile.SaveAs(Server.MapPath("~/Images/" + fuadhar.FileName));
            Image1.ImageUrl = AdharUpload;
           
            string ext1 = Path.GetExtension(fupan.FileName);
            string panUplaod = "~/Images/" + fupan.FileName;
            fupan.PostedFile.SaveAs(Server.MapPath("~/Images/" + fupan.FileName));
            Image2.ImageUrl = panUplaod;

            cmd.CommandText = "Insert into Registration_KYC(Name,Email,Mob_No,Address,Username,Password,Adhar_Card,Pan_Card) Values (@name,@email,@mob,@address,@user,@pass,@adhar,@pan)";
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@mob", txtmob.Text);
            cmd.Parameters.AddWithValue("@address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@user", txtuser.Text);
            cmd.Parameters.AddWithValue("@pass", txtpass.Text);       
            cmd.Parameters.AddWithValue("@adhar", AdharUpload.ToString());
            cmd.Parameters.AddWithValue("@pan", panUplaod.ToString());

            con.Open();
            int index = cmd.ExecuteNonQuery();
            if (index > 0)
            {
                Response.Write("<script>alert('KYC registration completed..........')</script>");
            }
            else
            {
                Response.Write("<script>alert('KYC not registration......')</script>");
            }
            con.Close();
        }
        private void Check_Status()
        {
            cmd.CommandText = "Select Username from Registration_KYC where UserName='" + txtuser.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string isApproved = dt.Rows[0]["isApproved"].ToString();
                if (isApproved == "YES")
                {
                    if (fuadhar.Enabled==true && fupan.Enabled == true)
                    {
                        fuadhar.Enabled = false;
                        fupan.Enabled = false;
                        Response.Write("<script>alert('Your KYC request approved successfully')</script>");
                    }
                    //if (isApproved == "NO" && isRejected == "NO")
                    //{
                    //    Response.Write("<script>alert('Your KYC request in process')</script>");
                    //}
                }
            }
        }
        private void kyc_Reject()
        {
            cmd.CommandText = "Select Username from Registration_KYC where Username='" + txtuser.Text + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                string isRejected = dt.Rows[0]["isRejected"].ToString();
                if (isRejected == "YES")
                {
                    if (fuadhar.Enabled == false && fupan.Enabled == false)
                    {
                        fuadhar.Enabled = true;
                        fupan.Enabled = true;
                    }
                    Response.Write("<script>alert('Your KYC request is rejected')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('invalid details')</script>");
            }
            //txtUserName.Text = "";
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void btnstatus_Click(object sender, EventArgs e)
        {
            kyc_Reject();
            Check_Status();
        }       
    }
}