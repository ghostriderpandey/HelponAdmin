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

namespace HelponAdminNew.Franchise
{
    public partial class Manage_Merchant : System.Web.UI.Page
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
                repo.BindDropDownList(ddlCategory, "GetCategory", 0, "Name", "ID");
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                if (Session["MID"] != null)
                {
                    GetData(Convert.ToInt32(Session["MID"]));
                }
            }
        }
        private void GetData(int mid)
        {
            MasterMerchant merchant = new MasterMerchant();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "ListMerchant");
            param.Add("@ID", mid);
            merchant = Connection.ReturnList<MasterMerchant>("ProcManage_Report", param).FirstOrDefault();

            if (merchant != null)
            {
                ddlCategory.SelectedValue = merchant.CID.ToString();
                ddlCategory_SelectedIndexChanged(null, null);
                ddlSubCategory.SelectedValue = merchant.SCID.ToString();
                txtshopname.Text = merchant.Shopname;
                txtname.Text = merchant.Name;
                txtMobile.Text = merchant.Mobile;
                txtAlternetMobile.Text = merchant.AlternetMobile;
                txtTelphone.Text = merchant.TelPhoneNo;
                txtWhatsappnumber.Text = merchant.WhatsappNo;
                txtEmail.Text = merchant.Email;
                txtAboutus.Text = merchant.Aboutus;
                txtTwitter.Text = merchant.Twitter;
                txtInstagram.Text = merchant.Instagram;
                txtfacebook.Text = merchant.Facebook;
                txtwebsite.Text = merchant.WebSite;
                ddlState.SelectedValue = merchant.StateID.ToString();
                ddlState_SelectedIndexChanged(null, null);
                ddlDistrict.SelectedValue = merchant.DistrictID.ToString();
                ddlDistrict_SelectedIndexChanged(null, null);
                ddlTehsil.SelectedValue = merchant.TehsilID.ToString();
                txtCityname.Text = merchant.CityName;
                txtpincode.Text = merchant.Pincode;
                txtAddress.Text = merchant.Address;
                txtPassword.Text = merchant.Password;
              
                btnUpdate.Text = "Update";
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            repo.BindDropDownList(ddlSubCategory, "GetSubCategory", ddlCategory.SelectedIndex, "Name", "ID");
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

            repo.BindDropDownList(ddlDistrict, "GetCity", ddlState.SelectedIndex, "Name", "ID");
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int mid = 0;
            if (Session["MID"] != null)
            {
                mid = Convert.ToInt32(Session["MID"]);
            }
            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "insert");
            param.Add("@MID", mid);
            param.Add("@CID", ddlCategory.SelectedValue);
            param.Add("@SCID", ddlSubCategory.SelectedValue);
            param.Add("@ShopName", txtshopname.Text.Trim());
            param.Add("@Name", txtname.Text.Trim());
            param.Add("@Mobile", txtMobile.Text.Trim());
            param.Add("@AlternetMobile", txtAlternetMobile.Text.Trim());
            param.Add("@whatsappNo", txtWhatsappnumber.Text.Trim());
            param.Add("@TelPhoneNo", txtTelphone.Text.Trim());
            param.Add("@Email", txtEmail.Text.Trim());
            param.Add("@StateID", ddlState.SelectedValue);
            param.Add("@DistrictID", ddlDistrict.SelectedValue);
            param.Add("@TehsilID", ddlTehsil.SelectedValue);
            param.Add("@CityName", txtCityname.Text.Trim());
            param.Add("@Address", txtAddress.Text.Trim());
            param.Add("@Pincode", txtpincode.Text.Trim());
            param.Add("@Password", txtPassword.Text.Trim());
            param.Add("@Twitter", txtTwitter.Text.Trim());
            param.Add("@Instagram", txtInstagram.Text.Trim());
            param.Add("@Facebook", txtfacebook.Text.Trim());
            param.Add("@Website", txtwebsite.Text.Trim());
            param.Add("@Aboutus", txtAboutus.Text.Trim());
            param.Add("@SalesID", dtFranchise.Rows[0]["LoginID"]);
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcMaster_Merchant", param).FirstOrDefault();
            if (apptransaction.Status > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');location.replace('List_Merchant.aspx')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');", true);
            }
        }
    }
}