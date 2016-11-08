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
    public partial class TypeCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            string TypeID = Request.QueryString["id"];
            string UserType = _txtbxUserType.Text.Trim();
            string Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            //SqlParameter LastID = new SqlParameter("LastID", 0);
            SqlConnection Connect = new SqlConnection(Conn);
            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT COUNT (*) FROM USERTYPE WHERE USERTYPENAME = @UserType", Connect);
            Cmd.Parameters.AddWithValue("@UserType", UserType);
            Int32 Count = (Int32)Cmd.ExecuteScalar();
            Connect.Close();
            if (Count == 0)
            {
                Connect.Open();
                Cmd = new SqlCommand("INSERT INTO USERTYPE (USERTYPENAME) VALUES (@UserType)", Connect);
                //int IDLast = 0;
                Cmd.Parameters.AddWithValue("@UserType", UserType);
                //Cmd.Parameters.Add(LastID);
                Cmd.ExecuteNonQuery();
                //IDLast = Convert.ToInt32(LastID.Value);
                Connect.Close();
                string scriptText = "alert('Record Added'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
            }
            else
            {
                if (TypeID == null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Existing')", true);
                    //string scriptText = "alert('Record Existing'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                }
                else
                {
                    Connect.Open();
                    UserType = _txtbxUserType.Text.Trim();
                    Cmd = new SqlCommand("SELECT COUNT (*) FROM USERTYPE WHERE USERTYPENAME=@UserType AND USERTYPEID!=@TypeID", Connect);
                    Cmd.Parameters.AddWithValue("@TypeID", TypeID);
                    Cmd.Parameters.AddWithValue("@UserType", UserType);
                    Count = (Int32)Cmd.ExecuteScalar();
                    Connect.Close();
                    if (Count > 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Existing')", true);
                    }
                    else
                    {
                        Connect.Open();
                        Cmd = new SqlCommand("UPDATE USERTYPE SET  USERTYPENAME=@UserType WHERE USERTYPEID=@TypeID", Connect);
                        Cmd.Parameters.AddWithValue("@TypeID", Request.QueryString["id"]);
                        Cmd.Parameters.AddWithValue("@UserType", _txtbxUserType.Text.Trim());
                        Cmd.ExecuteNonQuery();
                        Connect.Close();
                        string scriptText = "alert('Record Updated'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

                    }
                }
            }
        }

        protected void _txtbxUserType_PreRender(object sender, EventArgs e)
        {
            string TypeID = Request.QueryString["id"];
            if (TypeID == null)
            {

            }
            else
            {
                string Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
                SqlConnection Connect = new SqlConnection(Conn);
                Connect.Open();
                SqlCommand Cmd = new SqlCommand("SELECT * FROM USERTYPE WHERE USERTYPEID=@TypeID", Connect);
                Cmd.Parameters.AddWithValue("@TypeID", TypeID);
                SqlDataReader Reader = Cmd.ExecuteReader();
                while (Reader.Read())
                {
                    _txtbxUserType.Text = Reader["USERTYPENAME"].ToString();
                }
                Connect.Close();
                Connect.Open();
                Cmd = new SqlCommand("SELECT PERMITID FROM USERPERMIT WHERE USERTYPEID=@TypeID", Connect);
                Cmd.Parameters.AddWithValue("@TypeID", TypeID);
                Reader = Cmd.ExecuteReader();
                while (Reader.Read())
                {
                    ListItem PermitIDs = _chkbxlstAccess.Items.FindByValue(Reader["PERMITID"].ToString());
                    if (PermitIDs != null)
                    {
                        PermitIDs.Selected = true;
                    }
                    //for (int i=0; i < Reader.FieldCount; i++)
                    //{
                    //    _chkbxlstAccess.SelectedValue = Reader["PERMITID"].ToString();
                    //}
                }
                Connect.Close();
            }
        }
    }
}