using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using HelponAdminNew.GlobalHelper;

namespace HelponAdminNew.AP
{
    public partial class Manage_Banner : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        clsImageResize objImgae = new clsImageResize();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGv();
            }
        }
        private void FillGv()
        {
            DataTable dtresult = cls.selectDataTable("ProcManage_Banner 'GetAll'");
            if (dtresult.Rows.Count > 0)
            {
                gvData.DataSource = dtresult;
                gvData.DataBind();
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            if (ddlType.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Select Type')", true);
                return;
            }
            if (!ImgUpload.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Slider Image')", true);
                return;
            }
            if (txtPosition.Text.Length <= 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Enter Position')", true);
                return;
            }
            string maxid ="0";
            if (Request.QueryString["ID"] != null)
            {
                maxid = Request.QueryString["ID"];
            }
            else
            {
                maxid = cls.ExecuteStringScalar("select IsNull(Max(ID),0)+1 from tblManage_Banner");
            }            
            uploadStatus = UploadImage(ImgUpload, "Banner" + maxid);
            if (uploadStatus.Status == false)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + uploadStatus.ImgName + "')", true);
                return;
            }

            cls.ExecuteQuery("ProcManage_Banner 'insert','" + maxid+"','"+uploadStatus.ImgName+"','"+txtlink.Text.Trim()+"','"+txtPosition.Text.Trim()+"','"+ddlType.SelectedValue+"'");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Upload');location.replace('Manage_Banner.aspx');", true);

        }
        private ImageUploadStatus UploadImage(FileUpload file, string Number)
        {
            clsImageResize clsImage = new clsImageResize();
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = Number + ext;
            if (file.HasFile == true)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif"|| Extension == ".mp4" || Extension == ".mkv")
                    {

                        string opath = Server.MapPath("../Upload/Slide/Actual/");
                        string Actual1 = Server.MapPath("../Upload/Slide/Compress/");

                        file.PostedFile.SaveAs(opath + FileName);
                        if (ddlType.SelectedValue == "IMG")
                        {
                            objImgae.FixedSize(FileName, opath + FileName, Actual1 + FileName, 1350, 250);
                        }
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

        protected void gvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                string Name = cls.ExecuteStringScalar("select Img from tblManage_Banner where ID='" + e.CommandArgument + "'");
                string Actual = Server.MapPath("../Upload/Slide/Actual/" + Name);
                string Compress = Server.MapPath("../Upload/Slide/Compress/" + Name);
                FileInfo Actualfile = new FileInfo(Actual);
                FileInfo Compressfile = new FileInfo(Compress);
               
                if (Actualfile.Exists)//check file exsit or not  
                {
                    Actualfile.Delete();

                }
                if (Compressfile.Exists)//check file exsit or not  
                {
                    Compressfile.Delete();

                }
                cls.ExecuteQuery("Delete tblManage_Banner where ID='" + Convert.ToInt32(e.CommandArgument) + "'");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Deleted Successfully');location.replace('Manage_Banner.aspx');", true);

            }
        }

        protected void gvData_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

    }
}