using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class View_MerchantProduct : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");
                cls.BindDropDownList(ddlMerchant, "ProcMaster_Merchant 'GetforDDL'", "Name", "MID");
                ddlCategory_SelectedIndexChanged(null, null);
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
            ddlSubCategory_SelectedIndexChanged(null, null);
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_MerchantProduct 'GetAll',0,'" + ddlMerchant.SelectedValue + "','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','"+ddlStatus.SelectedValue+"'");
            GvData.DataSource = dt;
            GvData.DataBind();
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            cls.ExecuteQuery("Exec [ProcManage_MerchantProduct] '" + e.CommandName+"','" + e.CommandArgument + "'");
            FillGv();

        }

        protected void ddlMerchant_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
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
                        cls.ExecuteQuery("Delete tblManage_MerchantProduct where ID='"+id.Value+"'");
                       // cls.ExecuteQuery("ProcManage_MerchantProduct 'Delete','" + id.Value + "'");
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