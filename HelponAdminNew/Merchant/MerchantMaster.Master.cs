using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.Merchant
{
    public partial class MerchantMaster : System.Web.UI.MasterPage
    {
        Cls_Connection cls = new Cls_Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                DataTable dtMerchant = (DataTable)Session["MerchantSession"];
                lblMerchantName.Text = dtMerchant.Rows[0]["Name"].ToString();
                DataTable dt = cls.selectDataTable("select a.ID,Name,PaymentMode,(select Sum(NetAmount) from tblManage_OrderDetail where OrderID=a.ID) as NetAmount,convert(varchar,a.AddDate) as Date from tblManage_Order a inner join tblMaster_Customer c on a.CustomerID=c.ID where MID='" + dtMerchant.Rows[0]["MID"] + "' and (CONVERT(date,a.AddDate)=CONVERT(date,getdate()))");
                var strcount = cls.ExecuteStringScalar("select count(*) from tblManage_Order a inner join tblMaster_Customer c on a.CustomerID=c.ID where MID='" + dtMerchant.Rows[0]["MID"] + "' and (CONVERT(date,a.AddDate)=CONVERT(date,getdate()))");
                Session["NotifcationCount"] = strcount;
                rpNotification.DataSource = dt;
                rpNotification.DataBind();
            }
        }
    }
}