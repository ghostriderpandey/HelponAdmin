using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class List_Appointment : System.Web.UI.Page
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }

        private void FillGv()
        {
            DataTable dtResult = new DataTable();
            dtResult = cls.selectDataTable("Exec ProcManage_Report 'Appointmentlist','"+dtMerchant.Rows[0]["MID"]+"','"+txtFromDate.Text+"','"+txttoDate.Text+"'");
            GvData.DataSource = dtResult;
            GvData.DataBind();
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }
    }
}