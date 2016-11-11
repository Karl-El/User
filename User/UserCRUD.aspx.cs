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
    public partial class UserCRUD : System.Web.UI.Page
    {
        int UserTypeID = 0;
        string CurrentUser = null;
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
                CurrentUser = Session["id"].ToString();
                SqlCommand Cmd = new SqlCommand("SELECT * FROM USERS WHERE USERNAME=@UserName", Connect);
                Cmd.Parameters.AddWithValue("@UserName", CurrentUser);

                Connect.Open();
                SqlDataReader Reader = Cmd.ExecuteReader();
                while (Reader.Read())
                {
                    UserTypeID = Convert.ToInt32(Reader["USERTYPEID"].ToString());
                    if (UserTypeID == 1)
                    {
                        _lnkbtnPermission.Visible = true;
                    }
                    else
                    {
                        _lnkbtnPermission.Visible = false;
                    }
                }
                Connect.Close();

            }
        }
        protected void _lstvwUserCRUD_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var EditButton = (Button)e.Item.FindControl("EditButton");
                var DeleteButton = (Button)e.Item.FindControl("DeleteButton");

            }

        }
        protected void _lstvwUserCRUD_DataBound(object sender, EventArgs e)
        {
            if (_lstvwUserCRUD.Items.Count > 0)
            {
                _lstvwUserCRUD.InsertItemPosition = InsertItemPosition.None;
                _lstvwUserCRUD.DataBind();
            }
        }
        protected void _lstvwUserCRUD_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            string scriptText = "alert('Record Inserted'); window.location='" + Request.ApplicationPath + "UserList.aspx'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);
        }
        protected void _lstvwUserCRUD_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            string scriptText = "alert('Record Updated'); window.location='" + Request.ApplicationPath + "UserList.aspx'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

        }
        protected void _lstvwUserCRUD_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            string scriptText = "alert('Record Deleted'); window.location='" + Request.ApplicationPath + "UserList.aspx'";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", scriptText, true);

        }

    }
}