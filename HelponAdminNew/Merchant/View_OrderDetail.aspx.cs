using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using HelponAdminNew.App_Data;

namespace HelponAdminNew.Merchant
{
    public partial class View_OrderDetail : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        DataTable dtMerchant = new DataTable();
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
        private void FillGv()
        {
            List<OrderReport> orders = new List<OrderReport>();
            orders = repo.OrderReportWithProduct(Convert.ToInt32(Request.QueryString["OrderID"]));
            GvData.DataSource = orders;
            GvData.DataBind();
           
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "fnn();", true);
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int RowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
            string txtRemark = ((TextBox)GvData.Rows[RowIndex].FindControl("txtRemark")).Text;
            if (txtRemark.Length < 10)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Enter Remark','info');", true);
                return;
            }
            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters para = new DynamicParameters();
            para.Add("@Action",e.CommandName);
            para.Add("@CustomerID", e.CommandArgument);
            para.Add("@Address", txtRemark);
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcManage_Order", para).FirstOrDefault();
            if (apptransaction.Status == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + apptransaction.Message + "','success');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" +apptransaction.Message + "','info');", true);
            }
            //DataTable dt = cls.selectDataTable("Exec ProcManage_Order '"+e.CommandName+"','"+e.CommandArgument+"'");
            //if (dt.Rows.Count > 0)
            //{
            //    if (dt.Rows[0]["Status"].ToString() == "1")
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','"+dt.Rows[0]["Message"]+"','success');", true);
            //    }
            //    else
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','info');", true);
            //    }
            //}
            FillGv();
        }
        //protected void btnPendingGv_Command(object sender, CommandEventArgs e)
        //{
        //    int chkv = 0;
        //    for (int i = 0; i < GvPending.Rows.Count; i++)
        //    {
        //        string id = string.Empty;
        //        CheckBox chk = (CheckBox)GvPending.Rows[i].FindControl("chkPendingRow");
        //        HiddenField mid = (HiddenField)GvPending.Rows[i].FindControl("hdnid");
        //        if (chk.Checked == true)
        //        {
        //            cls.ExecuteQuery("Exec ProcMaster_Merchant '" + e.CommandName + "','" + mid.Value + "'");

        //        }
        //        chkv++;
        //    }
        //    if (chkv == 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Select Atleast One CheckBox');fnn();", true);
        //    }
        //    else
        //    {

        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully ')", true);

        //        FillGv();
        //    }

        //}

    }
}