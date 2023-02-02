using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class List_MerchantKYC : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGv();
            }
        }

        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_Report 'List_MerchantKYC',0,'" + txtFromDate.Text + "','" + txttoDate.Text + "','"+ txtMerchantID.Text+ "','"+ ddlStatus.SelectedValue+ "'");
            GvData.DataSource = dt;
            GvData.DataBind();

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow selectedRow = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer);
            string txtRemark = ((TextBox)selectedRow.FindControl("txtRemark")).Text;

            DataTable dt = cls.selectDataTable("Exec ProcManage_MerchantKYC '"+e.CommandName+"','"+e.CommandArgument+"',0,'"+txtRemark+"'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                    FillGv();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                }
            }
        }
    }
}