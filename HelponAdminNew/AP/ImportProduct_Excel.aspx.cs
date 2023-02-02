using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class ImportProduct_Excel : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        static string connString = (System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");

            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Category')", true);
                return;
            }
            else if (ddlSubCategory.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Sub Category')", true);
                return;
            }
            else if (!fileExcel.HasFile)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please select Upload Excel File')", true);
                return;
            }
            try
            {
                DataTable dtExcel = new DataTable();
                ViewState["ExcelData"] = null;
                string strFileType = Path.GetExtension(fileExcel.FileName).ToLower();
                string Name = fileExcel.PostedFile.FileName;
                string ExcelPath = Server.MapPath("~/Upload/Excel/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(ExcelPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(ExcelPath);
                }
                fileExcel.SaveAs(ExcelPath + Name);
                dtExcel = ExcelData(ExcelPath + Name, strFileType);
              
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
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'","") + "')", true);
            }


        }
        public DataTable ExcelData(string Name, string Extension)
        {
            string connString = "";

            //Connection String to Excel Workbook
            if (Extension.Trim() == ".xls")
            {
                connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Name + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
            }
            else if (Extension.Trim() == ".xlsx")
            {
                connString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Name + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
            }

            OleDbConnection connExcel = new OleDbConnection(connString);

            OleDbCommand cmdExcel = new OleDbCommand();

            OleDbDataAdapter oda = new OleDbDataAdapter();

            DataTable dt = new DataTable();

            cmdExcel.Connection = connExcel;
            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();

            cmdExcel.CommandText = "SELECT 'Pending' as Status,'' as Message,Image,Name,MRP,Price,Description From [" + SheetName + "]";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dt);
            connExcel.Close();
            return dt;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["ExcelData"] != null)
                {
                    DataTable dtExcel = (DataTable)ViewState["ExcelData"];
                    if (dtExcel.Rows.Count > 0)
                    {
                        //for (int i = 0; i < dtExcel.Rows.Count; i++)
                        //{

                        //    DataTable dt = cls.selectDataTable("Exec ProcMaster_Product 'insert',0,'" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "','" + dtExcel.Rows[i]["Name"] + "','" + dtExcel.Rows[i]["MRP"] + "','" + dtExcel.Rows[i]["Price"] + "','',0,0,0,N'" + dtExcel.Rows[i]["Description"] + "','" + dtExcel.Rows[i]["Image"] + "'");
                        //    if (dtExcel.Rows[0]["Status"].ToString() == "1")
                        //    {
                        //        dtExcel.Rows[i]["Status"] = "Success";
                        //        dtExcel.Rows[i]["Message"] = dt.Rows[0]["Message"].ToString();
                        //    }
                        //    else
                        //    {
                        //        dtExcel.Rows[i]["Status"] = "Failed";
                        //        dtExcel.Rows[i]["Message"] = dt.Rows[0]["Message"].ToString();
                        //    }


                        //}
                        using (SqlConnection conn = new SqlConnection(connString))
                        {
                            SqlCommand cmd = conn.CreateCommand();
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            cmd.CommandText = "dbo.Proc_UploadProductByExcel"; //The name of the above mentioned stored procedure.  
                            cmd.Parameters.AddWithValue("@CID", ddlCategory.SelectedValue);
                            cmd.Parameters.AddWithValue("@SCID", ddlSubCategory.SelectedValue);
                            cmd.Parameters.AddWithValue("@tblTypeProduct", dtExcel); 
                            conn.Open();
                            cmd.ExecuteNonQuery();
                           
                            conn.Close();
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Upload Successfully');location.replace('ImportProduct_Excel.aspx')", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Upload excel File')", true);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "')", true);
            }
           
        }
       
    }
}