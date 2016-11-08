using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User
{
    public partial class UserCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Wrong Entries", "alert('Logged Out Timeout');", true);
                Response.Redirect("Login.aspx");

            }
            else
            {
                _lblUserName.Text = "Hello, " + Session["id"].ToString() + "!";
            }
        }
        protected void _btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/UserCRUD.aspx");
        }

        protected void _btnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("LogIn.aspx");
        }

        protected void _lnkbtnPermission_Click(object sender, EventArgs e)
        {
            Response.Redirect("TypeList.aspx");
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