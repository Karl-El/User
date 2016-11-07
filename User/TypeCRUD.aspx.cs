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
            string Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlConnection Connect = new SqlConnection(Conn);
            string TypeID = Request.QueryString["id"];
            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT * FROM USERTYPE WHERE USERTYPEID=@TypeID", Connect);
            Cmd.Parameters.AddWithValue("@TypeID", TypeID);
            SqlDataReader Reader = Cmd.ExecuteReader();
            while (Reader.Read())
            {
                _txtbxUserType.Text = Reader["USERTYPENAME"].ToString();
            }
            Connect.Close();
            //Connect.Open();
            //Cmd = new SqlCommand("SELECT PERMITID FROM USERPERMIT WHERE USERTYPEID=@TypeID", Connect);
            //Cmd.Parameters.AddWithValue("@TypeID", TypeID);
            //Reader = Cmd.ExecuteReader();
            //for (int i = 0; i < Reader.FieldCount; i++)
            //{
            //    _chkbxlstAccess.SelectedValue = Reader["PERMITID"].ToString();
            //}
            //Connect.Close();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            string UserType = _txtbxUserType.Text.Trim();
            string Conn = ConfigurationManager.ConnectionStrings["_cnnstrngUserDBOne"].ConnectionString;
            SqlParameter LastID = new SqlParameter("LastID", 0);
            SqlConnection Connect = new SqlConnection(Conn);
            Connect.Open();
            SqlCommand Cmd = new SqlCommand("SELECT COUNT (*) FROM USERTYPE WHERE USERTYPENAME = @UserType", Connect);
            Cmd.Parameters.AddWithValue("@UserType", UserType);
            Int32 Count = (Int32)Cmd.ExecuteScalar();
            Connect.Close();
            if (Count == 0)
            {
                Connect.Open();
                Cmd = new SqlCommand("INSERT INTO USERTYPE (USERTYPENAME) VALUES (@UserType); SELECT @LastID=SCOPE_IDENTITY()", Connect);
                int IDLast = 0;
                Cmd.Parameters.AddWithValue("@UserType", UserType);
                Cmd.Parameters.Add(LastID);
                Cmd.ExecuteNonQuery();
                IDLast = Convert.ToInt32(LastID.Value);
                Connect.Close();
            }
            else
            {
            }

        }
    }
}