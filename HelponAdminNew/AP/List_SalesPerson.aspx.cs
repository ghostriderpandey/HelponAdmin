using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;

namespace HelponAdminNew.AP
{
    public partial class List_SalesPerson : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

            repo.BindDropDownList(ddlDistrict, "GetCity", Convert.ToInt32(ddlState.SelectedValue), "Name", "ID");
        }
        private void FillGv()
        {
            DataTable dtdata = cls.selectDataTable("Exec ProcManage_Report 'List_SalesPerson',0,'"+txtFromDate.Text+"','"+txttoDate.Text+"','"+txtMobile.Text+"'");
            GvData.DataSource = dtdata;
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
                        cls.ExecuteQuery("Delete tblMaster_SalesPerson where ID='" + id.Value + "'");
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