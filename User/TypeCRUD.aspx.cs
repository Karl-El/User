using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace User
{
    public partial class TypeCRUD : System.Web.UI.Page
    {
        String Conn = ConfigurationManager.ConnectionStrings["_cnnctstrngUserDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton _lnkbtnPermission = (LinkButton)Page.Master.FindControl("_lnkbtnPermission");
            LinkButton _lnkbtnUserList = (LinkButton)Page.Master.FindControl("_lnkbtnUserList");
            LinkButton _lnkbtnLogOut = (LinkButton)Page.Master.FindControl("_lnkbtnLogOut");
            if (Session["id"] == null)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Wrong Entries", "alert('Logged Out Timeout');", true);
                Response.Redirect("Login.aspx");

            }
            else
            {
                SqlConnection Connect = new SqlConnection(Conn);
                LinkButton _lnkbtnUserName = (LinkButton)Page.Master.FindControl("_lnkbtnUserName");
                _lnkbtnUserName.Text = "Hello, " + Session["id"].ToString() + "!";
                string CurrentUser = Session["id"].ToString();
                SqlCommand Cmd = new SqlCommand("SELECT * FROM USERS WHERE USERNAME=@UserName", Connect);
                Cmd.Parameters.AddWithValue("@UserName", CurrentUser);
                Connect.Open();
                SqlDataReader Reader = Cmd.ExecuteReader();
                while (Reader.Read())
                {
                    int UserTypeID = Convert.ToInt32(Reader["USERTYPEID"].ToString());
                    if (UserTypeID == 1)
                    {
                        _lnkbtnPermission.Visible = true;
                    }
                }
                Connect.Close();
            }
        }

        protected void _lstvwTypeCRUD_DataBound(object sender, EventArgs e)
        {
            if (_lstvwTypeCRUD.Items.Count > 0)
            {
                _lstvwTypeCRUD.InsertItemPosition = InsertItemPosition.None;
                _lstvwTypeCRUD.DataBind();
            }
        }

        protected void _lstvwTypeCRUD_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            SqlConnection Connect = new SqlConnection(Conn);
            TextBox USERTYPENAMETextBox = (TextBox)_lstvwTypeCRUD.EditItem.FindControl("USERTYPENAMETextBox");
            string UserTypeName = USERTYPENAMETextBox.Text.Trim();
            string UserTypeID = e.Keys[0].ToString().Trim();

            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT COUNT (*) FROM USERTYPE WHERE USERTYPENAME=@UserTypeName AND USERTYPEID!=@UserTypeID", Connect);
            Cmd.Parameters.AddWithValue("@UserTypeName", UserTypeName);
            Cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
            Int32 Count = (Int32)Cmd.ExecuteScalar();
            if (Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Existing')", true);
                e.Cancel = true;

            }
        }

        protected void _lstvwTypeCRUD_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            SqlConnection Connect = new SqlConnection(Conn);
            TextBox USERTYPENAMETextBox = (TextBox)_lstvwTypeCRUD.InsertItem.FindControl("USERTYPENAMETextBox");
            string UserTypeName = USERTYPENAMETextBox.Text.Trim();

            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT COUNT (*) FROM USERTYPE WHERE USERTYPENAME=@UserTypeName", Connect);
            Cmd.Parameters.AddWithValue("@UserTypeName", UserTypeName);
            Int32 Count = (Int32)Cmd.ExecuteScalar();
            if (Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Existing')", true);
                e.Cancel = true;

            }
            Connect.Close();
        }

        protected void _lstvwTypeCRUD_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            int UserTypeID = Convert.ToInt32(Request.QueryString["id"]);
            CheckBoxList _chkbxlstPermit = (CheckBoxList)_lstvwTypeCRUD.EditItem.FindControl("_chkbxlstPermit");
            SqlConnection Connect = new SqlConnection(Conn);

            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT COUNT (*) FROM USERPERMIT WHERE USERTYPEID=@UserTypeID", Connect);
            Cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
            Connect.Close();
            Connect.Open();
            Int32 Count = (Int32)Cmd.ExecuteScalar();
            Connect.Close(); if (Count > 0)
            {
                for (int i = 0; i <= Count - 1; i++)
                {
                    Connect.Open();
                    Cmd = new SqlCommand("DELETE FROM USERPERMIT WHERE USERTYPEID=@UserTypeID AND PERMITID!=1", Connect);
                    Cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
                    Cmd.ExecuteNonQuery();
                    Connect.Close();

                }

                for (int i = 0; i <= _chkbxlstPermit.Items.Count - 1; i++)
                {
                    if (_chkbxlstPermit.Items[i].Selected)
                    {
                        Connect.Open();
                        Cmd = new SqlCommand("INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (@UserTypeID,@PermitID)", Connect);
                        Cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
                        Cmd.Parameters.AddWithValue("@PermitID", _chkbxlstPermit.Items[i].Value);
                        Cmd.ExecuteNonQuery();
                        Connect.Close();
                    }

                }
                string scriptText = "alert('Permission Updated'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

            }
            else
            {
                for (int i = 0; i <= _chkbxlstPermit.Items.Count - 1; i++)
                {
                    if (_chkbxlstPermit.Items[i].Selected)
                    {
                        Connect.Open();
                        Cmd = new SqlCommand("INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (@UserTypeID,@PermitID)", Connect);
                        Cmd.Parameters.AddWithValue("@UserTypeID", UserTypeID);
                        Cmd.Parameters.AddWithValue("@PermitID", _chkbxlstPermit.Items[i].Value);
                        Cmd.ExecuteNonQuery();
                        Connect.Close();
                        string scriptText = "alert('Permission Added'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
                    }
                }
            }

        }

        protected void _lstvwTypeCRUD_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            SqlConnection Connect = new SqlConnection(Conn);
            int LastUserTypeID = 0;
            CheckBoxList _chkbxlstPermit = (CheckBoxList)_lstvwTypeCRUD.InsertItem.FindControl("_chkbxlstPermit");

            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT IDENT_CURRENT('USERTYPE')", Connect);
            SqlDataReader Reader = Cmd.ExecuteReader();
            while (Reader.Read())
            {
                LastUserTypeID = Convert.ToInt32(Reader.GetSqlValue(0).ToString());
            }
            Connect.Close();
            Connect.Open();
            Cmd = new SqlCommand("INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (@UserTypeID,'1')", Connect);
            Cmd.Parameters.AddWithValue("@UserTypeID", LastUserTypeID);
            //Cmd.Parameters.AddWithValue("@PermitID", _chkbxlstPermit.Items[i].Value);
            Cmd.ExecuteNonQuery();
            Connect.Close();
            for (int i = 0; i <= _chkbxlstPermit.Items.Count - 1; i++)
            {
                if (_chkbxlstPermit.Items[i].Selected)
                {
                    Connect.Open();
                    Cmd = new SqlCommand("INSERT INTO USERPERMIT (USERTYPEID,PERMITID) VALUES (@LastUserTypeID,@PermitID)", Connect);
                    Cmd.Parameters.AddWithValue("@LastUserTypeID", LastUserTypeID);
                    Cmd.Parameters.AddWithValue("@PermitID", _chkbxlstPermit.Items[i].Value);
                    Cmd.ExecuteNonQuery();
                    Connect.Close();
                }
            }
            string scriptText = "alert('Record Inserted'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
        }

        protected void _lstvwTypeCRUD_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            string scriptText = "alert('Record Deleted'); window.location='" + Request.ApplicationPath + "TypeList.aspx'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
        }

        protected void _lstvwTypeCRUD_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var EditButton = (Button)e.Item.FindControl("EditButton");
                var DeleteButton = (Button)e.Item.FindControl("DeleteButton");
                int UserTypeID = Convert.ToInt32(Request.QueryString["id"]);
                if (UserTypeID == 1)
                {
                    EditButton.Visible = false; 
                    DeleteButton.Visible = false;
                }
            }
        }
    }
}