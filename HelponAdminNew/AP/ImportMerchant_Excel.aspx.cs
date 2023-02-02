using Dapper;
using HelponAdminNew.App_Data;
using HelponAdminNew.GlobalHelper;
using iTextSharp.text.pdf.codec;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Spire.Xls;
using System.Data.SqlClient;

namespace HelponAdminNew.AP
{
    public partial class ImportMerchant_Excel : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Main'", "Name", "ID");

            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Main'", "Name", "ID");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Category');Stoploader();", true);
                return;
            }
            else if (ddlSubCategory.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Sub Category');Stoploader();", true);
                return;
            }
            else if (!fileExcel.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Upload Excel File');Stoploader();", true);
                return;
            }
            string strFileType = "";
            string Name = "";
            string ExcelPath = "";
            try
            {
                DataTable dtExcel = new DataTable();
                ViewState["ExcelData"] = null;
                strFileType = Path.GetExtension(fileExcel.FileName).ToLower();
                Name = fileExcel.PostedFile.FileName;
                ExcelPath = Server.MapPath("~/Upload/Excel/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(ExcelPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(ExcelPath);
                }
                fileExcel.SaveAs(ExcelPath + Name);
                dtExcel = cls.ExcelData(ExcelPath + Name, strFileType);
               
                ViewState["ExcelData"] = dtExcel;
                gvData.DataSource = dtExcel;
                gvData.DataBind();
                if (dtExcel.Rows.Count > 0)
                {
                    btnUpload.Visible = true;
                }
                else
                {
                    btnUpload.Visible = false;
                }
                FileInfo Excelfile = new FileInfo(ExcelPath + Name);
                if (Excelfile.Exists)//check file exsit or not  
                {
                    Excelfile.Delete();
                }
            }
            catch(Exception ex)
            {
                FileInfo Excelfile = new FileInfo(ExcelPath + Name);
                if (Excelfile.Exists)//check file exsit or not  
                {
                    Excelfile.Delete();
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('"+ex.Message.Replace("'","")+ "');Stoploader();", true);
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "Stoploader();", true);
        }
        
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["ExcelData"] != null)
                {
                    DataTable dt = (DataTable)ViewState["ExcelData"];
                    
                    if (dt.Rows.Count > 0)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                           
                            cls.ExecuteQuery("Exec ProcMaster_AddMerchantByExcel 'insert','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','" + dt.Rows[i]["BusinessName"].ToString().Replace("'", "") + "','" + dt.Rows[i]["OwnerName"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Mobile"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Email"].ToString().Replace("'", "") + "','" + dt.Rows[i]["State"].ToString().Replace("'", "") + "','" + dt.Rows[i]["District"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Address"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Pincode"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Twitter"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Instagram"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Facebook"].ToString().Replace("'", "") + "','" + dt.Rows[i]["WebSite"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Abouts"].ToString().Replace("'", "") + "','" + dt.Rows[i]["Photo"].ToString().Replace("'", "") + "'");
                        }
                        //using (SqlConnection conn = new SqlConnection("Data Source=205.147.96.31;Initial Catalog=db_Helpon;Persist Security Info=True;User ID=User_Helpon;Password=Helpon@2022;Pooling=True;Min Pool Size=0;Max Pool Size=250;Connect Timeout=100000"))
                        //{
                        //    SqlCommand cmd = conn.CreateCommand();
                        //    cmd.CommandType = CommandType.StoredProcedure;
                        //    cmd.CommandText = "dbo.Proc_UploadMerchantByExcel";
                        //    cmd.Parameters.AddWithValue("@CID", ddlCategory.SelectedValue);
                        //    cmd.Parameters.AddWithValue("@SCID", ddlSubCategory.SelectedValue);
                        //    cmd.Parameters.AddWithValue("@TypeImportMerchantByExcel", dt);
                        //    conn.Open();
                        //    cmd.ExecuteNonQuery();
                        //    conn.Close();
                        //}
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Upload Successfully');location.replace('ImportMerchant_Excel.aspx');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Upload excel File');Stoploader();", true);
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "');Stoploader();", true);
            }
            
        }
    }
}