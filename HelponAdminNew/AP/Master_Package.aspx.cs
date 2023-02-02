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
    public partial class Master_Package : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
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
                cls.BindDropDownList(ddlPackage, "Exec ProcManage_PackageDetail 'GetPackage'", "Name", "ID");
                FillData();
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcManage_PackageDetail 'GetAll'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcManage_PackageDetail 'GetbyID','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                ddlPackage.SelectedValue = dtresult.Rows[0]["PackageID"].ToString();
                ddlPackage_SelectedIndexChanged(null, null);
                ddlBusinessName.SelectedValue = dtresult.Rows[0]["IsBusinessName"].ToString().Replace("True","1").Replace("False","0");
                ddlContactPersonName.SelectedValue = dtresult.Rows[0]["IsPersonalName"].ToString().Replace("True", "1").Replace("False", "0");
                ddlAddress.SelectedValue = dtresult.Rows[0]["IsAddress"].ToString().Replace("True", "1").Replace("False", "0");
                ddlContactNo.SelectedValue = dtresult.Rows[0]["IsContactNo"].ToString().Replace("True", "1").Replace("False", "0");
                ddlEmail.SelectedValue = dtresult.Rows[0]["IsEmail"].ToString().Replace("True", "1").Replace("False", "0");
                ddlAboutus.SelectedValue = dtresult.Rows[0]["IsAboutus"].ToString().Replace("True", "1").Replace("False", "0");
                ddlSeo.SelectedValue = dtresult.Rows[0]["IsSeo"].ToString().Replace("True", "1").Replace("False", "0");
                ddlGoogleMap.SelectedValue = dtresult.Rows[0]["IsGoogleMap"].ToString().Replace("True", "1").Replace("False", "0");
                ddlBankDetail.SelectedValue = dtresult.Rows[0]["IsBankDetail"].ToString().Replace("True", "1").Replace("False", "0");
                ddlBusinessInquiry.SelectedValue = dtresult.Rows[0]["IsBusinessInquiry"].ToString().Replace("True", "1").Replace("False", "0");
                ddlWebsite.SelectedValue = dtresult.Rows[0]["IsWebsite"].ToString().Replace("True", "1").Replace("False", "0");
                ddlTaxInvoiceFacility.SelectedValue = dtresult.Rows[0]["IsTaxInvoice"].ToString().Replace("True", "1").Replace("False", "0");
                ddlDeliveryFacility.SelectedValue = dtresult.Rows[0]["DeliveryFacility"].ToString().Replace("True", "1").Replace("False", "0");
                ddlLogin.SelectedValue = dtresult.Rows[0]["IsLogin"].ToString().Replace("True", "1").Replace("False", "0");
                ddlCouponFacility.SelectedValue = dtresult.Rows[0]["IsCoupons"].ToString().Replace("True", "1").Replace("False", "0");
                txtProfileImg.Text = dtresult.Rows[0]["ProfileIMG"].ToString();
                txtWebsiteThumbnail.Text = dtresult.Rows[0]["Thumbnail"].ToString();
                txtAdsSlider.Text = dtresult.Rows[0]["AdsSlider"].ToString();
                txtGallery.Text = dtresult.Rows[0]["Gallery"].ToString();
                txtVideoClip.Text = dtresult.Rows[0]["Video"].ToString();               
                txtProduct.Text = dtresult.Rows[0]["Product"].ToString();
               
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            DataTable dt = cls.selectDataTable("Exec ProcManage_PackageDetail 'insert','" + ddlPackage.SelectedValue + "','"+txtAmount.Text.Trim()+"','"+ddlBusinessName.SelectedValue+"','"+ddlContactPersonName.SelectedValue+"','"+ddlAddress.SelectedValue+"','"+ddlContactNo.SelectedValue+"','"+ddlEmail.SelectedValue+"','"+ddlAboutus.SelectedValue+"','"+ddlSeo.SelectedValue+"','"+ddlGoogleMap.SelectedValue+"','"+ddlBankDetail.SelectedValue+"','"+ddlBusinessInquiry.SelectedValue+"','"+ddlWebsite.SelectedValue+"','"+txtProfileImg.Text+"','"+txtWebsiteThumbnail.Text+"','"+txtAdsSlider.Text+"','"+txtGallery.Text+"','"+txtVideoClip.Text+"','"+ddlCouponFacility.SelectedValue+"','"+txtProduct.Text+"','"+ddlTaxInvoiceFacility.SelectedValue+"','"+ddlDeliveryFacility.SelectedValue+"','"+ddlLogin.SelectedValue+"'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('Master_Package.aspx')", true);

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
                cls.ExecuteQuery("Exec ProcManage_PackageDetail 'IsActive','" + e.CommandArgument + "'");
                FillData();
            }
            else if (e.CommandName == "IsChange")
            {
                GetData(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void ddlPackage_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Price = cls.ExecuteStringScalar("select Amount from tblMaster_Package where ID='" + ddlPackage.SelectedValue + "'");
            txtAmount.Text = Price;
        }
    }
}