using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Manage_Stock : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();

        DataTable dtMerchant = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];

            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");
                ddlCategory_SelectedIndexChanged(null, null);
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
            ddlSubCategory_SelectedIndexChanged(null, null);
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_Stock 'GetAll','" + ddlProduct.SelectedValue + "',0,'" + dtMerchant.Rows[0]["MID"] + "'");
            GvData.DataSource = dt;
            GvData.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlProduct, "ProcManage_MerchantProduct 'GetforDDL',0,'" + dtMerchant.Rows[0]["MID"] + "','" + ddlCategory.SelectedValue + "','"+ddlSubCategory.SelectedValue+"'", "Name", "ID");
            ddlProduct_SelectedIndexChanged(null, null);
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            cls.ExecuteQuery("Exec ProcManage_Stock 'insert','" + ddlProduct.SelectedValue + "','"+txtQty.Text.Trim()+"','" + dtMerchant.Rows[0]["MID"] + "','Merchant'");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Added')", true);
            FillGv(); 
        }
    }
}