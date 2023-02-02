using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class Buy_Product : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtMerchant = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];

            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");
               // ddlCategory_SelectedIndexChanged(null, null);
            }
        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
            ddlSubCategory_SelectedIndexChanged(null, null);
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Product 'GetforMerchant','" + dtMerchant.Rows[0]["MID"] + "','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "'");
            GvData.DataSource = dt;
            GvData.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "ProductDataTablefilter();", true);
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int chkv = 0;
                for (int i = 0; i < GvData.Rows.Count; i++)
                {

                    CheckBox chk = (CheckBox)GvData.Rows[i].FindControl("chkrow");
                    HiddenField id = (HiddenField)GvData.Rows[i].FindControl("hdnid");
                    HiddenField hdnCID = (HiddenField)GvData.Rows[i].FindControl("hdnCID");
                    HiddenField hdnSCID = (HiddenField)GvData.Rows[i].FindControl("hdnSCID");
                    HiddenField hdnIGST = (HiddenField)GvData.Rows[i].FindControl("hdnIGST");
                    HiddenField hdnSGST = (HiddenField)GvData.Rows[i].FindControl("hdnSGST");
                    HiddenField hdnCGST = (HiddenField)GvData.Rows[i].FindControl("hdnCGST");
                    HiddenField hdnProductName = (HiddenField)GvData.Rows[i].FindControl("hdnProductName");
                    HiddenField hdnMRP = (HiddenField)GvData.Rows[i].FindControl("hdnMRP");
                    HiddenField hdnPrice = (HiddenField)GvData.Rows[i].FindControl("hdnPrice");
                    HiddenField hdnAbout = (HiddenField)GvData.Rows[i].FindControl("hdnAbout");
                    HiddenField hdnIMG1 = (HiddenField)GvData.Rows[i].FindControl("hdnIMG1");
                    if (chk.Checked == true)
                    {
                        if(hdnIGST.Value=="" || hdnIGST.Value == null)
                        {
                            hdnIGST.Value = "0";
                        }
                        if(hdnSGST.Value==""|| hdnSGST.Value == null)
                        {
                            hdnSGST.Value = "0";
                        }
                        if (hdnCGST.Value == "" || hdnCGST.Value == null)
                        {
                            hdnCGST.Value = "0";
                        }
                        if (hdnMRP.Value == "" || hdnMRP.Value == null)
                        {
                            hdnMRP.Value = "0";
                        }
                        if (hdnPrice.Value == "" || hdnPrice.Value == null)
                        {
                            hdnPrice.Value = "0";
                        }
                        cls.ExecuteQuery("Exec ProcManage_MerchantProduct 'insert',0,'" + dtMerchant.Rows[0]["MID"] + "','" + hdnCID.Value.Replace("'", "").Trim() + "','" + hdnSCID.Value.Replace("'", "").Trim() + "','" + hdnProductName.Value.Replace("'", "").Trim() + "','" + hdnMRP.Value.Replace("'", "").Trim() + "','" + hdnPrice.Value.Replace("'", "").Trim() + "','" + hdnCGST.Value.Replace("'", "").Trim() + "','" + hdnSGST.Value.Replace("'", "").Trim() + "','" + hdnIGST.Value.Replace("'", "").Trim() + "',N'" + hdnAbout.Value.Replace("'", "").Trim() + "','" + hdnIMG1.Value + "','','','','',0,'"+id.Value+"'");
                        chkv++;
                    }

                }
                if (chkv == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "swal('Alert !','Please Select Atleast One CheckBox','info');Stoploader();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Successfully Added','success');Stoploader();", true);
                    FillGv();
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','"+ex.Message.Replace("'","")+"','error');Stoploader();", true);
            }
            
        }

        protected void GvData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvData.PageIndex = e.NewPageIndex;
           this.FillGv();
        }
    }
}