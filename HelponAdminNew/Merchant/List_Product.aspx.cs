using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class List_Product : System.Web.UI.Page
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
                ddlCategory_SelectedIndexChanged(null, null);
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
            ddlSubCategory_SelectedIndexChanged(null, null);
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcManage_MerchantProduct 'GetAll',0,'" + dtMerchant.Rows[0]["MID"] + "','" + ddlCategory.SelectedValue + "','" + ddlSubCategory.SelectedValue + "'");
            GvData.DataSource = dt;
            GvData.DataBind();
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsActive")
            {
                cls.ExecuteQuery("Exec ProcManage_MerchantProduct 'IsActive','" + e.CommandArgument + "'");
                FillGv();
            }
            else if (e.CommandName == "Delete")
            {
                cls.ExecuteQuery("Exec ProcManage_MerchantProduct 'Delete','" + e.CommandArgument + "'");
                FillGv();
            }
            else if (e.CommandName == "UpdateStock")
            {
                ViewState["ID"] = e.CommandArgument;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "StockUpdateModel();", true);
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {

                int chkv = 0;
                for (int i = 0; i < GvData.Rows.Count; i++)
                {

                    CheckBox chk = (CheckBox)GvData.Rows[i].FindControl("chkrow");
                    HiddenField id = (HiddenField)GvData.Rows[i].FindControl("hdnid");

                    if (chk.Checked == true)
                    {
                        //cls.ExecuteQuery("Delete tblManage_MerchantProduct where ID='" + id.Value + "'");
                        cls.ExecuteQuery("ProcManage_MerchantProduct 'Delete','" + id.Value + "'");
                        chkv++;
                    }

                }
                if (chkv == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Select Atleast One CheckBox');Stoploader();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Deleted');Stoploader();", true);
                    FillGv();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "');Stoploader();", true);
            }
        }
        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }

        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void btnUpdateAll_Click(object sender, EventArgs e)
        {
            try
            {

                int chkv = 0;
                for (int i = 0; i < GvData.Rows.Count; i++)
                {

                    CheckBox chk = (CheckBox)GvData.Rows[i].FindControl("chkrow");
                    HiddenField id = (HiddenField)GvData.Rows[i].FindControl("hdnid");
                    TextBox txtMrp = (TextBox)GvData.Rows[i].FindControl("txtMrp");
                    TextBox txtPrice = (TextBox)GvData.Rows[i].FindControl("txtPrice");
                    TextBox txtstock = (TextBox)GvData.Rows[i].FindControl("txtstock");

                    if (chk.Checked == true)
                    {
                        //cls.ExecuteQuery("Delete tblManage_MerchantProduct where ID='" + id.Value + "'");
                        cls.ExecuteQuery("Update tblManage_MerchantProduct SET Mrp='" + txtMrp.Text + "',Price='" + txtPrice.Text + "' where ID='" + id.Value + "'");
                        cls.ExecuteQuery("Exec ProcManage_Stock 'insert','" + id.Value + "','" + txtstock.Text + "','" + dtMerchant.Rows[0]["MID"] + "','Merchant'");
                        chkv++;
                    }

                }
                if (chkv == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Select Atleast One CheckBox');Stoploader();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully Update');Stoploader();", true);
                    FillGv();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "');Stoploader();", true);
            }
        }

        protected void btnUpdateStock_Click(object sender, EventArgs e)
        {
            if (ViewState["ID"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Invalid Product','info');Stoploader();", true);
                return;
            }
            else if (ddlStockType.SelectedValue == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Please Select Stock type','info');Stoploader();", true);
                return;
            }
            else if (txtQty.Text == "" || txtQty.Text == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Please Enter Stock Quantity','info');Stoploader();", true);
                return;
            }
            int Qty = 0;
            if (ddlStockType.SelectedValue == "IN")
            {
                Qty = Convert.ToInt32(txtQty.Text);
            }
            else if (ddlStockType.SelectedValue == "OUT")
            {
                Qty = (0 - Convert.ToInt32(txtQty.Text));
            }
            cls.ExecuteQuery("Exec ProcManage_Stock 'insert','" + ViewState["ID"] + "','" + Qty + "','" + dtMerchant.Rows[0]["MID"] + "','Merchant'");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Successfully Added','success')", true);
            ViewState["ID"] = null;
            txtQty.Text = "0";

            FillGv();
        }
    }
}