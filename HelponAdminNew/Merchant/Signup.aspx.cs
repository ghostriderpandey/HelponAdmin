using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HelponAdminNew.GlobalHelper;
using Dapper;
using HelponAdminNew.App_Data;

namespace HelponAdminNew.Merchant
{
    public partial class Signup : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "Exec ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
            }
        }

        protected void MultiviewSignup_ActiveViewChanged(object sender, EventArgs e)
        {
            String activeView;
            activeView = MultiviewSignup.GetActiveView().ID;

        }
        protected void LinkButton_Command(object sender, CommandEventArgs e)
        {
            // Determine which link button was clicked
            // and set the active view to
            // the view selected by the user.
            switch (e.CommandName.ToString())
            {
                case "DefaultView":
                    MultiviewSignup.SetActiveView(DefaultView);
                    break;
                case "PersonalDetailView":
                    if (txtMobile.Text.Length < 10)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Invalid Mobile No.','info')", true);
                        return;
                    }
                    else if (ViewState["OTP"] == null)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Please Send OTP','info')", true);
                        return;
                    }
                    else if (ViewState["Mobile"].ToString() != txtMobile.Text.Trim())
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Invalid Mobile','info')", true);
                        return;
                    }
                    else if (txtEmail.Text.Length > 0)
                    {
                        if (ViewState["Email"].ToString() != txtEmail.Text.Trim())
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Invalid Email','info')", true);
                            return;
                        }
                    }
                    else if (ViewState["OTP"].ToString() != txtOTP.Text.Trim())
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Invalid OTP','error')", true);
                        return;
                    }
                    
                    MultiviewSignup.SetActiveView(PersonalDetailView);
                    break;
                case "AddressDetailView":
                    ApptransactionMessage apptransaction = new ApptransactionMessage();
                    apptransaction = Registration();
                    if (apptransaction.Status > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + apptransaction.Message + "','success').then((value)=>{location.replace('Login.aspx')})", true);
                        return;

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + apptransaction.Message + "','error')", true);
                        return;

                    }
                    
                    //MultiviewSignup.SetActiveView(AddressDetailView);
                   // break;
            }

        }
        public ApptransactionMessage Registration()
        {
            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "insert");
            param.Add("@CID", ddlCategory.SelectedValue);
            param.Add("@SCID", ddlSubCategory.SelectedValue);
            param.Add("@ShopName", txtShopName.Text.Trim());
            param.Add("@Name", txtName.Text.Trim());
            param.Add("@Mobile", txtMobile.Text.Trim());
            param.Add("@Email", txtEmail.Text.Trim());
            param.Add("@StateID", ddlState.SelectedValue);
            param.Add("@DistrictID", ddlDistrict.SelectedValue);
            param.Add("@TehsilID", ddlTehsil.SelectedValue);
            param.Add("@CityName", txtCityName.Text.Trim());
            param.Add("@Address", txtAddress.Text.Trim());
            param.Add("@Pincode", txtPincode.Text.Trim());
            param.Add("@Password", txtPassword.Text.Trim());
            param.Add("@SalesID", txtSponserID.Text.Trim());
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcMaster_Merchant",param).FirstOrDefault();
            return apptransaction;
        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "Exec ProcMaster_SubCategory 'GetforDDL',0,'"+ddlCategory.SelectedValue+"','Main'", "Name", "ID");
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            repo.BindDropDownList(ddlDistrict, "GetCity", Convert.ToInt32(ddlState.SelectedValue), "Name", "ID");
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void txtSponserID_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = cls.selectDataTable("select * from tblMaster_SalesPerson where Mobile='" + txtSponserID.Text.Trim() + "'");
            if (dt.Rows.Count > 0)
            {
                hdnSponserID.Value = dt.Rows[0]["ID"].ToString();
                lblSponserName.Text = dt.Rows[0]["Name"].ToString();
            }
            else
            {
                lblSponserName.Text = "";
                txtSponserID.Text = "";
                hdnSponserID.Value ="0";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "swal('Alert !', 'Invalid Sales Exicutive ', 'info');", true);
            }
        }
    }
}