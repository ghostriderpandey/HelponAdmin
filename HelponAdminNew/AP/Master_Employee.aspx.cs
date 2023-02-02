using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.IO;

namespace HelponAdminNew.AP
{
    public partial class Master_Employee : System.Web.UI.Page
    {
        DataTable TreeDT = new DataTable();
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
                fillEmployeeType();
                if (Request.QueryString["id"] != null)
                {
                    FillData(Convert.ToInt32(Request.QueryString["id"]));
                    BindTree("GetAllNew", Convert.ToInt32(Request.QueryString["id"]));
                }
                else
                {
                    BindTree("GetAllNew", 0);
                }
            }
        }

        protected void ddlEmployeeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTree("GetByEmployeeType", Convert.ToInt32(ddlEmployeeType.SelectedItem.Value));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string MenuIDStr = "";
                foreach (TreeNode node in TreeMenu.CheckedNodes)
                {
                    MenuIDStr = MenuIDStr + node.Value + ",";
                }
                if (Request.QueryString["id"] == null)
                {
                    int EmployeeTypeID = Convert.ToInt32(ddlEmployeeType.SelectedValue);
                    string LastLoginIP = Convert.ToString(Request.UserHostAddress);
                    DateTime LastLoginDate = DateTime.Now;
                    string EmployeeImage = "";
                    Int32 intresult = 0;
                    intresult = cls.ExecuteIntScalar("[ProcMaster_Employee] 0, '" + EmployeeTypeID + "', '" + txtEmployeeName.Text.Replace("'", "").Trim() + "', '', '" + EmployeeImage + "', '" + txtEmail.Text.Replace("'", "").Trim() + "', '" + txtLoginID.Text.Replace("'", "").Trim() + "', '" + txtPassword.Text.Replace("'", "").Trim() + "', '" + txtMobile.Text.Replace("'", "").Trim() + "', '','" + MenuIDStr + "', '" + LastLoginIP + "', '" + LastLoginDate + "'");
                    if (intresult > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Record inserted successfully !!!');location.replace('List_Employee.aspx');", true);
                        clear();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('LoginID Already Exists  !!!');", true);
                    }
                }
                else
                {
                    int EmployeeTypeID = Convert.ToInt32(ddlEmployeeType.SelectedValue);
                    string LastLoginIP = Convert.ToString(Request.UserHostAddress);
                    DateTime LastLoginDate = DateTime.Now;
                    string EmployeeImage = "";
                    Int32 intresult = 0;
                    intresult = cls.ExecuteIntScalar("[ProcMaster_Employee] '" + Request.QueryString["id"] + "', '" + EmployeeTypeID + "', '" + txtEmployeeName.Text.Replace("'", "").Trim() + "', '', '" + EmployeeImage + "', '" + txtEmail.Text.Replace("'", "").Trim() + "', '" + txtLoginID.Text.Replace("'", "").Trim() + "', '" + txtPassword.Text.Replace("'", "").Trim() + "', '" + txtMobile.Text.Replace("'", "").Trim() + "', '','" + MenuIDStr + "', '" + LastLoginIP + "', '" + LastLoginDate + "'");
                    if (intresult > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('Record updated successfully !!!');location.replace('List_Employee.aspx');", true);
                        clear();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('LoginID Already Exists  !!!');", true);
                    }
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('sorry for the inconvenience caused !!! Please enter valid values');", true);
            }
        }

        private void FillData(int id)
        {
            DataTable dt = new DataTable();
            dt = cls.GetDataTable("Exec [ProcMaster_ManageEmployee] 'GetAll', '" + id + "'");
            if (dt.Rows.Count > 0)
            {
                txtEmployeeName.Text = Convert.ToString(dt.Rows[0]["EmployeeName"]);
                txtEmail.Text = Convert.ToString(dt.Rows[0]["Email"]);
                txtLoginID.Text = Convert.ToString(dt.Rows[0]["LoginID"]);
                txtPassword.Attributes.Add("value", Convert.ToString(dt.Rows[0]["Password"]));
                txtMobile.Text = Convert.ToString(dt.Rows[0]["Mobile"]);
                fillEmployeeType();
                ddlEmployeeType.SelectedValue = Convert.ToString(dt.Rows[0]["EmployeeTypeID"]);
            }
        }

        private void clear()
        {
            ddlEmployeeType.SelectedIndex = 0;
            txtEmployeeName.Text = "";
            txtEmail.Text = "";
            txtLoginID.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
        }

        public void fillEmployeeType()
        {
            DataTable dtEmployeeType = new DataTable();
            dtEmployeeType = cls.GetDataTable("Exec [ProcMaster_EmployeeType] 'Get', 0");
            ddlEmployeeType.DataSource = dtEmployeeType;
            ddlEmployeeType.DataValueField = "EmployeeTypeID";
            ddlEmployeeType.DataTextField = "EmployeeTypeName";
            ddlEmployeeType.DataBind();
            ddlEmployeeType.Items.Insert(0, new ListItem("Select Employee Type", "0"));
        }

        public void BindTree(string str, int id)
        {
            TreeMenu.Nodes.Clear();
            TreeDT = cls.GetDataTable("exec [ProcMaster_ManageMenuAdmin] " + str + "," + id);
            DataRow[] dr = TreeDT.Select("MenuLevel=1");
            for (int i = 0; i < dr.Length; i++)
            {
                TreeNode mNode = new TreeNode();
                mNode.Expanded = false;
                mNode.Text = dr[i]["MenuName"].ToString();
                mNode.Value = dr[i]["MenuID"].ToString();
                mNode.Checked = Convert.ToBoolean(dr[i]["checked"]);
                mNode.SelectAction = TreeNodeSelectAction.Expand;
                mNode.PopulateOnDemand = true;
                TreeMenu.Nodes.Add(mNode);
                mNode.ExpandAll();
            }
            TreeMenu.CollapseAll();
        }

        public void ShowData(TreeNode Tnode)
        {
            DataRow[] drnod = TreeDT.Select("ParentID='" + Tnode.Value + "'");
            for (int j = 0; j < drnod.Length; j++)
            {
                TreeNode nod = new TreeNode();
                nod.Value = drnod[j]["MenuID"].ToString();
                nod.Text = drnod[j]["MenuName"].ToString();
                nod.Checked = Convert.ToBoolean(drnod[j]["Checked"]);
                nod.PopulateOnDemand = true;
                nod.Expanded = false;
                nod.SelectAction = TreeNodeSelectAction.Expand;
                Tnode.ChildNodes.Add(nod);
            }
        }
        protected void TreeMenu_TreeNodePopulate(object sender, TreeNodeEventArgs e)
        {
            ShowData(e.Node);
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}