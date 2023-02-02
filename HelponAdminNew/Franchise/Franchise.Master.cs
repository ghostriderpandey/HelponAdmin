using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.Franchise
{
    public partial class Franchise : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FranchiseSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            DataTable dtFranchise = (DataTable)Session["FranchiseSession"];
            lblName.Text = dtFranchise.Rows[0]["Name"].ToString();
        }
    }
}