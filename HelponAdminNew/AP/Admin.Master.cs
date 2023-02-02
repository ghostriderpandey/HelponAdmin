using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        DataTable dtmenu = new DataTable();
        DataTable dtAdmin = new DataTable();
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dtMenuAdmin"] != null && Session["AdminSession"] != null)
            {
                dtAdmin = (DataTable)Session["AdminSession"];
                dtmenu = (DataTable)Session["dtMenuAdmin"];
                if (!IsPostBack)
                {
                    //DataTable dtmenu1 = dtmenu.Select("MenuLevel=1").CopyToDataTable();
                    //Repeater1.DataSource = dtmenu1;
                    //Repeater1.DataBind();
                    lblName.Text = lblName1.Text = dtAdmin.Rows[0]["EmployeeName"].ToString();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        //protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Repeater Repeater2 = e.Item.FindControl("Repeater2") as Repeater;
        //        HiddenField level1 = e.Item.FindControl("hdnlevel1") as HiddenField;
        //        DataTable dtlevel2 = dtmenu;

        //        //Users Setting 26
        //        DataRow[] foundRows;
        //        foundRows = dtlevel2.Select("ParentID='" + level1.Value + "' AND MenuLevel=2");
        //        if (foundRows.Length > 0)
        //        {
        //            dtlevel2 = dtlevel2.Select("ParentID='" + level1.Value + "' AND MenuLevel=2").CopyToDataTable();
        //            if (dtlevel2.Rows.Count > 0)
        //            {
        //                Repeater2.DataSource = dtlevel2;
        //                Repeater2.DataBind();
        //            }
        //        }
        //    }
        //}

        //protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Repeater Repeater3 = e.Item.FindControl("Repeater3") as Repeater;
        //        HiddenField level2 = e.Item.FindControl("hdnlevel2") as HiddenField;
        //        DataTable dtlevel3 = dtmenu;
        //        DataRow[] foundRows;

        //        foundRows = dtlevel3.Select("ParentID='" + level2.Value + "' AND MenuLevel=3");
        //        if (foundRows.Length > 0)
        //        {
        //            dtlevel3 = dtlevel3.Select("ParentID='" + level2.Value + "' AND MenuLevel=3").CopyToDataTable();
        //            if (dtlevel3.Rows.Count > 0)
        //            {
        //                Repeater3.DataSource = dtlevel3;
        //                Repeater3.DataBind();
        //            }
        //        }
        //    }
        //}
    }
}