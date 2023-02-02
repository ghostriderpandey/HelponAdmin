using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HelponAdminNew.AP
{
    public partial class List_Product : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cls.BindDropDownList(ddlCategory, "ProcMaster_Category 'GetforDDL',0,'Ecommerce'", "Name", "ID");
                
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            cls.BindDropDownList(ddlSubCategory, "ProcMaster_SubCategory 'GetforDDL',0,'" + ddlCategory.SelectedValue + "','Ecommerce'", "Name", "ID");
           
        }
        private void FillGv()
        {
            DataTable dt = cls.selectDataTable("Exec ProcMaster_Product 'GetAll',0,'"+ddlCategory.SelectedValue+"','"+ddlSubCategory.SelectedValue+"'");
            GvData.DataSource = dt;
            GvData.DataBind();
           
        }

        protected void ddlSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGv();
        }
        protected void GvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "IsDelete")
            {
                cls.ExecuteQuery("Exec ProcMaster_Product 'IsDelete','" + e.CommandArgument + "'");
                FillGv();
            }
           
        }
        protected void GvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GvData_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            FillGv();
        }
    }
}