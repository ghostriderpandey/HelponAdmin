using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class ManagePackage : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();

        DataTable dtMerchant = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGv();
            }
        }

        private void FillGv()
        {
            DataTable dtData = cls.selectDataTable("ProcManage_PackageDetail 'GetAll'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}