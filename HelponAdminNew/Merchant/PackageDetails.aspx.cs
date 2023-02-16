using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class PackageDetails : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtMerchant = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetDetails(Request.QueryString["Id"].ToString());
            }
        }
        public void GetDetails(string PkId)
        {
            DataTable dtResult = new DataTable();
            DataTable dtresult = cls.selectDataTable("ProcManage_PackageDetail 'GetAllPackageId','" + PkId + "'");
            if (dtresult.Rows.Count > 0)
            {
                lblpcknme.Text = dtresult.Rows[0]["Name"].ToString();
                lblamt.Text = dtresult.Rows[0]["Amount"].ToString();
                //lblpackagenme.Text = dtresult.Rows[0]["Name"].ToString();
                lblbuinsesnme.Text = dtresult.Rows[0]["IsBusinessName"].ToString();
                lblcontactprson.Text = dtresult.Rows[0]["IsPersonalName"].ToString();
                lbladress.Text = dtresult.Rows[0]["IsAddress"].ToString();
                lblcontno.Text = dtresult.Rows[0]["IsContactNo"].ToString();
                lblemail.Text = dtresult.Rows[0]["IsEmail"].ToString();
                lblaboutus.Text = dtresult.Rows[0]["IsAboutus"].ToString();
                lblseo.Text = dtresult.Rows[0]["IsSeo"].ToString();
                lblgooglemp.Text = dtresult.Rows[0]["IsGoogleMap"].ToString();
                lblbankdtl.Text = dtresult.Rows[0]["IsBankDetail"].ToString();
                lblbussinq.Text = dtresult.Rows[0]["IsBusinessInquiry"].ToString();
                lblwebsite.Text = dtresult.Rows[0]["IsWebsite"].ToString();
                lblprofimg.Text = dtresult.Rows[0]["ProfileIMG"].ToString();
                lblwebthumb.Text = dtresult.Rows[0]["Thumbnail"].ToString();
                lbladslid.Text = dtresult.Rows[0]["AdsSlider"].ToString();
                lblgalleryimg.Text = dtresult.Rows[0]["Gallery"].ToString();
                lblvideoclip.Text = dtresult.Rows[0]["Video"].ToString();
                lblcoupanfacil.Text = dtresult.Rows[0]["IsCoupons"].ToString();
                lblsellprod.Text = dtresult.Rows[0]["Product"].ToString();
                lbltxinvo.Text = dtresult.Rows[0]["IsTaxInvoice"].ToString();
                lbldevfact.Text = dtresult.Rows[0]["DeliveryFacility"].ToString();
                lblpassword.Text = dtresult.Rows[0]["IsLogin"].ToString();

            }
        }
    }
}