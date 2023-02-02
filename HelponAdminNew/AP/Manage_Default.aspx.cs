using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class Manage_Default : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                cls.BindDropDownList(ddlCategory, "select ID,Name from tblMaster_Category where Type='Main' order by Name asc", "Name", "ID");
            }
        }
        public void FillGv()
        {

            DataTable dtresult = cls.selectDataTable("Exec ProcManage_Default 'GetAll',0,'" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "'");
            GvData.DataSource = dtresult;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcManage_Default 'GetbyID','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                string URL = "~/Upload/Default/";
                ddlCategory.SelectedValue = dtresult.Rows[0]["CID"].ToString();
                ddlCategory_SelectedIndexChanged(null, null);
                ddlSubCategory.SelectedValue = dtresult.Rows[0]["SCID"].ToString();
                txtAboutus.Text= dtresult.Rows[0]["Abouts"].ToString();
                txtAmenities.Text= dtresult.Rows[0]["Amenities"].ToString();
                PreviewProfile.ImageUrl = URL+ dtresult.Rows[0]["Profile"].ToString();
                PreviewThumbnail.ImageUrl = URL+ dtresult.Rows[0]["Thumbnail"].ToString();
                PreviewSlider.ImageUrl = URL+ dtresult.Rows[0]["Slider"].ToString();
                PriviewFileGallery1.ImageUrl = URL+ dtresult.Rows[0]["Gallery1"].ToString();
                PriviewFileGallery2.ImageUrl = URL+ dtresult.Rows[0]["Gallery2"].ToString();
                PriviewFileGallery3.ImageUrl = URL+ dtresult.Rows[0]["Gallery3"].ToString();
                
                ViewState["ID"] = id;
                btnSubmit.Text = "Update";
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "select ID,Name from tblMaster_SubCategory where CID='" + ddlCategory.SelectedValue + "' and Type='Main' order by Name asc", "Name", "ID");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            int max = 0;
            string Profile = "";
            string Thumbnail = "";
            string Slider = "";
            string video = "";
            string Gallery1 = "";
            string Gallery2 = "";
            string Gallery3 = "";
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
            }
            if (ViewState["ID"] != null)
            {
                max = Convert.ToInt32(ViewState["ID"]);
            }
            else
            {
                max = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblManage_Default");
            }
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (FileProfile.HasFile)
            {
                imageUpload = UploadImage(FileProfile, max.ToString() + "_Profile");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Profile = imageUpload.ImgName;
            }
            if (FileThumbnail.HasFile)
            {
                imageUpload = UploadImage(FileThumbnail, max.ToString() + "_Thumbnail");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Thumbnail = imageUpload.ImgName;
            }
            if (FileSlider.HasFile)
            {
                imageUpload = UploadImage(FileSlider, max.ToString() + "_Slider");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Slider = imageUpload.ImgName;
            }
            if (FileSlider.HasFile)
            {
                imageUpload = UploadImage(FileSlider, max.ToString() + "_Slider");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Slider = imageUpload.ImgName;
            }
            if (FileGallery1.HasFile)
            {
                imageUpload = UploadImage(FileGallery1, max.ToString() + "_Gallery1");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Gallery1 = imageUpload.ImgName;
            }
            if (FileGallery2.HasFile)
            {
                imageUpload = UploadImage(FileGallery2, max.ToString() + "_Gallery2");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Gallery2 = imageUpload.ImgName;
            }
            if (FileGallery3.HasFile)
            {
                imageUpload = UploadImage(FileGallery3, max.ToString() + "_Gallery3");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Gallery3 = imageUpload.ImgName;
            }
            if (fileVideo.HasFile)
            {
                imageUpload = UploadImage(fileVideo, max.ToString() + "_Video");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                video = imageUpload.ImgName;
            }
            DataTable dt = cls.selectDataTable("Exec ProcManage_Default 'insert','" + id + "','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','" + Profile + "','" + Thumbnail + "','" + Slider + "',N'" + txtAboutus.Text.Replace("'", "").Trim() + "',N'" + txtAmenities.Text.Replace("'", "").Trim() + "','" + video + "','" + Gallery1 + "','" + Gallery2 + "','" + Gallery3 + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('Manage_Default.aspx')", true);

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
                        string opath = Server.MapPath("../Upload/Default/" + FileName);
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

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                cls.ExecuteQuery("Delete tblManage_Default where ID='" + e.CommandArgument + "'");
                FillGv();
            }
            else if (e.CommandName == "IsChange")
            {
                GetData(Convert.ToInt32(e.CommandArgument));
            }
            else if (e.CommandName == "IsProduct")
            {
                Response.Redirect("ProductAssgin.aspx?Id='" + e.CommandArgument + "'");
            }
        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}