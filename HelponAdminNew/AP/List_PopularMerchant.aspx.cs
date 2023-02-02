using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;

namespace HelponAdminNew.AP
{
    public partial class List_PopularMerchant : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlPopularCategory, "ProcManage_Popular 'GetforDDL'", "Name", "ID");

            }
        }
       
        private void FillGv()
        {
            List<MasterMerchant> merchants = new List<MasterMerchant>();
            merchants = Connection.Query<MasterMerchant>("select p.ID,a.PopularID,b.* from tblManage_PopularMerchant a inner join ViewManage_Merchant b on a.MID=b.MID  inner join tblManage_Popular p on p.ID=a.PopularID").ToList().FindAll(e=>e.PopularID == Convert.ToInt32(ddlPopularCategory.SelectedValue) || ddlPopularCategory.SelectedValue=="0");
            // Total Merchant
            GvData.DataSource = merchants;
            GvData.DataBind();
           
        }   

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "IsDelete")
            {
                cls.ExecuteQuery("Delete tblManage_PopularMerchant where ID='" + e.CommandArgument + "'");
                FillGv();
            }
        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void ddlPopularCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}