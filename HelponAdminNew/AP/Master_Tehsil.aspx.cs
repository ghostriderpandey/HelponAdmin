using HelponAdminNew.GlobalHelper;
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
    public partial class Master_Tehsil : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
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
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                ddlState_SelectedIndexChanged(null, null);
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcMaster_Tehsil 'GetAll',0,'" + ddlState.SelectedValue + "','"+ddlCity.SelectedValue+"'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcMaster_Tehsil 'GetbyID','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                ddlState.SelectedValue = dtresult.Rows[0]["StateID"].ToString();
                ddlState_SelectedIndexChanged(null, null);
                ddlCity.SelectedValue = dtresult.Rows[0]["CityID"].ToString();
                txtName.Text = dtresult.Rows[0]["Tehsilname"].ToString();
                ViewState["ID"] = id;
                btnSubmit.Text = "Update";
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
            }

            DataTable dt = cls.selectDataTable("Exec ProcMaster_Tehsil 'insert','" + id + "','" + ddlState.SelectedValue + "','"+ddlCity.SelectedValue+"','" + txtName.Text.Replace("'", "").Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('Master_Tehsil.aspx')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                }
            }
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsActive")
            {
                cls.ExecuteQuery("Exec ProcMaster_Tehsil 'IsActive','" + e.CommandArgument + "'");
                FillData();
            }
            else if (e.CommandName == "IsChange")
            {
                GetData(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            repo.BindDropDownList(ddlCity, "GetCity", ddlState.SelectedIndex, "Name", "ID");
            ddlCity_SelectedIndexChanged(null, null);
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillData();
        }
    }
}