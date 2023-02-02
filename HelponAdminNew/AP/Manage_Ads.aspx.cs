using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class Manage_Ads : System.Web.UI.Page
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
            DataTable dtresult = cls.selectDataTable("ProcManage_Ads 'GetAll'");
            if (dtresult.Rows.Count > 0)
            {
                gvData.DataSource = dtresult;
                gvData.DataBind();
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string maxid = "0";
            string URL = "";
            int ID = 0;
            if (Request.QueryString["ID"] != null)
            {
                maxid = Request.QueryString["ID"];
                ID = Convert.ToInt32(Request.QueryString["ID"]);
            }
            else
            {
                maxid = cls.ExecuteStringScalar("select IsNull(Max(ID),0)+1 from tblManage_Ads");
            }
            if (ImgUpload.HasFile)
            {
                uploadStatus = UploadImage(ImgUpload,txtMerchantID.Text+ddlType.SelectedValue + maxid);
                if (uploadStatus.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + uploadStatus.ImgName + "')", true);
                    return;
                }
                URL = uploadStatus.ImgName;

            }
            else if (txtlink.Text.Length > 0)
            {
                URL = txtlink.Text;
            }

            DataTable dtresult = cls.selectDataTable("Exec ProcManage_Ads 'insert','"+ID+"','"+hndMID.Value+"','"+URL+"','"+ddlType.SelectedValue+"','"+txtPosition.Text+"'");
            if (dtresult.Rows.Count > 0)
            {
                if (dtresult.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "');location.replace('Manage_Ads.aspx');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "');", true);
                }
            }
          
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
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif" || Extension == ".mp4" || Extension == ".mkv")
                    {

                        string opath = Server.MapPath("../Upload/Ads/");
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

        protected void txtMerchantID_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = cls.selectDataTable("select * from tblMaster_Merchant where LoginID='"+txtMerchantID.Text+"'");
            if (dt.Rows.Count > 0)
            {
                hndMID.Value = dt.Rows[0]["MID"].ToString();
                lblMerchantname.Text = dt.Rows[0]["Name"].ToString();
            }
            else
            {
                txtMerchantID.Text = "";
                hndMID.Value = "0";
                lblMerchantname.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('invalid Merchant')", true);
            }
        }
    }
}