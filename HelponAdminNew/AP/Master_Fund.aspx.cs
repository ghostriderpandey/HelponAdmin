using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class Master_Fund : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)this.Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj.InnerText = cls.ExecuteStringScalar("EXEC ProcGet_AdminMenuName '" + pagename + "'");
                obj1.InnerText = obj.InnerText;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            decimal dblAmount = 0;
            if (ddlWalletType.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Select Wallet Type !');", true);
                return;
            }
            else if (ddlFactor.SelectedValue == "0")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Select Factor !');", true);
                return;
            }
            if (decimal.TryParse(txtAmount.Text, out dblAmount))
            {
                if (dblAmount <= 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Amount must be greater than zero !');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Invalid Amount !!');", true);
                return;
            }
            int cnt = 0;
            DataTable dt = new DataTable();
            decimal NetAmount = 0;
            string Narration = "";
            try
            {
                string Proc = "";
                if (ddlWalletType.SelectedValue == "Merchant")
                {
                    Proc = "ProcMaster_MainWallet";
                }
                else if (ddlWalletType.SelectedValue == "Customer")
                {
                    Proc = "ProcMaster_CustomerWallet";
                }
                
                if (ddlFactor.SelectedValue == "Dr")
                {
                    NetAmount = 0 - dblAmount;
                    Narration = "Fund Deduct By Admin" + txtNarration.Text.Trim();
                }
                else
                {
                    NetAmount = dblAmount;
                    Narration = "Fund Add By Admin" + txtNarration.Text.Trim();
                }
                dt = cls.selectDataTable("exec " + Proc + " '" + hidMsrNo.Value + "', " + NetAmount + ", '" + ddlFactor.SelectedValue + "','" + Narration + "'");
                string message = dt.Rows[0][1].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('" + message + "');location.replace('Master_Fund.aspx');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Error| Database Error !'); location.replace('Master_Fund.aspx')", true);
            }
        }

        protected void txtMemberID_TextChanged(object sender, EventArgs e)
        {
            DataTable dtMix = new DataTable();
            if (txtMemberID.Text != "")
            {
                
                if (ddlWalletType.SelectedValue == "Merchant")
                {
                    dtMix = cls.selectDataTable("Select MID as ID,Name from tblMaster_Merchant where (Mobile='" + txtMemberID.Text.Trim() + "' or LoginID='" + txtMemberID.Text.Trim() + "')");
                }
                else if (ddlWalletType.SelectedValue == "Customer")
                {
                    dtMix = cls.selectDataTable("Select ID,Name from tblMaster_Customer where (Mobile='" + txtMemberID.Text.Trim() + "' or Email='" + txtMemberID.Text.Trim() + "')");
                }
                
                if (dtMix.Rows.Count > 0)
                {
                    lblName.Text = Convert.ToString(dtMix.Rows[0]["Name"]);
                    hidMsrNo.Value = Convert.ToString(dtMix.Rows[0]["ID"]);
                    if(ddlWalletType.SelectedValue== "Merchant")
                    {
                        lblBalance.Text = cls.ExecuteStringScalar("select Balance from tblAccount_Main where MsrNo='" + hidMsrNo.Value + "' ");
                    }
                    else if (ddlWalletType.SelectedValue == "Customer")
                    {
                        lblBalance.Text = cls.ExecuteStringScalar("select Balance from tblAccount_Customer where CustomerID='" + hidMsrNo.Value + "' ");
                    }
                  
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Enter Valid Detail  !');", true);
                    clear();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Please Enter valid Detail  !');", true);
                clear();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            clear();
        }
        private void clear()
        {
            hidMsrNo.Value = "";
            lblName.Text = "";
            lblBalance.Text = "0.0";
            txtAmount.Text = "";
            txtNarration.Text = "";
            txtMemberID.Text = "";
        }

        protected void ddlWalletType_SelectedIndexChanged(object sender, EventArgs e)
        {
            clear();
        }
    }
}