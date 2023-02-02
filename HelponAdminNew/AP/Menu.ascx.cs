using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Menu : System.Web.UI.UserControl
{
    Cls_Connection cls = new Cls_Connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetParentMenu();
        }
    }

    public void GetParentMenu()
    {
        try
        {

            DataTable dt = new DataTable();
            string SqlQry = " select *,Case When Permission='Y' Then OnSelect else '#' end as Dis_OnSelect from M_WebMenuMaster as a ";
            SqlQry += " inner join  Tbl_UserRightDetails as b on a.MenuId = b.MenuId ";
            SqlQry += " Where a.ActiveStatus = 'Y' and a.Permission='Y' and b.isActive = '1' and b.Isdelete = '0' and b.UserId = '" + Session["UserID"].ToString() + "' and a.Visible='Y' and b.U_View='True' order by seqno asc";
            dt = cls.GetDataTable(SqlQry);


            string MenuStr = "";

            //MenuStr += " <div class='pcoded-main-container'> ";
            //MenuStr += " <div class='pcoded-wrapper'> ";
            //MenuStr += " <nav class='pcoded-navbar'> ";
            //MenuStr += " <div class='pcoded-inner-navbar main-menu'> ";
            MenuStr += " <ul class='pcoded-item pcoded-left-item'> ";

            //MenuStr += " <li class='pcoded-hasmenu pcoded-trigger' dropdown-icon=''> ";
            //MenuStr += " <a href = 'HostAdminHome.aspx'> ";
            //MenuStr += " <span class='pcoded-micon'><i class='feather icon-home'></i></span> ";
            //MenuStr += " <span class='pcoded-mtext'>Dashboard</span> ";
            //MenuStr += " </a> ";
            //MenuStr += " </li> ";

            MenuStr += " <li class=''>";
            MenuStr += " <a href = 'HostAdminHome.aspx'>";
            MenuStr += " <span class='pcoded-micon'><i class='feather icon-home'></i></i></span>";
            MenuStr += " <span class='pcoded-mtext'>Dashboard</span>";
            MenuStr += " </a>";
            MenuStr += " </li>";



            // MenuStr += "<ul class='nav'>";
            //MenuStr += "<a href='#' class='visible-phone'><i class='icon icon-home'></i>Dashboard</a>";
            //MenuStr += "  <ul> ";
            //MenuStr += "<li class='active'><a href ='HostAdminHome.aspx'><i class='icon icon-home'></i> <span>Dashboard</span></a> </li> ";
            // MenuStr += "<li class='nav-item'><a class='nav-link' href='/HostAdmin/HostAdminHome.aspx'><i class='nav-icon icon icon-home'></i>Dashboard</a></li> ";
            foreach (DataRow row in dt.Rows)
            {
                string ParentID = row["ParentID"].ToString();
                if (ParentID.Trim() == "0")
                {

                    //MenuStr += " <li class='pcoded-hasmenu'> ";
                    //MenuStr += " <a href = 'javascript:void(0)'> ";
                    //MenuStr += " <span class='pcoded-micon'><i class='feather icon-sidebar'></i></span> ";
                    //MenuStr += " <span class='pcoded-mtext'>Page layouts</span> ";
                    //MenuStr += " <span class='pcoded-badge label label-warning'>NEW</span> ";
                    //MenuStr += " </a> ";



                    MenuStr += " <li class='pcoded-hasmenu'> ";
                    MenuStr += " <a href = 'javascript:void(0)' > ";
                    MenuStr += " <span class='pcoded-micon'>" + row["Icon"].ToString() + "</span> ";
                    MenuStr += " <span class='pcoded-mtext'>" + row["MenuName"].ToString() + "</span> ";
                    //  MenuStr += " <span class='pcoded-badge label label-danger'>100+</span> ";
                    MenuStr += " </a> ";

                    // MenuStr += " <li class='nav-item nav-dropdown'><a class='nav-link nav-dropdown-toggle' href='#'>" + row["Icon"].ToString() + "" + row["MenuName"].ToString() + "</a>";
                    // MenuStr += " <li class='submenu'><a href = '#'>" + row["Icon"].ToString() + "<span>" + row["MenuName"].ToString() + "</span> <span class='label label-important'>" + GetSubMenuTotal(row["MenuID"].ToString(), dt) + "</span></a>";
                    MenuStr += GetSubMenu(row["MenuID"].ToString(), dt);
                    MenuStr += "  </li>";
                }
            }
            // MenuStr += "<li><a href='Logout.aspx'><i class='icon icon-tint'></i><span>Logout</span></a></li>";
            //  MenuStr += "<li class='nav-item'><a class='nav-link' href='/HostAdmin/Logout.aspx'><i class='nav-icon icon fa fa-sign-out'></i>Logout</a></li> ";


            //MenuStr += " <li class='pcoded-hasmenu pcoded-trigger' dropdown-icon=''> ";
            //MenuStr += " <a href = 'HostAdminHome.aspx'> ";
            //MenuStr += " <span class='pcoded-micon'><i class='feather icon-home'></i></span> ";
            //MenuStr += " <span class='pcoded-mtext'>Dashboard</span> ";
            //MenuStr += " </a> ";
            //MenuStr += " </li> ";
            MenuStr += " <li class=''>";
            MenuStr += " <a href = '/HostAdmin/Logout.aspx'>";
            MenuStr += " <span class='pcoded-micon'><i class='fa fa-sign-out'></i></span>";
            MenuStr += " <span class='pcoded-mtext'>Logout</span>";
            MenuStr += " </a>";
            MenuStr += " </li>";

            MenuStr = MenuStr + "</ul>  ";
            //MenuStr = MenuStr + "</div> ";
            //MenuStr = MenuStr + "</nav>";
            //    MenuStr = MenuStr + "</div> ";
            //  MenuStr = MenuStr + "</div> ";


            //sidebar.InnerHtml = MenuStr.ToString();
        }
        catch (Exception ex)
        {

        }
    }

    public string GetSubMenu(string MenuID, DataTable SubMenedt)
    {
        string SubMenuStr = "";
        try
        {



            DataTable dtFiltered = SubMenedt.Select("ParentID = '" + MenuID.Trim() + "'").CopyToDataTable();
            SubMenuStr = " <ul class='pcoded-submenu'>";
            foreach (DataRow row in dtFiltered.Rows)
            {
                string SubmenuLevel2 = "";
                SubmenuLevel2 += GetSubMenu2(row["MenuID"].ToString(), SubMenedt);


                if (SubmenuLevel2.ToString().Trim() == "")
                {
                    SubMenuStr += " <li class=''>";
                    SubMenuStr += " <a href ='" + row["Dis_OnSelect"].ToString() + "'>";
                    SubMenuStr += " <span class='pcoded-mtext'>" + row["MenuName"].ToString() + "</span>";
                    SubMenuStr += " </a>";
                    SubMenuStr += SubmenuLevel2;
                    SubMenuStr += " </li>";
                }
                else
                {
                    SubMenuStr += " <li class='pcoded-hasmenu '> ";
                    SubMenuStr += " <a href = 'javascript:void(0)' > ";
                    SubMenuStr += " <span class='pcoded-mtext'>" + row["MenuName"].ToString() + "</span> ";
                    SubMenuStr += " </a> ";
                    SubMenuStr += SubmenuLevel2;
                    SubMenuStr += " </li>";
                }
                // SubMenuStr += "  <li class='nav-item'><a class='nav-link' href ='" + row["Onselect"].ToString() + "'>" + row["MenuName"].ToString() + "</a></li>";
            }
            SubMenuStr += " </ul>";
        }
        catch (Exception ex)
        {

        }
        return SubMenuStr;
    }


    public string GetSubMenu2(string MenuID, DataTable SubMeneLever2dt)
    {
        string SubMenuStr = "";
        try
        {

            DataTable dtFiltered = SubMeneLever2dt.Select("ParentID = '" + MenuID.Trim() + "'").CopyToDataTable();
            SubMenuStr = " <ul class='pcoded-submenu'>";
            foreach (DataRow row in dtFiltered.Rows)
            {
                SubMenuStr += " <li class=''>";
                SubMenuStr += " <a href ='" + row["Dis_OnSelect"].ToString() + "'>";
                SubMenuStr += " <span class='pcoded-mtext'>" + row["MenuName"].ToString() + "</span>";
                SubMenuStr += " </a>";
                SubMenuStr += " </li>";
                // SubMenuStr += "  <li class='nav-item'><a class='nav-link' href ='" + row["Onselect"].ToString() + "'>" + row["MenuName"].ToString() + "</a></li>";
            }
            SubMenuStr += " </ul>";
        }
        catch (Exception ex)
        {

        }
        return SubMenuStr;
    }

    public int GetSubMenuTotal(string MenuID, DataTable SubMenedt)
    {
        DataTable dtFiltered = SubMenedt.Select("ParentID = '" + MenuID.Trim() + "'").CopyToDataTable();
        int Count = 0;
        foreach (DataRow row in dtFiltered.Rows)
        {
            Count++;
        }
        return Count;
    }
}