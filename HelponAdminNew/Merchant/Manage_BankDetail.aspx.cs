using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HelponAdminNew.GlobalHelper;
using System.IO;

namespace HelponAdminNew.Merchant
{
    public partial class Manage_BankDetail : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
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
                cls.BindDropDownList(ddlBank, "Exec ProcMaster_Bank 'GetforDDL'", "Name", "ID");
                DataTable dt = cls.selectDataTable("Exec ProcManage_MerchantBankDetail 'Get','" + dtMerchant.Rows[0]["MID"] + "'");
                if (dt.Rows.Count > 0)
                {
                    ddlBank.SelectedValue = dt.Rows[0]["BankID"].ToString();
                    txtAccountNo.Text = dt.Rows[0]["AccountNo"].ToString();
                    txtIFSCCode.Text = dt.Rows[0]["IFSC"].ToString();
                    txtBranch.Text = dt.Rows[0]["Branch"].ToString();
                    txtHolderName.Text = dt.Rows[0]["HolderName"].ToString();
                    txtupi.Text = dt.Rows[0]["UPI"].ToString();
                    PreviewImage.ImageUrl = "../Upload/Merchant/Qrcode/"+ dt.Rows[0]["Qrcode"].ToString();

                    btnSubmit.Text = "Update";
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (fileQrcode.HasFile)
            {


               
                imageUpload = UploadImage(fileQrcode, dtMerchant.Rows[0]["MID"].ToString() + "_Qrcode");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                
            }
            DataTable dtresult = cls.selectDataTable("Exec ProcManage_MerchantBankDetail 'insert','" + dtMerchant.Rows[0]["MID"] + "','"+ddlBank.SelectedValue+"','"+txtAccountNo.Text+"','"+txtIFSCCode.Text+"','"+txtBranch.Text+"','"+txtHolderName.Text+"','"+imageUpload.ImgName+"','"+txtupi.Text.Trim()+"'");
            if (dtresult.Rows.Count > 0)
            {
                if (dtresult.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dtresult.Rows[0]["Message"] + "','success').then((value)=>{location.replace('Manage_BankDetail.aspx')})", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dtresult.Rows[0]["Message"] + "','error')", true);
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
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif")
                    {
                        string opath = Server.MapPath("../Upload/Merchant/Qrcode/");
                        //Check whether Directory (Folder) exists.
                        if (!Directory.Exists(opath))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(opath);
                        }
                        file.SaveAs(opath+ FileName);
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