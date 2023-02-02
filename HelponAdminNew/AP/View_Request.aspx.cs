using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class View_Request : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
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
            dtResult = cls.selectDataTable("Exec ProcManage_Report 'RequestList',0,'" + txtFromDate.Text.Replace("'", "").Trim() + "','" + txttoDate.Text.Replace("'", "").Trim() + "'");
            GvData.DataSource = dtResult;
            GvData.DataBind();
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }
    }
}