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
        protected void Page_Load(object sender, EventArgs e)
        {

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
            TextBox USERTYPENAMETextBox = (TextBox)_lstvwTypeCRUD.EditItem.FindControl("USERTYPENAMETextBox");
            String Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlConnection Connect = new SqlConnection(Conn);
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
            TextBox USERTYPENAMETextBox = (TextBox)_lstvwTypeCRUD.InsertItem.FindControl("USERTYPENAMETextBox");
            String Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlConnection Connect = new SqlConnection(Conn);
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
            //Connect.Open();
            //Cmd = new SqlCommand("SELECT IDENT_CURRENT('USERTYPE')", Connect);
            //SqlDataReader Reader = Cmd.ExecuteReader();
            //while (Reader.Read())
            //{
            //    string TypeID = Reader.ToString();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", TypeID, true);
            //}
            //Connect.Close();
        }

        protected void _lstvwTypeCRUD_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {

        }

        protected void _lstvwTypeCRUD_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            CheckBoxList _chkbxlstPermit = (CheckBoxList)_lstvwTypeCRUD.InsertItem.FindControl("");
            String Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlConnection Connect = new SqlConnection(Conn);

            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT IDENT_CURRENT('USERTYPE')", Connect);
            SqlDataReader Reader = Cmd.ExecuteReader();
            while (Reader.Read())
            {
                int LastUserTypeID =Convert.ToInt32(Reader.GetSqlValue(0).ToString());
                Cmd = new SqlCommand("SELECT COUNT (*) FROM USERPERMIT WHERE USERTYPEID=@LastUserTypeID", Connect);
                Cmd.Parameters.AddWithValue("@LastUserTypeID", LastUserTypeID);
                Connect.Open();
                Int32 Count = (Int32)Cmd.ExecuteScalar();
                Connect.Close();
                if (Count > 0)
                {
                    for (int i = 0; i <= Count - 1; i++)
                    {
                        Connect.Open();
                        Cmd = new SqlCommand("DELETE FROM USERPERMIT WHERE USERTYPEID=@LastUserTypeID", Connect);
                        Cmd.Parameters.AddWithValue("@LastUserTypeID", LastUserTypeID);
                        Cmd.ExecuteNonQuery();
                        Connect.Close();

                    }

                    for (int i = 0; i <= _chkbxlstPermit.Items.Count - 1; i++)
                    {
                        if (_chkbxlstPermit.Items[i].Selected)
                        {
                            Connect.Open();
                            Cmd = new SqlCommand("INSERT INTO WORKERTRADE (WORKERID,TRADEID) VALUES (@WorkerID,@TradeID)", Connect);
                            Cmd.Parameters.AddWithValue("@WorkerID", WorkerID);
                            Cmd.Parameters.AddWithValue("@TradeID", _chkbxlstPermit.Items[i].Value);
                            Cmd.ExecuteNonQuery();
                            Connect.Close();
                        }

                    }
                    //string scriptText = "alert('Trade/s Modified'); window.location='" + Request.ApplicationPath + "TradeHandling.aspx'";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

                }
                Connect.Close();
        }
    }
}