using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Merchant
{
    public partial class ManageChangepassword : System.Web.UI.Page
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
                txtoldpassword.Focus();
            }
        }
        [System.Web.Services.WebMethod]
        public static string GetCheckOldPassword(string oldpassword)
        {
            Cls_Connection cls = new Cls_Connection();
            DataTable dtMerchant = (DataTable)HttpContext.Current.Session["MerchantSession"];
            var oldPaswords = cls.ExecuteStringScalar("select Password from tblMaster_Merchant where MID='" + Convert.ToInt32(dtMerchant.Rows[0]["MID"]) + "'");
            if (oldpassword.Trim() == oldPaswords)
                return "Success";
            else
                return "false";
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["MerchantSession"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                ////Check Master Entry
                DataTable dt = new DataTable();
                string SqlCheckMaster = "";

                SqlCheckMaster = "select Password from tblMaster_Merchant Where Password='" + txtoldpassword.Text.ToString() + "' and MID='" + Convert.ToInt32(dtMerchant.Rows[0]["MID"]) + "'";

                dt = cls.GetDataTable(SqlCheckMaster);
                if (dt.Rows.Count == 0)
                {

                    string Msg = "Invalid Old Password .!";
                    litmsg.Text = Notifications.WarningMessage(Msg);
                    return;
                }

                string SqlQry = "";
                SqlQry += " update tblMaster_Merchant set Password='" + txtnewpassword.Text.Trim() + "'  Where MID='" + Convert.ToInt32(dtMerchant.Rows[0]["MID"]) + "' ";
                int Rows = cls.ExecuteQuery(SqlQry);
                if (Rows > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','Password Update Sucessfully','success').then((value)=>{location.replace('Login.aspx')})", true);
                    

                }
                else
                {

                    string Msg = "Sorry, There seems to be a problem. Try again later.!";
                    litmsg.Text = Notifications.WarningMessage(Msg);
                }
            }
            catch (Exception ex)
            {

                string Msg = "Sorry, There seems to be a problem. Try again later.!";
                litmsg.Text = Notifications.WarningMessage(Msg);
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageChangepassword.aspx");
        }
    }
}