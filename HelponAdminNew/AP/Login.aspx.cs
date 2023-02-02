using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class Login : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dt = new DataTable();
        DataTable dtMenuAdmin = new DataTable();
        DataTable dtCompanyAdmin = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Logout"] != null)
                {
                    Session["dtMenuAdmin"] = null;
                    Session["AdminSession"] = null;
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (chkremember.Checked == true)
            {
                Response.Cookies["userid"].Value = txtUserName.Text.Trim();
                Response.Cookies["pass"].Value = txtPassword.Text.Trim();
                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(1);
                Response.Cookies["pass"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["pass"].Expires = DateTime.Now.AddDays(-1);
            }

            cls.loginname = txtUserName.Text.Trim();
            cls.password = txtPassword.Text.Trim();
            cls.action = "AdminPanel";
            cls.IpAddress = Request.ServerVariables["REMOTE_ADDR"].ToString();

            dt = cls.AdminLoginAuthentication();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                   // string str = "select *,case MenuLink when '#' then '$' else MenuName end as PageName,substring(cssClass,0,CHARINDEX('$', cssClass)) as cssClass0,substring(cssClass,CHARINDEX('$', cssClass)+1,LEN(cssClass)-CHARINDEX('$', cssClass)) as cssClass1 from tblMaster_MenuAdmin where IsActive<>0 and MenuID in(Select Word from dbo.SplitPra('" + dt.Rows[0]["MenuStr"].ToString() + "')) order by parentid,position";
                    //dtMenuAdmin = cls.GetDataTable(str);
                    Session.Add("dtMenuAdmin", dtMenuAdmin);
                    Session.Add("AdminSession", dt);
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"].ToString() + "')", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid UserID/password !!')", true);
                return;
            }
        }
    }
}