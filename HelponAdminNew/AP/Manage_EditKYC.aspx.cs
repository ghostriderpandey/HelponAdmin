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
    public partial class Manage_EditKYC : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtMerchant = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cls.BindDropDownList(ddlPersonalDoc, "Exec ProcMaster_Document 'GetforddlPersonal'", "Name", "ID");
                cls.BindDropDownList(ddlDocumtnBusiness, "Exec ProcMaster_Document 'GetforddlBusiness'", "Name", "ID");
                if (Request.QueryString["Id"] != null)
                {

                    GetData(Request.QueryString["Id"].ToString());
                }

            }
        }
        private void GetData(string Id)
        {
            DataTable dtresult = cls.selectDataTable("ProcManage_MerchantKYC 'GetbyMerchantbyEdit',@ID='" + Convert.ToInt32(Id) + "'");
            if (dtresult.Rows.Count > 0)
            {
                string URL = "~/Upload/KYCDocument/";
                ddlPersonalDoc.SelectedValue = dtresult.Rows[0]["PersonalDocID"].ToString();
                ddlDocumtnBusiness.SelectedValue = dtresult.Rows[0]["BusinessDocID"].ToString();
                txtShopName.Text = dtresult.Rows[0]["ShopName"].ToString();
                txtName.Text = dtresult.Rows[0]["OwnerName"].ToString();
                txtMobile.Text = dtresult.Rows[0]["WhatsappNumber"].ToString();
                txtPersonalDocNumber.Text = dtresult.Rows[0]["PersonalDocNumber"].ToString();
                txtBusinessDocNumber.Text = dtresult.Rows[0]["BusinessDocNumber"].ToString();
                lblMessage.Text = dtresult.Rows[0]["Remark"].ToString();
                hdmerchantId.Value= dtresult.Rows[0]["MID"].ToString();
                PriviewPersonalFront.ImageUrl = URL + dtresult.Rows[0]["PersonalFrontPhoto"].ToString();
                PreviewPersonalBack.ImageUrl = URL + dtresult.Rows[0]["PersonalBackPhoto"].ToString();
                PreviewBusinessFront.ImageUrl = URL + dtresult.Rows[0]["BusinessFrontPhoto"].ToString();
                PreviewBusinessBack.ImageUrl = URL + dtresult.Rows[0]["BusinessBackPhoto"].ToString();
                PreviewUploadPhoto.ImageUrl = URL + dtresult.Rows[0]["Photo"].ToString();
                PreviewUploadShopInside.ImageUrl = URL + dtresult.Rows[0]["ShopinsidePhoto"].ToString();
                PreviewUploadOutSide.ImageUrl = URL + dtresult.Rows[0]["ShopOutsidePhoto"].ToString();
                btnSubmit.Text = "Update KYC";
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            int max = Convert.ToInt32(hdmerchantId.Value);
            string PersonalFront = "";
            string PersonalBack = "";
            string UploadBusinessFront = "";
            string UploadBusinessBack = "";
            string UploadPhoto = "";
            string UploadShopInside = "";
            string UploadOutSide = "";

            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (filePersonalFront.HasFile)
            {
                imageUpload = UploadImage(filePersonalFront, max.ToString() + "_Profile");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                PersonalFront = imageUpload.ImgName;
            }
            if (filePersonalBack.HasFile)
            {
                imageUpload = UploadImage(filePersonalBack, max.ToString() + "_PersonalDocBack");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                PersonalBack = imageUpload.ImgName;
            }
            if (FileUploadBusinessFront.HasFile)
            {
                imageUpload = UploadImage(FileUploadBusinessFront, max.ToString() + "_BusinessDocFront");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                UploadBusinessFront = imageUpload.ImgName;
            }
            if (FileUploadBusinessBack.HasFile)
            {
                imageUpload = UploadImage(FileUploadBusinessBack, max.ToString() + "_BusinessDocBack");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                UploadBusinessBack = imageUpload.ImgName;
            }
            if (FileUploadPhoto.HasFile)
            {
                imageUpload = UploadImage(FileUploadPhoto, max.ToString() + "_Photo");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                UploadPhoto = imageUpload.ImgName;
            }
            if (FileUploadShopInside.HasFile)
            {
                imageUpload = UploadImage(FileUploadShopInside, max.ToString() + "_ShopInside");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                UploadShopInside = imageUpload.ImgName;
            }
            if (FileUploadOutSide.HasFile)
            {
                imageUpload = UploadImage(FileUploadOutSide, max.ToString() + "_UploadOutSide");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                UploadOutSide = imageUpload.ImgName;
            }

            DataTable dt = cls.selectDataTable("Exec ProcManage_MerchantKYC 'UpdateKYC','" + id + "','" + hdmerchantId.Value + "','" + txtShopName.Text.Replace("'", "") + "','" + txtName.Text.Replace("'", "") + "','" + txtMobile.Text.Replace("'", "") + "','" + ddlPersonalDoc.SelectedValue + "','" + PersonalFront + "','" + PersonalBack + "','" + txtPersonalDocNumber.Text.Replace("'", "") + "','" + ddlDocumtnBusiness.SelectedValue + "','" + UploadBusinessFront + "','" + UploadBusinessBack + "','" + txtBusinessDocNumber.Text.Replace("'", "") + "','" + UploadPhoto + "','" + UploadShopInside + "','" + UploadOutSide + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('List_MerchantKYC.aspx')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                }
            }
        }
        private ImageUploadStatus UploadImage(FileUpload file, string Number)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = Number + ext;
            if (file.HasFile == true)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif" || Extension == ".mp4")
                    {
                        string opath = Server.MapPath("../Upload/KYCDocument/" + FileName);
                        file.SaveAs(opath);
                        // Stream strm = file.PostedFile.InputStream;
                        // objImgae.GenerateThumbnails(1, strm, opath);
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

    }
}