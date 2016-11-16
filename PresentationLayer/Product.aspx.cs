using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;


namespace PresentationLayer
{
    public partial class Product : System.Web.UI.Page
    {
        string message = null;
        public string SelectedBrand = null;
        BL_Product BLProduct = new BL_Product();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProdGrid(); 
                BindBrandRdBtnLst();
            }
        }

        public void BindProdGrid()
        {
            _grdvwProd.DataSource = BLProduct.ProdSelect();
            _grdvwProd.DataBind();
        }

        public void BindBrandRdBtnLst()
        {
            _rdbtnlstBrand.DataSource = BLProduct.BrandSelect();
            _rdbtnlstBrand.DataTextField = "BRAND";
            _rdbtnlstBrand.DataValueField = "BRAND";
            _rdbtnlstBrand.DataBind();
        }
        
        protected void _rdbtnlstBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            SelectedBrand = _rdbtnlstBrand.SelectedItem.Text;
            BrandSelected.FilteredBrand Service = new BrandSelected.FilteredBrand();
            _grdvwProd.DataSource = Service.Select_ProdByBrand();
            _grdvwProd.DataBind();
        }

        public void AlertAndClear()
        {
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += Request.Url.AbsoluteUri;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }

        protected void _grdvwProd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            _grdvwProd.PageIndex = e.NewPageIndex;
            BindProdGrid(); 
        }

        protected void _btnInsert_Click(object sender, EventArgs e)
        {
            BLProduct.Prod_Brand = _txtbxBrand.Text.Trim();
            BLProduct.Prod_Model = _txtbxModel.Text.Trim();
            BLProduct.Prod_Price = _txtbxPrice.Text.Trim();
            BLProduct.ProdInsert();
            BindProdGrid();
            message = "Record Inserted"; AlertAndClear();
        }


        protected void _btnUpdate_Click(object sender, EventArgs e)
        {
            BLProduct.Prod_Id = Convert.ToInt32(_txtbxProdID.Text.Trim());
            BLProduct.Prod_Brand = _txtbxBrand.Text.Trim();
            BLProduct.Prod_Model = _txtbxModel.Text.Trim();
            BLProduct.Prod_Price = _txtbxPrice.Text.Trim();
            BLProduct.ProdUpdate(BLProduct.Prod_Id);
            BindProdGrid();
            message = "Record Updated"; AlertAndClear();
        }

        protected void _btnDelete_Click(object sender, EventArgs e)
        {
            BLProduct.Prod_Id = Convert.ToInt32(_txtbxProdID.Text.Trim());
            BLProduct.ProdDelete(BLProduct.Prod_Id);
            BindProdGrid();
            message = "Record Deleted"; AlertAndClear();
        }
    }
}