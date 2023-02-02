using HelponAdminNew.GlobalHelper;
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
    public partial class Master_Category : System.Web.UI.Page
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
                FillData();
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcMaster_Category 'GetAll',0,'"+Request.QueryString["Type"]+"'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcMaster_Category 'GetAll','"+id+"'");
            if (dtresult.Rows.Count > 0)
            {
                txtName.Text = dtresult.Rows[0]["Name"].ToString();
                txtDescription.Text = dtresult.Rows[0]["Description"].ToString();
                ViewState["ID"] = id;
                btnSubmit.Text = "Update";
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            int max = 0;
            string CIMG = "";
            string SlideIMG = "";
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
            }
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            if (filecategory.HasFile)
            {
                if (ViewState["ID"] != null)
                {
                    max = Convert.ToInt32(ViewState["ID"]);
                }
                else
                {
                    max = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblMaster_Category");
                }
                imageUpload = UploadImage(filecategory, max.ToString() + "_CAT");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                CIMG = imageUpload.ImgName;
            }
            if (fileSlideImgUpload.HasFile)
            {


                if (ViewState["ID"] != null)
                {
                    max = Convert.ToInt32(ViewState["ID"]);
                }
                else
                {
                    max = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblMaster_Category");
                }
                imageUpload = UploadImage(fileSlideImgUpload, max.ToString() + "_SubcatIcon");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                SlideIMG = imageUpload.ImgName;
            }
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Category 'insert','" + id + "','" + txtName.Text.Replace("'", "").Trim() + "',N'" + txtDescription.Text.Replace("'", "").Trim() + "','" + CIMG + "','"+ Request.QueryString["Type"] + "','"+ SlideIMG + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('Master_Category.aspx?Type="+ Request.QueryString["Type"] + "')", true);

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
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif")
                    {
                        string opath = Server.MapPath("../Upload/Category/" + FileName);
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
                cls.ExecuteQuery("Exec ProcMaster_Category 'IsDelete','" + e.CommandArgument + "'");
                FillData();
            }
            else if(e.CommandName== "IsChange")
            {
                GetData(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}