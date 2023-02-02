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
    public partial class Manage_ChangePassword : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtUserMaster = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Dashboard.aspx");
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
                dtUserMaster = (DataTable)Session["AdminSession"];
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Dashboard.aspx");
                return;
            }
            dtUserMaster = (DataTable)Session["AdminSession"];
            if (txtCurrentPassword.Text.Trim() != dtUserMaster.Rows[0]["Password"].ToString())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Invalid Current Password !!');", true);
                return;
            }
            else if (txtpassword.Text.Trim() != txtConfirmpassword.Text.Trim())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Password Mismatch !!');", true);
                return;
            }
            else
            {
                Session["dtMenuAdmin"] = null;
                Session["AdminSession"] = null;
                cls.ExecuteQuery("Update tblMaster_Employee SET Password='" + txtpassword.Text.Trim() + "' Where EmployeeID='" + dtUserMaster.Rows[0]["EmployeeID"].ToString() + "'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Password Successfully Changed !!');location.replace('Login.aspx');", true);
            }
        }
    }
}