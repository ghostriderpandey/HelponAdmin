using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.Franchise
{
    public partial class Congratulation : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = 0;
                if (Request.QueryString["l"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                id = cls.ExecuteIntScalar("select ID from tblMaster_Franchise where LoginID='" + Request.QueryString["l"] + "'");
                DataTable dt = cls.selectDataTable("Exec ProcMaster_Franchise 'Get','"+id+"'");
                if (dt.Rows.Count > 0)
                {
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                    lblEmail.Text = dt.Rows[0]["Email"].ToString();
                    lblMobile.Text = dt.Rows[0]["Mobile"].ToString();
                    lblLoginID.Text = dt.Rows[0]["LoginID"].ToString();
                    lblPassword.Text = dt.Rows[0]["Password"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}