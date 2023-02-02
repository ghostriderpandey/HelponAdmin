using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.Merchant
{
    public partial class Dashboard : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            DataTable dtMerchant = (DataTable)Session["MerchantSession"];
            DataTable dtDashbaord = cls.selectDataTable("Exec ProcManage_MerchantDashboard '" + dtMerchant.Rows[0]["MID"] + "'");
            if (dtDashbaord.Rows.Count > 0)
            {
                lblTotalAppointment.InnerText = dtDashbaord.Rows[0]["TotalAppointment"].ToString();
                lblTotalEnquiry.InnerText = dtDashbaord.Rows[0]["TotalEnquiry"].ToString();
                lblTotalorder.InnerText = dtDashbaord.Rows[0]["TotalOrder"].ToString();
                lblKYC.InnerText = dtDashbaord.Rows[0]["KYCStatus"].ToString();
            }
        }
    }
}