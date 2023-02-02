using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class ProductAssgin : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"].ToString() != null)
                {
                    FillGv();
                }


            }
        }


        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Product 'GetAll'");
            GvData.DataSource = dt;
            GvData.DataBind();

        }
        protected void btnUpdateAll_Click(object sender, EventArgs e)
        {
            try
            {
                var catId = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblManage_Default where Id=" + Request.QueryString["Id"].ToString() + "");
                var subcatId = cls.ExecuteIntScalar("select Isnull(Max(ID),0)+1 from tblManage_Default where Id=" + Request.QueryString["Id"].ToString() + "");
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
                        cls.ExecuteQuery("insert into tblMaster_Product(CID,SCID,Name,Mrp,Price,CGST,SGST,IGST,About,AboutHTML, IMG1, IMG2, IMG3, IMG4, IMG5, IsActive, AddDate) select " + catId + ", " + subcatId + ", Name, Mrp, Price, CGST, SGST, IGST, About, AboutHTML, IMG1, IMG2, IMG3, IMG4, IMG5, IsActive, AddDate from tblMaster_Product where ID = '' where ID='" + id.Value + "'");
                        // cls.ExecuteQuery("Update tblManage_MerchantProduct SET Mrp='" + txtMrp.Text + "',Price='" + txtPrice.Text + "' where ID='" + id.Value + "'");
                        //cls.ExecuteQuery("Exec ProcManage_Stock 'insert','" + id.Value + "','" + txtstock.Text + "','" + dtMerchant.Rows[0]["MID"] + "','Merchant'");
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

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message.Replace("'", "") + "');Stoploader();", true);
            }
        }
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}