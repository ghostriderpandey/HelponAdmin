using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;


namespace HelponAdminNew.AP
{
    public partial class Dashboard : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtadminmaster = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            dtadminmaster = (DataTable)Session["AdminSession"];
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)this.Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj.InnerText = cls.ExecuteStringScalar("EXEC ProcGet_AdminMenuName '" + pagename + "'");
                obj1.InnerText = obj.InnerText;

                DataTable dtDashboard = cls.selectDataTable("Exec ProcManage_AdminDashboard");
                if (dtDashboard.Rows.Count > 0)
                {
                    lblTotalSlider.Text = dtDashboard.Rows[0]["TotalSlider"].ToString();
                    lblTotalBannerAds.Text = dtDashboard.Rows[0]["TotalBannerAds"].ToString();
                    lblTotalCategory.Text = dtDashboard.Rows[0]["TotalCategory"].ToString();
                    lblTotalSubCategory.Text = dtDashboard.Rows[0]["TotalSubCategory"].ToString();
                    lblPopularCategory.Text = dtDashboard.Rows[0]["PopularCategory"].ToString();
                    lblPopularCity.Text = dtDashboard.Rows[0]["PopularCity"].ToString();
                    lblTotalEcommerceCategory.Text = dtDashboard.Rows[0]["TotalEcommerceCategory"].ToString();
                    lblTotalEcommerceSubCategory.Text = dtDashboard.Rows[0]["TotalEcommerceSubCategory"].ToString();
                    lblTotalServiceRequest.Text = dtDashboard.Rows[0]["TotalServiceRequest"].ToString();
                    lblTotalProduct.Text = dtDashboard.Rows[0]["TotalProduct"].ToString();
                    lblTotalMerchant.Text = dtDashboard.Rows[0]["TotalMerchant"].ToString();
                    lblTotalPopularMerchant.Text = dtDashboard.Rows[0]["TotalPopularMerchant"].ToString();
                    lblTotalMerchantProduct.Text = dtDashboard.Rows[0]["TotalMerchantProduct"].ToString();
                    lblMerchantOrder.Text = dtDashboard.Rows[0]["MerchantOrder"].ToString();
                    lblTotalSalesPerson.Text = dtDashboard.Rows[0]["TotalSalesExecutive"].ToString();
                }
            }
        }
      
    }
}