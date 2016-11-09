using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void _btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserList.aspx");
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

        protected void _lnkbtnUserName_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");

        }
    }
}