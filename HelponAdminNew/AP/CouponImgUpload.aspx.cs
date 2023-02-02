using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using HelponAdminNew.GlobalHelper;
using System.Configuration;

namespace HelponAdminNew.AP
{
    public partial class CouponImgUpload : System.Web.UI.Page
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
            string maxid = "0";
            if (Request.QueryString["ID"] != null)
            {
                maxid = Request.QueryString["ID"];
            }
            DataTable dtresult = cls.selectDataTable("ProcMaster_AdminCouponImg 'GetAll' ,@ID=" + maxid + "");
            if (dtresult.Rows.Count > 0)
            {
                gvData.DataSource = dtresult;
                gvData.DataBind();
            }
            else
            {
                gvData.DataSource = dtresult;
                gvData.DataBind();
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            if (!ImgUpload.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Slider Image')", true);
                return;
            }
            string maxid = "0";
            if (Request.QueryString["ID"] != null)
            {
                maxid = Request.QueryString["ID"];
            }

            DataTable dt = new DataTable();

            string FileNameMaster = (DateTime.Now.ToString("ddmmyyyhhssf") + ImgUpload.FileName);
            dt = cls.selectDataTable("Exec ProcMaster_AdminCouponImg @Action='insertImage',@ImgId='0',@ID=" + maxid + "" +
                ",@Name='" + FileNameMaster.Replace(" ", "_") + "'");
            uploadStatus = UploadImage(ImgUpload, FileNameMaster.Replace(" ", "_"));


            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');location.replace('ManageCouponImg.aspx')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dt.Rows[0]["Message"] + "');", true);
                }
            }

        }
        private ImageUploadStatus UploadImage(FileUpload file, string fname)
        {
            clsImageResize clsImage = new clsImageResize();
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = fname.Substring(fname.LastIndexOf('.')).ToLower();

            string FileName = fname;
            if (file.HasFile == true)
            {
                if (fname != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif" || Extension == ".mp4" || Extension == ".mkv")
                    {
                        string opath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CoupanCompress"]);
                        string Actual1 = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CoupanActual"]);
                        if (!Directory.Exists(opath))
                            Directory.CreateDirectory(opath);
                        if (!Directory.Exists(Actual1))
                            Directory.CreateDirectory(Actual1);
                        file.PostedFile.SaveAs(opath + FileName);
                        file.PostedFile.SaveAs(Actual1 + fname);

                        objImgae.FixedSize(fname, opath + fname, Actual1 + fname, 1350, 250);

                        uploadStatus.Status = true;
                        uploadStatus.ImgName = fname;
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
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                Label Labelimgname = row.FindControl("lblimgname") as Label;
                //  string Name = cls.ExecuteStringScalar("select Img from [tblMaster_Coupon_Image] where ID='" + e.CommandArgument + "'");
                string Actual = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CoupanCompress"] + Labelimgname);
                string Compress = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CoupanActual"] + Labelimgname);
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
                cls.ExecuteQuery("Delete tblMaster_Coupon_Image where ImgId='" + Convert.ToInt32(e.CommandArgument) + "'");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Deleted Successfully');location.replace('ManageCouponImg.aspx');", true);

            }
        }
    }
}