using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Configuration;

namespace User
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void _btnLogIn_Click(object sender, EventArgs e)
        {
            String Connect = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlConnection Con = new SqlConnection(Connect);
            SqlCommand Cmd = new SqlCommand("SELECT * FROM USERS WHERE USERNAME=@UserName AND USERPASS=@UserPass", Con);
            Cmd.Parameters.AddWithValue("@UserName", _txtbxUserName.Text.Trim());
            Cmd.Parameters.AddWithValue("@UserPass", _txtbxUserPass.Text.Trim());
            SqlDataAdapter Adapt = new SqlDataAdapter(Cmd);
            DataTable DTable = new DataTable();
            Adapt.Fill(DTable);
            Con.Open();
            if (DTable.Rows.Count > 0)
            {
                Session["id"] = _txtbxUserName.Text;
                Cmd = new SqlCommand("SELECT * FROM USERS WHERE USERNAME=@UserName", Con);
                Cmd.Parameters.AddWithValue("@UserName", _txtbxUserName.Text.Trim());
                SqlDataReader Reader = Cmd.ExecuteReader();
                while (Reader.Read())
                {
                    int UserTypeID = Convert.ToInt32(Reader["USERTYPEID"].ToString());
                    if (UserTypeID == 1)
                    {
                        Response.Redirect("UserList.aspx");
                    }
                    else
                    {
                        Response.Redirect("UserViewOnlyList.aspx");
                    }
                }

            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Wrong Entries", "alert('Invalid Entries');", true);
            }
            Con.Close();
        }
    }
}