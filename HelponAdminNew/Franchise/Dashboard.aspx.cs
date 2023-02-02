using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.Franchise
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DataTable dtFranchise = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["FranchiseSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                dtFranchise = (DataTable)Session["FranchiseSession"];
                lblDOJ.Text = dtFranchise.Rows[0]["AddDate"].ToString();
            }

        }
    }
}