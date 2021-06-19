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
    public partial class KycRegistration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string isApproved;
        string isRejected;
        string str = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(str);
            cmd = new SqlCommand();
            cmd.Connection = con;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            //Session["user_name"] = txtUserName.Text;
        }
        private void checkstatus()
        {
            cmd.CommandText = "select * from Registration_KYC where Username='" + txtUserName.Text + "'";
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                isApproved = dt.Rows[0]["isApproved"].ToString();
                if (isApproved == "YES")
                {
                    if (FileAadhar.Enabled == true && FilePan.Enabled == true)
                    {
                        FileAadhar.Enabled = false;
                        FilePan.Enabled = false;
                        btnsubmit.Enabled = false;
                        Response.Write("<script>alert('Your KYC request approved successfully')</script>");
                    }
                    //if (isApproved == "NO" && isRejected == "NO")
                    //{
                    //    Response.Write("<script>alert('Your KYC request in process')</script>");
                    //}
                }
            }
            //txtUserName.Text = "";
        }
        private void kyc_Reject()
        {
            cmd.CommandText = "select * from Registration_KYC where Username='" + txtUserName.Text + "'";
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                isRejected = dt.Rows[0]["isRejected"].ToString();
                if (isRejected == "YES")
                {
                    if (FileAadhar.Enabled == false && FilePan.Enabled == false)
                    {
                        FileAadhar.Enabled = true;
                        FilePan.Enabled = true;
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
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string strimg1 = FileAadhar.FileName.ToString();
            string filepathaadhar = "Images/" + FileAadhar.FileName;
            FileAadhar.PostedFile.SaveAs(Server.MapPath("~/Images/") + strimg1);

            string strimg2 = FilePan.FileName.ToString();
            string filepathpan = "Images/" + FilePan.FileName;
            FilePan.PostedFile.SaveAs(Server.MapPath("~/Images/") + strimg2);

            cmd.CommandText = "Insert into Registration_KYC(Username,Adhar_Card,Pan_Card) values(@user_name,@aadhar_photo,@pan_photo)";
            con.Open();
            cmd.Parameters.AddWithValue("@user_name", txtUserName.Text);
            cmd.Parameters.AddWithValue("@aadhar_photo", filepathaadhar.ToString());
            cmd.Parameters.AddWithValue("@pan_photo", filepathpan.ToString());
            int c1 = cmd.ExecuteNonQuery();
            if (c1 > 0)
            {
                Response.Write("<script>alert('KYC registration completed')</script>");
                Response.Redirect("DashBoard1.aspx");
            }
            else
            {
                Response.Write("<script>alert('KYC not registration')</script>");
            }
            //txtUserName.Text = "";
            con.Close();
        }
        protected void btnstatus_Click(object sender, EventArgs e)
        {
            kyc_Reject();
            checkstatus();
        }
    }
}
