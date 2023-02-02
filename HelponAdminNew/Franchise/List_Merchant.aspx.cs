using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Franchise
{
    public partial class List_Merchant : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        DataTable dtFranchise = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FranchiseSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtFranchise = (DataTable)Session["FranchiseSession"];
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");

                ddlCategory_SelectedIndexChanged(null, null);
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Main'", "Name", "ID");
            ddlSubCategory_SelectedIndexChanged(null, null);
        }
        private void FillGv()
        {
            List<MasterMerchant> merchants = new List<MasterMerchant>();
            
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "ListMerchant");
            param.Add("@fromDate", txtFromDate.Text);
            param.Add("@todate", txttoDate.Text);
            param.Add("@CID", ddlCategory.SelectedValue);
            param.Add("@SCID", ddlSubCategory.SelectedValue);
            merchants = Connection.ReturnList<MasterMerchant>("ProcManage_Report", param).ToList();

            // Total Merchant
            GvData.DataSource = merchants;
            GvData.DataBind();

        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}