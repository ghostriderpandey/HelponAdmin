using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class List_Franchise : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGv();
            }
        }
      
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_Report 'ListFranchise',0,'"+txtFromDate.Text+"','"+txttoDate.Text+"'");
            GvData.DataSource = dt;
            GvData.DataBind();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}