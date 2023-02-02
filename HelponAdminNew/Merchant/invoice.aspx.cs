using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.Merchant
{
    public partial class invoice : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("Manage_Order.aspx");
            }
            if (!IsPostBack)
            {
                id = Convert.ToInt32(Request.QueryString["ID"]);
                DataTable dt = cls.selectDataTable("Exec Proc_GetInvoice 'GetDetail','"+id+"'");
                rpData.DataSource = dt;
                rpData.DataBind();
               
            }
        }

        protected void rpData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rpProduct = e.Item.FindControl("rpProduct") as Repeater;
                DataTable dtProduct = cls.selectDataTable("Exec Proc_GetInvoice 'InvoiceProduct','" + id + "'");
                rpProduct.DataSource = dtProduct;
                rpProduct.DataBind();
            }
        }
    }
}