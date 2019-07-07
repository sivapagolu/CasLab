using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace caslab12thapril
{
    public partial class CreateLogins : System.Web.UI.Page
    {

        string str = ConfigurationManager.ConnectionStrings["MyDbCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GridView1.DataBind();
                DataBind();

                ecode.Items.Insert(0, new System.Web.UI.WebControls.ListItem("  select Ecode    ", " "));
                ecode.AppendDataBoundItems = true;



                String strQuery = "select empid from AddEmployee where UserName is Null";
                SqlConnection con = new SqlConnection(str);

                SqlCommand cmd = new SqlCommand();
                //cmd.Parameters.AddWithValue("@EmpId", empid.Text);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ecode.DataSource = cmd.ExecuteReader();
                    ecode.DataTextField = "empid";
                    ecode.DataValueField = "empid";
                    ecode.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }

            }


        }















        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            //GridViewRow grow = GridView1.SelectedRow;
            //editcode.Text = grow.Cells[1].Text;
            RadioButton btn = (RadioButton)sender;
            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            editcode.Text = gvr.Cells[1].Text;
            editname.Text = gvr.Cells[2].Text;
            editmaterial.Text = gvr.Cells[3].Text;
            editquantaity.Text = gvr.Cells[4].Text;
            editunits.Text = gvr.Cells[5].Text;
            //editdocumentname.Text = gvr.Cells[6].Text;






        }







        protected void EditButton_Click(object sender, EventArgs e)
        {
            string Ecode = editcode.Text;
            using (SqlConnection con = new SqlConnection(str))
            {

                SqlCommand cmd = new SqlCommand("update AddEmployee set   UserName=@UserName, Password=@Password,compenymail=@compenymail where EmpId=@EmpId", con);


                try
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@UserName", editmaterial.Text);
                    cmd.Parameters.AddWithValue("@Password", editquantaity.Text);
                    cmd.Parameters.AddWithValue("@compenymail", editunits.Text);
                    cmd.Parameters.AddWithValue("@EmpId", Ecode);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                }
                catch
                {

                }
            }
        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#addrawmaterial').modal('show')", true);


            String strQuery = "select * from AddEmployee where empid=@empid ";

            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@empid", ecode.SelectedItem.Text);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    txtname.Text = sdr.GetValue(2).ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }



        protected void Save_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(str);
            int i = 0;
            if (i == 0)
            {
                SqlCommand cmd = new SqlCommand("pro_employeelogindetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                cmd.Parameters.AddWithValue("@statement", "update");
                cmd.Parameters.AddWithValue("@EmpId", Convert.ToString(ecode.Text.Trim()));
                cmd.Parameters.AddWithValue("@Name", Convert.ToString(txtname.Text.Trim()));
                cmd.Parameters.AddWithValue("@LoginID", Convert.ToString(txtlogin.Text.Trim()));
                cmd.Parameters.AddWithValue("@Password", Convert.ToString(txtpass.Text.Trim()));
                cmd.Parameters.AddWithValue("@EmailID", Convert.ToString(email.Text.Trim()));
                //cmd.Parameters.AddWithValue("@UserName", Convert.ToString(txtlogin.Text.Trim()));
                //cmd.Parameters.AddWithValue("@pass", Convert.ToString(txtpass.Text.Trim()));
                //cmd.Parameters.AddWithValue("@compenymail", Convert.ToString(email.Text.Trim()));
                cmd.Parameters.AddWithValue("@status", "nostatus");
                cmd.ExecuteNonQuery();
                con.Close();


            }
            int j = 0;
            if (j == 0)
            {
                SqlCommand cmd = new SqlCommand("pro_employeelogindetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                cmd.Parameters.AddWithValue("@statement", "insert");
                cmd.Parameters.AddWithValue("@EmpId", Convert.ToString(ecode.Text.Trim()));
                cmd.Parameters.AddWithValue("@Name", Convert.ToString(txtname.Text.Trim()));
                cmd.Parameters.AddWithValue("@LoginID", Convert.ToString(txtlogin.Text.Trim()));
                cmd.Parameters.AddWithValue("@Password", Convert.ToString(txtpass.Text.Trim()));
                cmd.Parameters.AddWithValue("@EmailID", Convert.ToString(email.Text.Trim()));
                //cmd.Parameters.AddWithValue("@UserName", Convert.ToString(txtlogin.Text.Trim()));
                //cmd.Parameters.AddWithValue("@pass", Convert.ToString(txtpass.Text.Trim()));
                //cmd.Parameters.AddWithValue("@compenymail", Convert.ToString(email.Text.Trim()));
                cmd.Parameters.AddWithValue("@status", "nostatus");
                cmd.ExecuteNonQuery();
                con.Close();

            }
            GridView1.DataBind();
        }

        protected void unlock_Click(object sender, EventArgs e)
        {

            string employeecode = editcode.Text;
            using (SqlConnection con = new SqlConnection(str))
            {

                SqlCommand cmd = new SqlCommand("update AddEmployee set status='Active'where EmpId=@EmpId", con);


                try
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@EmpId", employeecode);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void editpopup_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#listofrawmaterialedit').modal('show')", true);

            GridView1.DataBind();
        }
    }
}
