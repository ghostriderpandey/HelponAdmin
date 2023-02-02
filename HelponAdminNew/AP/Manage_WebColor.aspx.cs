using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class Manage_WebColor : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)this.Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj.InnerText = cls.ExecuteStringScalar("EXEC ProcGet_AdminMenuName '" + pagename + "'");
                obj1.InnerText = obj.InnerText;
                FillData();
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcManage_WebColor 'GetAll'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int RowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            string txtColor = ((TextBox)GvData.Rows[RowIndex].FindControl("txtColor")).Text;
            string txtBgColor = ((TextBox)GvData.Rows[RowIndex].FindControl("txtBgColor")).Text;
            cls.ExecuteQuery("ProcManage_WebColor 'Update','" + e.CommandArgument + "','" + txtColor+"','"+txtBgColor+"'");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Update Successfully')", true);
            FillData();
        }

        protected void GvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}