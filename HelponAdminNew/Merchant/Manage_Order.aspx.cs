using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Manage_Order : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtMerchant = new DataTable();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];

            if (!IsPostBack)
            {
                FillGv();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }

        private void FillGv()
        {
            DataTable dtResult = new DataTable();
            dtResult = cls.selectDataTable("Exec ProcManage_Report 'OrderReport',0,'" + txtFromDate.Text + "','" + txttoDate.Text + "','"+dtMerchant.Rows[0]["Mobile"]+"'");
            rpData.DataSource = dtResult;
            rpData.DataBind();
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }

        protected void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //GridView GvData = e.Item.FindControl("GvData") as GridView;
                Repeater rpData = e.Item.FindControl("rpData") as Repeater;
                HiddenField hdnID = e.Item.FindControl("hdnID") as HiddenField;
                List<OrderReport> orders = new List<OrderReport>();
                orders = repo.OrderReportWithProduct(Convert.ToInt32(hdnID.Value));
                rpData.DataSource = orders;
                rpData.DataBind();
            }
        }

        protected void rpData_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox txtRemark = e.Item.FindControl("txtRemark") as TextBox;
            
            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters para = new DynamicParameters();
            para.Add("@Action", e.CommandName);
            para.Add("@CustomerID", e.CommandArgument);
            para.Add("@Address", txtRemark.Text);
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcManage_Order", para).FirstOrDefault();
            if (apptransaction.Status == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + apptransaction.Message + "','success');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + apptransaction.Message + "','info');", true);
            }
            
            FillGv();
        }
    }
}