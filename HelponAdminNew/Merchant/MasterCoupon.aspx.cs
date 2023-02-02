using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Master_Coupon : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtMerchant = new DataTable();
        clsImageResize objImgae = new clsImageResize();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];
            txtcoupancode.Text = GenerateCcode();
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlType, "select ID,Name from tblMaster_CouponType", "Name", "ID");
                cls.BindDropDownList(ddltemplatetype, "Exec ProcMaster_AdminCouponImg GetddlAll", "Name", "ImgId");
                FillData();
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcMaster_MerchantCoupon 'GetAll',0,@MId='" + dtMerchant.Rows[0]["MID"] + "'");
            GvData.DataSource = dtData;
            GvData.DataBind();
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcMaster_MerchantCoupon 'GetbyId','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                ddlType.SelectedValue = dtresult.Rows[0]["TemplateId"].ToString();
                ViewState["bgImgPath"] = dtresult.Rows[0]["TemplatePath"].ToString();
                txtbusinessname.Text = dtresult.Rows[0]["BusinessName"].ToString();
                txtfestivalname.Text = dtresult.Rows[0]["FestivalName"].ToString();
                txtproductname.Text = dtresult.Rows[0]["ProductName"].ToString();
                txtcoupancode.Text = dtresult.Rows[0]["CouponsCode"].ToString();
                ddlType.Text = dtresult.Rows[0]["Discount"].ToString();
                txtColor.Text = dtresult.Rows[0]["TextColor"].ToString();
                txtExpireDate.Text = dtresult.Rows[0]["ExpiryDate"].ToString();
                txtDescription.Text = dtresult.Rows[0]["Remark"].ToString();
                txtamount.Text = dtresult.Rows[0]["Amount"].ToString();
                ViewState["CID"] = id;
                btnSubmit.Text = "Update";

            }

        }
        public string GenerateCcode()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[6];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
            }
            if (!uploader.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Select Image')", true);
                return;
            }
            DataTable dt = new DataTable();
            var str = string.Empty;
            uploadStatus = UploadImage(uploader);
            if (id > 0)
                str += "Exec ProcMaster_MerchantCoupon 'update',@CID='" + id + "'";
            else
                str += "Exec ProcMaster_MerchantCoupon 'insert'";

            str += ",@MId='" + dtMerchant.Rows[0]["MID"] + "',@TemplateId = '" + ddltemplatetype.SelectedValue + "',@TemplatePath = '" + ViewState["bgImgPath"] + "',@BusinessName = '" + txtbusinessname.Text.Replace("'", "").Trim() + "',@FestivalName='" + txtfestivalname.Text.Replace("'", "").Trim() + "',@ProductName = '" + txtproductname.Text.Replace("'", "").Trim() + "',@CouponsCode='" + txtcoupancode.Text.Replace("'", "").Trim() + "',@Discount = '" + ddlType.SelectedValue + "',@TextColor = '" + txtColor.Text.Replace("'", "").Trim() + "',@Remark='" + txtDescription.Text.Replace("'", "").Trim() + "',@ExpiryDate = '" + txtExpireDate.Text.Replace("'", "").Trim() + "',@IsActive=1,@Amount='" + txtamount.Text.Trim().Replace("'", "") + "'";
            dt = cls.selectDataTable(str);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','success').then((value)=>{location.replace('Master_Coupon.aspx')})", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','info');", true);
                }
            }
        }
        private ImageUploadStatus UploadImage(FileUpload file)
        {
            clsImageResize clsImage = new clsImageResize();
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = file.FileName + ext;
            if (file.HasFile == true)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif" || Extension == ".mp4" || Extension == ".mkv")
                    {
                        string opath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CImageCompress"]);
                        string Actual1 = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["CImageActual"]);
                        if (!Directory.Exists(opath))
                            Directory.CreateDirectory(opath);
                        if (!Directory.Exists(Actual1))
                            Directory.CreateDirectory(Actual1);
                        file.PostedFile.SaveAs(opath + FileName);
                        file.PostedFile.SaveAs(Actual1 + FileName);


                        objImgae.FixedSize(FileName, opath + FileName, Actual1 + FileName, 100, 80);

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
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                cls.ExecuteQuery("Delete tblMaster_MerchantCoupon where CID='" + e.CommandArgument + "'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Delete Successfully','success');", true);
                FillData();
            }
            else if (e.CommandName == "IsChange")
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

        protected void ddltemplatetype_SelectedIndexChanged(object sender, EventArgs e)
        {
            var bgImg = cls.ExecuteStringScalar("Exec ProcMaster_AdminCouponImg GetddlAllbgImg,@ImgId=" + ddltemplatetype.SelectedValue + "");
            ViewState["bgImgPath"] = bgImg;
            divcoupon.Style.Add("background-image", bgImg);
        }
    }
}