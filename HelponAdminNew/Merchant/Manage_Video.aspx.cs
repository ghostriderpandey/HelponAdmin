using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Manage_Video : System.Web.UI.Page
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
                string VideoUrl = cls.ExecuteStringScalar("select VideoName from tblManage_Videos where MID='" + dtMerchant.Rows[0]["MID"]+"'");
                video.Src = "../Upload/Videos/" + VideoUrl;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!fileVideo.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Please Select Video','error')", true);
                return;
            }
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            uploadStatus = UploadVideos(fileVideo, dtMerchant.Rows[0]["MID"].ToString());
            if (uploadStatus.Status == false)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','"+uploadStatus.ImgName+"','error')", true);
                return;
            }
            if((cls.ExecuteIntScalar("select Count(*) from tblManage_Videos where MID='" + dtMerchant.Rows[0]["MID"] + "'")) == 0)
            {
                cls.ExecuteQuery("insert into tblManage_Videos(MID,VideoName,AddByType)values('" + dtMerchant.Rows[0]["MID"] + "','" + uploadStatus.ImgName + "','Merchant')");
            }
            else
            {
                cls.ExecuteQuery("Update tblManage_Videos SET VideoName='" + uploadStatus.ImgName + "' where MID='" + dtMerchant.Rows[0]["MID"] + "'");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert','Successfully Upload','success').then((value)=>{location.replace('Manage_Video.aspx')})", true);
        }
        private ImageUploadStatus UploadVideos(FileUpload file, string Number)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = Number + ext;
            if (file.HasFile)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".mp4")
                    {

                        string opath = Server.MapPath("../Upload/Videos/");
                        if (!Directory.Exists(opath))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(opath);
                        }
                        file.PostedFile.SaveAs(opath + FileName);
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
            return uploadStatus;
        }

    }
}