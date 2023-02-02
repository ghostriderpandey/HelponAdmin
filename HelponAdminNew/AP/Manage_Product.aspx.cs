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
    public partial class Manage_Product : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");
                if (Request.QueryString["ID"] != null)
                {
                    GetData(Convert.ToInt32(Request.QueryString["ID"]));
                }
            }
        }
        private void GetData(int id)
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Product 'Get','" + id + "'");
            if (dt.Rows.Count > 0)
            {
                ddlCategory.SelectedValue = dt.Rows[0]["CID"].ToString();
                ddlCategory_SelectedIndexChanged(null, null);
                ddlSubCategory.SelectedValue = dt.Rows[0]["SCID"].ToString();
                txtName.Text= dt.Rows[0]["Name"].ToString();
                txtMrp.Text= dt.Rows[0]["Mrp"].ToString();
                txtPrice.Text= dt.Rows[0]["Price"].ToString();
                lblCGST.Text= dt.Rows[0]["CGST"].ToString();
                lblSGST.Text= dt.Rows[0]["SGST"].ToString();
                txtIGST.Text= dt.Rows[0]["IGST"].ToString();
                txtDescription.Text= dt.Rows[0]["About"].ToString();
                btnSubmit.Text = "Update";
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
        }

        protected void txtIGST_TextChanged(object sender, EventArgs e)
        {
            decimal IGST = Convert.ToDecimal(txtIGST.Text);
            decimal CGST = 0;
            if (IGST > 0)
            {
                CGST = IGST / 2;
                lblCGST.Text = CGST.ToString();
                lblSGST.Text = CGST.ToString();
            }
            lblCGST.Text = CGST.ToString();
            lblSGST.Text = CGST.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ImageUploadStatus imageUpload = new ImageUploadStatus();
            int id = 0;
            string IMG1 = "", IMG2 = "", IMG3 = "", IMG4 = "", IMG5 = "";
            int maxid = 0;
            if (Request.QueryString["ID"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
                maxid = Convert.ToInt32(Request.QueryString["ID"]);
               
                DataTable dtIMG = cls.selectDataTable("select IMG1,IMG2,IMG3,IMG4,IMG5 from tblMaster_product where ID='" + id + "'");
                IMG1 = dtIMG.Rows[0]["IMG1"].ToString();
                IMG2 = dtIMG.Rows[0]["IMG2"].ToString();
                IMG3 = dtIMG.Rows[0]["IMG3"].ToString();
                IMG4 = dtIMG.Rows[0]["IMG4"].ToString();
                IMG5 = dtIMG.Rows[0]["IMG5"].ToString();
            }
            else
            {
                if (!fileImgThumbnail.HasFile)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Upload Thumbnail Photo')", true);
                    return;

                }
                maxid = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblMaster_product");
            }
            
           
            DataTable dtresult = cls.selectDataTable("Exec ProcMaster_Product 'insert','" + id + "','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','" + txtName.Text.Trim() + "','" + txtMrp.Text.Replace("'", "").Trim() + "','" + txtPrice.Text.Replace("'", "").Trim() + "','" + lblCGST.Text.Replace("'", "").Trim() + "','" + lblSGST.Text.Replace("'", "").Trim() + "','" + txtIGST.Text.Replace("'", "").Trim() + "',N'" + txtDescription.Text.Replace("'", "").Trim() + "','" + IMG1 + "','" + IMG2 + "','" + IMG3 + "','" + IMG4 + "','" + IMG5 + "'");
            if (dtresult.Rows.Count > 0)
            {
                if (dtresult.Rows[0]["Status"].ToString() == "1")
                {
                    if (fileImgThumbnail.HasFile)
                    {
                        imageUpload = UploadImage(fileImgThumbnail, IMG1);
                        if (imageUpload.Status == false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                            return;
                        }
                        IMG1 = "";
                        IMG1 = imageUpload.ImgName;
                    }
                    if (fileImg1.HasFile)
                    {
                        imageUpload = UploadImage(fileImg1, IMG2);
                        if (imageUpload.Status == false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                            return;
                        }
                        IMG2 = "";
                        IMG2 = imageUpload.ImgName;
                    }
                    if (fileImg2.HasFile)
                    {
                        imageUpload = UploadImage(fileImg2, IMG3);
                        if (imageUpload.Status == false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                            return;
                        }
                        IMG3 = "";
                        IMG3 = imageUpload.ImgName;
                    }
                    if (fileImg3.HasFile)
                    {
                        imageUpload = UploadImage(fileImg3, IMG4);
                        if (imageUpload.Status == false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                            return;
                        }
                        IMG4 = "";
                        IMG4 = imageUpload.ImgName;
                    }
                    if (fileImg4.HasFile)
                    {
                        imageUpload = UploadImage(fileImg4, IMG5);
                        if (imageUpload.Status == false)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + imageUpload.ImgName + "')", true);
                            return;
                        }
                        IMG5 = "";
                        IMG5 = imageUpload.ImgName;
                    }
                    cls.ExecuteQuery("Update tblMaster_product SET IMG1='"+IMG1+"',IMG2='"+IMG2+"',IMG3='"+IMG3+"',IMG4='"+IMG4+"',IMG5='"+IMG5+"' where ID='" + maxid + "'");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "');location.replace('Manage_Product.aspx')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + dtresult.Rows[0]["Message"] + "')", true);
                }
            }
        }
        private ImageUploadStatus UploadImage(FileUpload file,string ExistName)
        {
            clsImageResize objImgae = new clsImageResize();
            ImageUploadStatus uploadStatus = new ImageUploadStatus();
            Random random = new Random();
            string Name = "IMG" + random.Next(10000, 99999).ToString();
            string ext = file.FileName.Substring(file.FileName.LastIndexOf('.')).ToLower();
            string FileName = Name + ext;
            if (file.HasFile == true)
            {
                if (file.PostedFile.FileName != "")
                {
                    string Extension = ext;
                    if (Extension == ".jpg" || Extension == ".jpeg" || Extension == ".png" || Extension == ".gif")
                    {

                        string Actual = Server.MapPath("~/Upload/Product/Actual/");
                        string Medium = Server.MapPath("~/Upload/Product/Medium/");
                        string Small = Server.MapPath("~/Upload/Product/Small/");
                        //Check whether Directory (Folder) exists.
                        if (!Directory.Exists(Actual))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(Actual);
                        }
                        if (!Directory.Exists(Medium))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(Medium);
                        }
                        if (!Directory.Exists(Small))
                        {
                            //If Directory (Folder) does not exists. Create it.
                            Directory.CreateDirectory(Small);
                        }
                        FileInfo Actualfile = new FileInfo(Actual + Name);
                        FileInfo Mediumfile = new FileInfo(Medium + Name);
                        FileInfo Smallfile = new FileInfo(Small + Name);
                        if (Actualfile.Exists)//check file exsit or not  
                        {
                            Actualfile.Delete();
                        }
                        if (Mediumfile.Exists)//check file exsit or not  
                        {
                            Mediumfile.Delete();
                        }
                        if (Smallfile.Exists)//check file exsit or not  
                        {
                            Smallfile.Delete();
                        }
                        file.PostedFile.SaveAs(Actual + FileName);
                        objImgae.FixedSize(FileName, Actual + FileName, Medium + FileName, 300, 300);
                        objImgae.FixedSize(FileName, Actual + FileName, Small + FileName, 150, 150);
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