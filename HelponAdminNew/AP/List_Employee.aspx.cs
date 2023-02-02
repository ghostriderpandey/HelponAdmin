using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

namespace HelponAdminNew.AP
{
    public partial class List_Employee : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtEmployee = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Request.UrlReferrer==null)
            //{
            //    Response.Redirect("Dashboard.aspx");
            //    return;
            //}
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)this.Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj.InnerText = cls.ExecuteStringScalar("EXEC ProcGet_AdminMenuName '" + pagename + "'");
                obj1.InnerText = obj.InnerText;
                fillEmployee();
            }
        }
        private void fillEmployee()
        {
            dtEmployee = cls.GetDataTable("Exec ProcMaster_ManageEmployee 'GetAll', 0");
            gvEmployee.DataSource = dtEmployee;
            gvEmployee.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }
        protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                try
                {
                    int idno = 0;
                    idno = Convert.ToInt32(e.CommandArgument);
                    cls.ExecuteQuery("Exec ProcMaster_ManageEmployee 'IsDelete', '" + idno + "'");
                    fillEmployee();
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sorry.You cannot delete this Item.If you want to delete this fist delete child Items related this Item.!!!')", true);
                }
            }
            if (e.CommandName == "IsActive")
            {
                try
                {
                    int idno = 0;
                    idno = Convert.ToInt32(e.CommandArgument);
                    cls.ExecuteQuery("Exec ProcMaster_ManageEmployee 'IsActive', '" + idno + "'");
                    fillEmployee();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('"+ ex.Message + "')", true);
                }
            }
            if (e.CommandName == "IsApprove")
            {
                try
                {
                    int idno = 0;
                    idno = Convert.ToInt32(e.CommandArgument);
                    cls.ExecuteQuery("Exec ProcMaster_ManageEmployee 'IsApprove', '" + idno + "'");
                    fillEmployee();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "')", true);
                }
            }
        }
    }
}