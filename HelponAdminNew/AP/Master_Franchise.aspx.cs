using HelponAdminNew.GlobalHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class Master_Franchise : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        Repository repo = new Repository();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {

                repo.BindDropDownList(ddlState, "GetState", 0, "Name", "ID");
                if (Request.QueryString["ID"] != null)
                {
                    FillData(Convert.ToInt32(Request.QueryString["ID"]));
                }
                
            }
        }
        protected void lnkbtnSignup_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (Request.QueryString["ID"] != null)
            {
                id=Convert.ToInt32(Request.QueryString["ID"]);
            }
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Franchise 'insert','"+id+"','" + txtName.Text.Replace("'", "") + "','" + txtEmail.Text.Replace("'", "") + "','" + txtMobile.Text.Replace("'", "") + "','" + txtPassword.Text.Replace("'", "") + "','" + ddlState.SelectedValue + "','" + ddlDistrict.SelectedValue + "','" + txtAddress.Text.Replace("'", "") + "','" + txtPincode.Text.Replace("'", "") + "','" + txtCityName.Text.Replace("'", "") + "'");
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Status"].ToString() == "1")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','success').then((value)=>{location.replace('Manage_Franchise.aspx')})", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "swal('Alert !','" + dt.Rows[0]["Message"] + "','info');", true);
                }
            }
        }
        private void FillData(int id)
        {
            DataTable dtData = cls.selectDataTable("Exec ProcMaster_Franchise 'Get','" + id + "'");
            if (dtData.Rows.Count > 0)
            {
                txtName.Text = dtData.Rows[0]["Name"].ToString();
                txtEmail.Text = dtData.Rows[0]["Email"].ToString();
                txtMobile.Text = dtData.Rows[0]["Mobile"].ToString();
                txtAddress.Text = dtData.Rows[0]["Address"].ToString();
                txtPincode.Text = dtData.Rows[0]["Pincode"].ToString();
                txtCityName.Text = dtData.Rows[0]["CityName"].ToString();
                ddlState.SelectedValue = dtData.Rows[0]["StateID"].ToString();
                ddlState_SelectedIndexChanged(null, null);
                ddlDistrict.SelectedValue = dtData.Rows[0]["DistrictID"].ToString();

            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            repo.BindDropDownList(ddlDistrict, "GetCity", Convert.ToInt32(ddlState.SelectedValue), "Name", "ID");
        }
      
    }
}