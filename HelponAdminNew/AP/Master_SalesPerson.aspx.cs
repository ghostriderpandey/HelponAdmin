using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class Master_SalesPerson : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                if (Request.QueryString["ID"] != null)
                {
                    GetData(Convert.ToInt32(Request.QueryString["ID"]));
                }
            }
        }
        private void GetData(int mid)
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_SalesPerson 'Get','"+mid+"'");
            if (dt.Rows.Count > 0)
            {
                txtname.Text = dt.Rows[0]["Name"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                ddlState.SelectedValue = dt.Rows[0]["StateID"].ToString();
                ddlState_SelectedIndexChanged(null, null);
                ddlDistrict.SelectedValue= dt.Rows[0]["CityID"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtpincode.Text = dt.Rows[0]["Pincode"].ToString();
            }

        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

            repo.BindDropDownList(ddlDistrict, "GetCity", Convert.ToInt32(ddlState.SelectedValue), "Name", "ID");
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int mid = 0;
            if (Request.QueryString["ID"] != null)
            {
                mid = Convert.ToInt32(Request.QueryString["ID"]);
            }
            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "insert");
            param.Add("@ID", mid);
            param.Add("@Name", txtname.Text.Trim());
            param.Add("@Email", txtEmail.Text.Trim());
            param.Add("@Mobile", txtMobile.Text.Trim());
            param.Add("@StateID", ddlState.SelectedValue);
            param.Add("@CityID", ddlDistrict.SelectedValue);
            param.Add("@Address", txtAddress.Text.Trim());
            param.Add("@Pincode", txtpincode.Text.Trim());
            param.Add("@SponsorID", "2");
            param.Add("@SponsorType", "Admin");
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcMaster_SalesPerson", param).FirstOrDefault();
            if (apptransaction.Status > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');location.replace('List_SalesPerson.aspx')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');", true);
            }
        }

        protected void txtSponserID_TextChanged(object sender, EventArgs e)
        {

        }
    }
}