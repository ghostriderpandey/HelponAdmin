using System;
using System.Collections.Generic;
using System.Data;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MerchantSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            dtMerchant = (DataTable)Session["MerchantSession"];
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlType, "select ID,Name from tblMaster_CouponType", "Name", "ID");
                FillData();
            }
        }
        private void FillData()
        {
            DataTable dtData = cls.selectDataTable("ProcMaster_Coupon 'GetAll',0,'" + dtMerchant.Rows[0]["MID"] + "'");
            GvData.DataSource = dtData;
            GvData.DataBind();
            var str = string.Empty;
            for (int s = 0; s < dtData.Rows.Count; s++)
            {
                str += "<div class=\"couponBox CopiedCouponCode\" id=\"Coupon\" style=\"background-color:'" + dtData.Rows[s]["BgColor"].ToString() + "'\">";
                str += "<p class=\"couponValid\">valid <span id=\"spnExpireDate\" style=\"color:'" + dtData.Rows[s]["BgColor"].ToString() + "'\">'" + dtData.Rows[s]["ExpireDate"].ToString() + "'</span></p>";
                str += "<label style=\"text-align: center; font-family: cursive;\">";
                str += "<span style=\"font-family: 'circularstd'; text-transform: capitalize; font-size: 30px;\">Rs.</span>           <span style=\"font-size: 3rem;\" style=\"color:'" + dtData.Rows[s]["BgColor"].ToString() + "'\">'" + dtData.Rows[s]["Discount"].ToString() + "'</span>";
                str += "<span style=\"font-size: 19px;\" style=\"color:'" + dtData.Rows[s]["BgColor"].ToString() + "'\">'" + dtData.Rows[s]["Name"].ToString() + "'</span></label>";
                str += "<p class=\"promocode\">Promo code: <span class=\"code\" style=\"color:'" + dtData.Rows[s]["BgColor"].ToString() + "'\">'" + dtData.Rows[s]["Code"].ToString() + "'</span></p>";
                str += "</div>";
            }
            divcoupon.InnerHtml = str;
        }
        private void GetData(int id)
        {
            DataTable dtresult = cls.selectDataTable("ProcMaster_Coupon 'GetbyID','" + id + "'");
            if (dtresult.Rows.Count > 0)
            {
                ddlType.SelectedValue = dtresult.Rows[0]["TID"].ToString();
                txtDiscount.Text = dtresult.Rows[0]["Discount"].ToString();
                txtExpireDate.Text = Convert.ToDateTime(dtresult.Rows[0]["ExpireDate"].ToString()).ToString("yyyy-MM-dd");
                txttitle.Text = dtresult.Rows[0]["Name"].ToString();
                txtDescription.Text = dtresult.Rows[0]["Description"].ToString();
                ViewState["ID"] = id;
                ViewState["BgColor"] = dtresult.Rows[0]["BgColor"].ToString();
                ViewState["forColor"] = dtresult.Rows[0]["forColor"].ToString();
                btnSubmit.Text = "Update";

            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            var str = string.Empty;
            var strBgColor = string.Empty;
            var strforColor = string.Empty;
            if (ViewState["ID"] != null)
            {
                id = Convert.ToInt32(ViewState["ID"]);
                str += "Exec ProcMaster_Coupon 'UpdateC',@ID='" + id + "',";
                if (ViewState["BgColor"].ToString() != txtBgColor.Text.Replace("'", "").Trim())
                    strBgColor = ViewState["BgColor"].ToString();
                else
                    strBgColor = txtBgColor.Text.Replace("'", "").Trim();
                if (ViewState["forColor"].ToString() != txtColor.Text.Replace("'", "").Trim())
                    strforColor = ViewState["forColor"].ToString();
                else
                    strforColor = txtColor.Text.Replace("'", "").Trim();
            }
            else
            {
                str += "Exec ProcMaster_Coupon 'insertC',@Code='" + ddlType.SelectedItem.Text + "  " + GenerateCcode() + "',";
                strBgColor = txtBgColor.Text.Replace("'", "").Trim();
                strforColor = txtColor.Text.Replace("'", "").Trim();
            }
            str += "@MID='" + dtMerchant.Rows[0]["MID"] + "',@Name='" + txttitle.Text.Replace("'", "").Trim() + "',@TID='" + ddlType.SelectedValue + "',@Discount='" + txtDiscount.Text.Replace("'", "").Trim() + "',@Description='" + txtDescription.Text.Replace("'", "").Trim() + "',@ExpireDate='" + txtExpireDate.Text.Replace("'", "").Trim() + "',@BgColor='" + strBgColor + "',@forColor='" + strforColor + "'";
            DataTable dt = cls.selectDataTable(str);
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
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                cls.ExecuteQuery("Delete tblMaster_Coupon where ID='" + e.CommandArgument + "'");
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
    }
}