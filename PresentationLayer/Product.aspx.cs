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
        BL_Product BLProduct = new BL_Product();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProdGrid(); BindBrandRdBtnLst();
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
    }
}