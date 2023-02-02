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
    public partial class Manage_Gallery : System.Web.UI.Page
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
                GetGallery();
            }
        }
        private void GetGallery()
        {
            DataTable dtresult = cls.selectDataTable("select * from tblManage_Gallery where MID='" + dtMerchant.Rows[0]["MID"] + "'");
            rpData.DataSource = dtresult;
            rpData.DataBind();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (fileGallery.HasFile)
            {

                //int max = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblManage_Gallery");
                //imageUpload = UploadImage(fileGallery, max.ToString() + "_Gallery");
                //if (imageUpload.Status == false)
                //{
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                //    return;
                //}
                
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFile postedFile = Request.Files[i];
                    if (postedFile.ContentLength > 0)
                    {
                        string ext = postedFile.FileName.Substring(postedFile.FileName.LastIndexOf('.')).ToLower();
                        if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".gif")
                        {
                            int max = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblManage_Gallery");
                            string fileName = max.ToString() + "_Gallery"+ ext;
                            postedFile.SaveAs(Server.MapPath("~/Upload/Gallery/") + fileName);
                            cls.ExecuteQuery("insert into tblManage_Gallery(MID,IMG)values('" + dtMerchant.Rows[0]["MID"] + "','" + fileName + "')");
                        }
                    }
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Upload Successfully');location.replace('Manage_Gallery.aspx')", true);
                //GetGallery();
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
                        string opath = Server.MapPath("../Upload/Gallery/" + FileName);
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

        protected void rpData_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName== "IsDelete")
            {
                cls.ExecuteQuery("Delete tblManage_Gallery where ID='" + e.CommandArgument + "'");
                GetGallery();
            }
        }
    }
}