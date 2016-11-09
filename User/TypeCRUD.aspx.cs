using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}