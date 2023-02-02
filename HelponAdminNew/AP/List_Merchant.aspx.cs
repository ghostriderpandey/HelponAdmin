using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;

namespace HelponAdminNew.AP
{
    public partial class List_Merchant : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");
                cls.BindDropDownList(ddlSalesExecutive, "ProcMaster_SalesPerson 'Getforddl'", "Name", "ID");

                ddlCategory_SelectedIndexChanged(null, null);
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Main'", "Name", "ID");
           
        }
        private void FillGv()
        {
            List<MasterMerchant> merchants = new List<MasterMerchant>();
            // merchants = repo.GetMerchant(txtFromDate.Text.ToString(),txttoDate.Text.ToString()).FindAll(e=>(e.CID==Convert.ToInt32(ddlCategory.SelectedValue) || (ddlCategory.SelectedValue)=="0") && ((e.SCID==Convert.ToInt32(ddlSubCategory.SelectedValue) && e.SponserType== "SalesExecutive") || (ddlSubCategory.SelectedValue)=="0"));
            // Total Merchant
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "ListMerchant");
            param.Add("@fromDate", txtFromDate.Text);
            param.Add("@todate", txttoDate.Text);
            param.Add("@CID", ddlCategory.SelectedValue);
            param.Add("@SCID", ddlSubCategory.SelectedValue);
            param.Add("@SponserID", ddlSalesExecutive.SelectedValue);
            merchants = Connection.ReturnList<MasterMerchant>("ProcManage_Report", param).ToList();

            GvData.DataSource = merchants;
            GvData.DataBind();
           
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "IsDelete")
            {
                cls.ExecuteQuery("ProcMaster_AddMerchantByExcel 'Delete','" + e.CommandArgument + "'");
                FillGv();
            }
        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
               
                int chkv = 0;
                for (int i = 0; i < GvData.Rows.Count; i++)
                {

                    CheckBox chk = (CheckBox)GvData.Rows[i].FindControl("chkrow");
                    HiddenField id = (HiddenField)GvData.Rows[i].FindControl("hdnid");

                    if (chk.Checked == true)
                    {
                        cls.ExecuteQuery("ProcMaster_AddMerchantByExcel 'Delete','" + id.Value + "'");
                        chkv++;
                    }

                }
                if (chkv == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Select Atleast One CheckBox');Stoploader();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Deleted');Stoploader();", true);
                    FillGv();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "');Stoploader();", true);
            }
        }

      
    }
}