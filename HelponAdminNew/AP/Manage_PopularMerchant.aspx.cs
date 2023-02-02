using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;
using HelponAdminNew.App_Data;

namespace HelponAdminNew.AP
{
    public partial class Manage_PopularMerchant : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");
                cls.BindDropDownList(ddlPopularCategory, "ProcManage_Popular 'GetforDDL'", "Name", "ID");
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Main'", "Name", "ID");
           
        }
        private void FillGv()
        {
            List<MasterMerchant> merchants = new List<MasterMerchant>();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "ListMerchant");
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

       
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlPopularCategory.SelectedValue == "0")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Popular Category')", true);
                    return;
                }
                int chkv = 0;
                for (int i = 0; i < GvData.Rows.Count; i++)
                {

                    CheckBox chk = (CheckBox)GvData.Rows[i].FindControl("chkrow");
                    HiddenField id = (HiddenField)GvData.Rows[i].FindControl("hdnid");
                   
                    if (chk.Checked == true)
                    {
                        if((cls.ExecuteIntScalar("select Count(*) from tblManage_PopularMerchant where PopularID='"+ddlPopularCategory.SelectedValue+"' and MID='" + id.Value + "'")) == 0)
                        {
                            cls.ExecuteQuery("insert into tblManage_PopularMerchant(CID,SCID,PopularID,MID)values('" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','" + ddlPopularCategory.SelectedValue + "','" + id.Value + "')");
                        }
                       
                        chkv++;
                    }

                }
                if (chkv == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Select Atleast One CheckBox');Stoploader();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Added');Stoploader();", true);
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