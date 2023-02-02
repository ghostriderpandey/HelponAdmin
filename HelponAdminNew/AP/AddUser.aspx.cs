using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class AddUser : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)this.Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj1.InnerText = obj.InnerText;
                cls.BindDropDownList(ddlUserType, "ProcMaster_UserType 'Getforddl'", "Type", "ID");
                cls.BindDropDownList(ddlState, "select StateID,StateName from tblMaster_State where IsActive=1", "StateName", "StateID");
                FillGv();
            }
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("ProcManage_Report 'UserList',0,'"+txtFromDate.Text+"','"+txttoDate.Text+"','"+txtSearchMobile.Text+"','"+ddlStatus.SelectedValue+"'");
            gvData.DataSource = dt;
            gvData.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlUserType.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select User Type')", true);
                return;
            }
            else if (txtFullName.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Enter Full Name')", true);
                return;
            }
            else if (txtMobile.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Enter Mobile Number')", true);
                return;
            }
            else if (ddlState.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select State')", true);
                return;
            }
            DataTable dtresult = cls.selectDataTable("ProcMaster_User 'insert',0,'"+ddlUserType.SelectedValue+"',2,'Admin','"+txtFullName.Text.Replace("'","")+"','','"+txtMobile.Text.Replace("'","")+"','','"+ddlState.SelectedValue+"',0,'','','"+txtMobile.Text.Replace("'","")+"','"+txtMobile.Text.Replace("'","")+"'");
            if (dtresult.Rows.Count > 0)
            {
                if (dtresult.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "');location.replace('AddUser.aspx')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "')", true);
                }
            }
        }

        protected void gvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "IsActive")
            {
                //cls.ExecuteQuery("ProcMaster_User 'IsActive','"+e.CommandArgument+"'");

                cls.ExecuteQuery("Update tblMaster_User SET IsApprove=1,ApproveDate=getdate() where UID='" + e.CommandArgument + "'");
                FillGv();
            }
            else if (e.CommandName == "IsDelete")
            {
                cls.ExecuteQuery("Delete tblMaster_User where UID='"+e.CommandArgument+"'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Delete Successfully');location.replace('AddUser.aspx')", true);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}