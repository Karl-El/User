using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DataAccessLayer;

namespace BusinessLayer
{
    public class BL_Product
    {
        DAL_Product DA = new DAL_Product();
        SqlCommand Cmd = new SqlCommand();
        public int Prod_Id { get; set; }
        public string Prod_Brand { get; set; }
        public string Prod_Model { get; set; }
        public string Prod_Price { get; set; }

        public DataSet ProdSelect()
        {
            return DA.Select_Prod();
        }

        public void ProdInsert()
        {
            Cmd.Parameters.AddWithValue("@PRODID", Prod_Id);
            Cmd.Parameters.AddWithValue("@BRAND", Prod_Brand);
            Cmd.Parameters.AddWithValue("@MODEL", Prod_Model);
            Cmd.Parameters.AddWithValue("@PRICE", Prod_Price);
            DA.Insert_Prod(Cmd);
        }

        public void ProdUpdate(int ProdID)
        {
            Cmd.Parameters.AddWithValue("@PRODID", Prod_Id); 
            Cmd.Parameters.AddWithValue("@BRAND", Prod_Brand);
            Cmd.Parameters.AddWithValue("@MODEL", Prod_Model);
            Cmd.Parameters.AddWithValue("@PRICE", Prod_Price);
            DA.Update_Prod(Cmd);
        }

        public void ProdDelete(int ProdID)
        {
            Cmd.Parameters.AddWithValue("@PRODID", Prod_Id);
            DA.Delete_Prod(Cmd);
        }
    }
}
