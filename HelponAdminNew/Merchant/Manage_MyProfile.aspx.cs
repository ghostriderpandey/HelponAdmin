using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using HelponAdminNew.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Manage_MyProfile : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        clsImageResize objImgae = new clsImageResize();
        DataTable dtMerchant = new DataTable();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];
            txtuserid.Text = dtMerchant.Rows[0]["LoginID"].ToString();
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "Exec ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                GetData();

            }
        }

        private void GetData()
        {
            MasterMerchant merchant = new MasterMerchant();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "ListMerchant");
            param.Add("@ID", Convert.ToInt32(dtMerchant.Rows[0]["MID"]));
            merchant = Connection.ReturnList<MasterMerchant>("ProcManage_Report", param).FirstOrDefault();
            if (merchant != null)
            {
                ddlCategory.SelectedValue = merchant.CID.ToString();
                ddlCategory_SelectedIndexChanged(null, null);
                ddlSubCategory.SelectedValue = merchant.SCID.ToString();
                txtshopname.Text = merchant.Shopname;
                txtname.Text = merchant.Name;
                txtbgColor.Text =  merchant.BgColor ;
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
                //ddlTehsil.SelectedValue = merchant.TehsilID.ToString();
                txtCityname.Text = merchant.CityName;
                txtpincode.Text = merchant.Pincode;
                txtAddress.Text = merchant.Address;
                ProfileBg.Attributes.CssStyle.Add("background", merchant.BgColor);
                if (merchant.ProfileImg != null && merchant.ProfileImg != "")
                {
                    imgProfile.Src = merchant.ProfileImg;
                }
                if (merchant.ThumbnailIMG != null && merchant.ThumbnailIMG != "")
                {
                    imgThumbnail.Src = merchant.ThumbnailIMG;
                }
                FillGvAvailbale();
                btnUpdate.Text = "Update";
            }
        }
        private void FillGvAvailbale()
        {
            DataTable dtService = cls.selectDataTable("Exec ProcMaster_Merchant 'GetMerchantServiceAvailablity','" + dtMerchant.Rows[0]["MID"] + "'");
            gvserviceAvailbile.DataSource = dtService;
            gvserviceAvailbile.DataBind();
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {

            repo.BindDropDownList(ddlDistrict, "GetCity", Convert.ToInt32(ddlState.SelectedValue), "Name", "ID");
        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            ApptransactionMessage apptransaction = new ApptransactionMessage();
            DynamicParameters param = new DynamicParameters();
            param.Add("@Action", "insert");
            param.Add("@MID", dtMerchant.Rows[0]["MID"]);
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
            param.Add("@TehsilID", "0");
            param.Add("@CityName", txtCityname.Text.Trim());
            param.Add("@Address", txtAddress.Text.Trim());
            param.Add("@Pincode", txtpincode.Text.Trim());
            param.Add("@Twitter", txtTwitter.Text.Trim());
            param.Add("@Instagram", txtInstagram.Text.Trim());
            param.Add("@Facebook", txtfacebook.Text.Trim());
            param.Add("@Website", txtwebsite.Text.Trim());
            param.Add("@Aboutus", txtAboutus.Text.Trim());
            apptransaction = Connection.ReturnList<ApptransactionMessage>("ProcMaster_Merchant", param).FirstOrDefault();
            if (apptransaction.Status > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');location.replace('Manage_MyProfile.aspx')", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + apptransaction.Message + "');", true);
            }
        }
        private ImageUploadStatus UploadImage(FileUpload file, string Number, string Folder)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = Number + ext;
            if (file.HasFile == true)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif")
                    {
                        string opath = Server.MapPath("../Upload/Merchant/" + Folder + "/" + FileName);
                        file.SaveAs(opath);
                        uploadStatus.Status = true;
                        uploadStatus.ImgName = FileName;
                    }
                    else
                    {
                        uploadStatus.Status = false;
                        uploadStatus.ImgName = "Invalid Image";
                    }
                }
            }
            else
            {
                uploadStatus.Status = false;
                uploadStatus.ImgName = "Please Select image";
            }
            return uploadStatus;
        }



        protected void btnUpdateImg_Command(object sender, CommandEventArgs e)
        {
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (e.CommandName == "Profile")
            {

                if (fileProfileImg.HasFile)
                {
                    imageUpload = UploadImage(fileProfileImg, dtMerchant.Rows[0]["MID"] + "_Profile", "Profile");
                    if (imageUpload.Status == false)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert','" + imageUpload.ImgName + "','info')", true);
                        return;
                    }
                    var oldbgcolor = cls.ExecuteStringScalar("select BgColor from tblMaster_Merchant where MID='" + dtMerchant.Rows[0]["MID"] + "' ");
                    cls.ExecuteQuery("Update tblMaster_Merchant SET ProfileImg = '" + imageUpload.ImgName + "' where MID='" + dtMerchant.Rows[0]["MID"] + "'");
                    if (oldbgcolor != txtbgColor.Text.Replace("'", "").Trim())
                    {
                        cls.ExecuteQuery("Update tblMaster_Merchant SET BgColor='" + txtbgColor.Text.Replace("'", "").Trim() + "' where MID='" + dtMerchant.Rows[0]["MID"] + "'");

                    }
                    Response.Redirect("Manage_MyProfile.aspx");
                }
                else
                {
                    var oldbgcolor = cls.ExecuteStringScalar("select BgColor from tblMaster_Merchant where MID='" + dtMerchant.Rows[0]["MID"] + "' ");
                    if (oldbgcolor != txtbgColor.Text.Replace("'", "").Trim())
                    {
                        cls.ExecuteQuery("Update tblMaster_Merchant SET BgColor='" + txtbgColor.Text.Replace("'", "").Trim() + "' where MID='" + dtMerchant.Rows[0]["MID"] + "'");
                        Response.Redirect("Manage_MyProfile.aspx");
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert','Please Select Photo','info')", true);
                }
            }
            else if (e.CommandName == "Thumbnail")
            {
                if (Filethumbnail.HasFile)
                {
                    imageUpload = UploadImage(Filethumbnail, dtMerchant.Rows[0]["MID"] + "_Thumbnail", "Thumbnail");
                    if (imageUpload.Status == false)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert','" + imageUpload.ImgName + "','info')", true);
                        return;
                    }
                    cls.ExecuteQuery("Update tblMaster_Merchant SET ThumbnailIMG = '" + imageUpload.ImgName + "' where MID='" + dtMerchant.Rows[0]["MID"] + "'");
                    Response.Redirect("Manage_MyProfile.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert','Please Select Photo','info')", true);
                }
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "Exec ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Main'", "Name", "ID");
        }

        protected void btnUpdateTime_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvserviceAvailbile.Rows)
            {
                // Selects the text from the TextBox
                // which is inside the GridView control
                HiddenField hdnID = (HiddenField)row.FindControl("hdnID");
                TextBox txtOpenTime = (TextBox)row.FindControl("txtOpenTime");
                TextBox txtCloseTime = (TextBox)row.FindControl("txtCloseTime");
                cls.ExecuteQuery("Update tblManage_MerchantServiceAvailablity SET OpenTime='" + txtOpenTime.Text.Replace("'", "").Trim() + "',CloseTime='" + txtCloseTime.Text.Replace("'", "").Trim() + "' where ID='" + hdnID.Value + "'");

            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully update')", true);
            FillGvAvailbale();
        }
        [System.Web.Services.WebMethod]
        public static string AddAminities(string name)
        {
            Cls_Connection cls = new Cls_Connection();
            DataTable dtMerchant = (DataTable)HttpContext.Current.Session["MerchantSession"];
            cls.ExecuteQuery("insert into tblManage_Aminities(MID,Aminities)values('" + Convert.ToInt32(dtMerchant.Rows[0]["MID"]) + "',N'" + name + "')");
            return "Success";
        }
        [System.Web.Services.WebMethod]
        public static string DeleteAminities(string id)
        {
            Cls_Connection cls = new Cls_Connection();
            cls.ExecuteQuery("delete tblManage_Aminities where ID='" + id + "'");
            return "Success";
        }
        [System.Web.Services.WebMethod]
        public static string GetAminities()
        {
            string str = "";
            Cls_Connection cls = new Cls_Connection();
            DataTable dtMerchant = (DataTable)HttpContext.Current.Session["MerchantSession"];
            DataTable dt = cls.selectDataTable("select * from tblManage_Aminities where MID='" + Convert.ToInt32(dtMerchant.Rows[0]["MID"]) + "'");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str += "<li class='alert alert-primary d-flex justify-content-between'>" + dt.Rows[i]["Aminities"] + "  <i class='text-danger fa fa-trash btnDelete' style='cursor:pointer;' data-id=" + dt.Rows[i]["ID"] + "></i></li>";
                }
            }
            return str;
        }
    }
}