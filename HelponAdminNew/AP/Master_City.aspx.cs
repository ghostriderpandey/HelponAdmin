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
    public partial class Master_City : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
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
                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                ddlState_SelectedIndexChanged(null, null);
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcMaster_City 'GetAll',0,'"+ddlState.SelectedValue+"'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcMaster_City 'GetbyID','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                ddlState.SelectedValue = dtresult.Rows[0]["StateID"].ToString();
                txtName.Text = dtresult.Rows[0]["Cityname"].ToString();
                ViewState["ID"] = id;
                btnSubmit.Text = "Update";
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            string Img = "";
            int id = 0;
            int max = 0;
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
            }
            if (fileSlideImgUpload.HasFile)
            {
                if (ViewState["ID"] != null)
                {
                    max = Convert.ToInt32(ViewState["ID"]);
                }
                else
                {
                    max = cls.ExecuteIntScalar("select Isnull(Max(CityID),0)+1 from tblMaster_City");
                }
                imageUpload = UploadImage(fileSlideImgUpload, max.ToString() + "_City");
                if (imageUpload.Status == false)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                    return;
                }
                Img = imageUpload.ImgName;
            }

            DataTable dt = cls.selectDataTable("Exec ProcMaster_City 'insert','" + id + "','"+ddlState.SelectedValue+"','" + txtName.Text.Replace("'", "").Trim() + "','"+Img+"'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('Master_City.aspx')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                }
            }
        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsActive")
            {
                cls.ExecuteQuery("Exec ProcMaster_City 'IsActive','" + e.CommandArgument + "'");
                FillData();
            }
            else if (e.CommandName == "IsChange")
            {
                GetData(Convert.ToInt32(e.CommandArgument));
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
                        string opath = Server.MapPath("../Upload/Popup/" + FileName);
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
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillData();
        }
    }
}