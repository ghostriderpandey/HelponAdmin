using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class List_MerchantCoupon : System.Web.UI.Page
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
                if (!IsPostBack)
                {
                    cls.BindDropDownList(ddlType, "select * from tblMaster_CouponType", "Name", "ID");
                    btnSearch_Click(null, null);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_Report 'MerchantCouponlist',0,'"+txtFromDate.Text+"','"+txtToDate.Text+"','"+txtUserID.Text+"','"+ddlType.SelectedValue+"'");
            GvData.DataSource = dt;
            GvData.DataBind();
        }
    }
}