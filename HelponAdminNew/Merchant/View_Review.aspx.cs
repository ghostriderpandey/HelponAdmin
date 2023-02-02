using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class View_Review : System.Web.UI.Page
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
                FillGv();
            }
        }

        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_Report 'MerchantReview','" + dtMerchant.Rows[0]["MID"] + "','" + txtFromDate.Text + "','" + txttoDate.Text + "'");
            GvData.DataSource = dt;
            GvData.DataBind();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}