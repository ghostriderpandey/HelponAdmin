using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


public partial class HostAdmin_HostAdminMst : System.Web.UI.MasterPage
{
    Cls_Connection cls = new Cls_Connection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {

                //Check Page View Permission
                if (Session["ShowMsg"] != null)
                {
                    if (Session["ShowMsg"].ToString() == "1")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Notification", "Notification();", true);
                        Session["ShowMsg"] = "0";
                    }
                }
                //string CurrentPageName = cls.GetCurrentPageName();
                //if ("HostAdminHome.aspx" != CurrentPageName.ToString())
                //{
                //    if ("UserProfile.aspx" != CurrentPageName.ToString())
                //    {
                //        if ("ChangePassword.aspx" != CurrentPageName.ToString())
                //        {
                //            if (cls.User_PageViewPermission().Trim() == "0")
                //            {
                //                Response.Redirect(Request.UrlReferrer.ToString(), false);
                //                Session["ShowMsg"] = "1";
                //            }
                //        }
                //    }
                //}
                //Manage User Log Details [View] Process
               // AccessDatabase.Insert_TrnUserLog("View", "0");
            }
            catch(Exception ex)
            {
                Response.Redirect("HostAdminHome.aspx", false);
                Session["ShowMsg"] = "1";
            }
        }
    }


    protected void lbtn_Click(object sender, EventArgs e)
    {

    }
    protected void lnbtnlogout_Click(object sender, EventArgs e)
    {
        Session["HostUserName"] = "";
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Session.Contents.RemoveAll();
        Response.Redirect("../HostAdminLogin.aspx");

    }
}
