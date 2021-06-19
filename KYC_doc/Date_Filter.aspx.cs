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
    public partial class Date_Filter : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string cnfg = ConfigurationManager.ConnectionStrings["CN"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(cnfg);
            cmd = new SqlCommand();
            cmd.Connection = con;
            //if (IsPostBack)
            //{
            //    LoadData();

            //}
        }
        //private void LoadData()
        //{
           
        //}
        //private void cleardata()
        //{
        //    txtfrom.Clear();
        //    txtto.Clear();
       
        //}
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            cmd.CommandText = "Select * from Date_Filter where Date between '" + txtfrom.Text + "' And '" + txtto.Text + "'";

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
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
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            
        }
    }
}