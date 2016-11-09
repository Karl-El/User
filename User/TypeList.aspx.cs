using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User
{
    public partial class TypeList : System.Web.UI.Page
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
                LinkButton _lnkbtnUserName = (LinkButton)Page.Master.FindControl("_lnkbtnUserName");
                _lnkbtnUserName.Text = "Hello, " + Session["id"].ToString() + "!";
            }
        }
        protected void _lstvwTypeList_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var _hyprlnkEditPermit = (HyperLink)e.Item.FindControl("_hyprlnkEditPermit");
                var _blltlstPermit = (BulletedList)e.Item.FindControl("_blltlstPermit");
                if (_blltlstPermit.Items.Count == 0)
                {
                    _hyprlnkEditPermit.Text = "Add Permission";
                    _blltlstPermit.Items.Add("No Permission Granted");
                }
                else
                {
                    _hyprlnkEditPermit.Text = "Edit Permission";
                }

            }

        }
    }
}