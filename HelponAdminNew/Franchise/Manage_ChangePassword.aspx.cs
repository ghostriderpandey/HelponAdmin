using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Franchise
{
    public partial class Manage_ChangePassword : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        DataTable dtFranchise = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FranchiseSession"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }
            dtFranchise = (DataTable)Session["FranchiseSession"];
            if (!IsPostBack)
            {
              
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            if (txtCurrentPassword.Text.Trim() != dtFranchise.Rows[0]["Password"].ToString())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "swal('Alert !','Invalid Current Password !!','info');", true);
                return;
            }
            else if (txtpassword.Text.Trim() != txtConfirmpassword.Text.Trim())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "swal('Alert !','Password Mismatch !!','info');", true);
                return;
            }
            else
            {
               
                Session["FranchiseSession"] = null;
                cls.ExecuteQuery("Update tblMaster_Franchise SET Password='" + txtpassword.Text.Trim() + "' Where ID='" + dtFranchise.Rows[0]["ID"].ToString() + "'");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "swal('Alert !','Password Successfully Changed !!','success').then((value)=>{location.replace('Login.aspx')});", true);
            }
        }
    }
}