using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Franchise
{
    public partial class Manage_Franchise : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        DataTable dtFranchise = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FranchiseSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtFranchise = (DataTable)Session["FranchiseSession"];

            if (!IsPostBack)
            {
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                FillData();
            }
        }
        protected void lnkbtnSignup_Click(object sender, EventArgs e)
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Franchise 'insert','"+dtFranchise.Rows[0]["ID"]+"','" + txtName.Text.Replace("'", "") + "','" + txtEmail.Text.Replace("'", "") + "','" + txtMobile.Text.Replace("'", "") + "','" + txtPassword.Text.Replace("'", "") + "','" + ddlState.SelectedValue + "','" + ddlDistrict.SelectedValue + "','" + txtAddress.Text.Replace("'", "") + "','" + txtPincode.Text.Replace("'", "") + "','" + txtCityName.Text.Replace("'", "") + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','success').then((value)=>{location.replace('Manage_Franchise.aspx')})", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','info');", true);
                }
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("Exec ProcMaster_Franchise 'Get','"+dtFranchise.Rows[0]["ID"]+"'");
            if (dtData.Rows.Count > 0)
            {
                txtName.Text = dtData.Rows[0]["Name"].ToString();
                txtEmail.Text = dtData.Rows[0]["Email"].ToString();
                txtMobile.Text = dtData.Rows[0]["Mobile"].ToString();
                txtAddress.Text = dtData.Rows[0]["Address"].ToString();
                txtPincode.Text = dtData.Rows[0]["Pincode"].ToString();
                txtCityName.Text = dtData.Rows[0]["CityName"].ToString();
                ddlState.SelectedValue = dtData.Rows[0]["StateID"].ToString();
                ddlState_SelectedIndexChanged(null, null);
                ddlDistrict.SelectedValue = dtData.Rows[0]["DistrictID"].ToString();

            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            repo.BindDropDownList(ddlDistrict, "GetCity", ddlState.SelectedIndex, "Name", "ID");
        }
        protected void btnOTPSend_Click(object sender, EventArgs e)
        {
            if (txtMobile.Text.Trim().Length != 10)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "swal('Registration', 'Enter Mobile Number', 'info');", true);
                return;
            }
            Random rnd = new Random();
            string RemitterOTP = rnd.Next(0, 999999).ToString("D6");
            ViewState["OTP"] = RemitterOTP;
            ViewState["Mobile"] = txtMobile.Text.Trim();
            ViewState["Email"] = txtEmail.Text.Trim();

            string strMsg = RemitterOTP + " is your One Time Password (OTP) to authorise for Registration.";
            //SMS.Send(txtMobile.Text.Trim(), strMsg);
            txtOTP.Text = RemitterOTP;
            lnkSendOTP.Text = "Please Wait...";
            lnkSendOTP.Enabled = false;
            //lnkSendOTP.Style.Add("Display", "none");
            lnkSendOTP.Text = "Resend OTP";
            lnkSendOTP.Enabled = true;
            txtMobile.ReadOnly = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "swal('Registration', 'OTP Successfully Send', 'success');fnCountDown();", true);
        }
    }
}