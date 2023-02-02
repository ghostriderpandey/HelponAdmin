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
    public partial class Master_UserType : System.Web.UI.Page
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
                if (Request.QueryString["id"] != null)
                {
                    FillData(Convert.ToInt32(Request.QueryString["id"]));
                }
                else
                {
                    BindTree("GetMenuStr", 0);
                }
                
                FillGv();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string IDStr = "";
                foreach (TreeNode node in TreeMenu.CheckedNodes)
                {
                    IDStr = IDStr + node.Value + ",";
                }

                if (btnSubmit.Text=="Submit")
                {
                     
                    DataTable dtAdd= cls.selectDataTable("ProcMaster_UserType 'Insert',0,'"+txtUserType.Text.Replace("'","")+"','"+IDStr+"'");
                    if (dtAdd.Rows.Count > 0)
                    {
                        if (dtAdd.Rows[0]["Status"].ToString() == "1")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('" + dtAdd.Rows[0]["Message"] + "');location.replace('Master_UserType.aspx');", true);
                            
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('" + dtAdd.Rows[0]["Message"] + "');", true);
                           
                        }
                       
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('LoginID Already Exists  !!!');", true);
                    }
                }
                else if(btnSubmit.Text=="Update")
                {

                    DataTable dtAdd = cls.selectDataTable("ProcMaster_UserType 'Update','"+ViewState["ID"]+"','" + txtUserType.Text.Replace("'", "").Trim() + "','"+IDStr+"'");
                    if (dtAdd.Rows.Count > 0)
                    {
                        if (dtAdd.Rows[0]["Status"].ToString() == "1")
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('" + dtAdd.Rows[0]["Message"] + "');location.replace('Master_UserType.aspx');", true);
                           
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Key", "alert('" + dtAdd.Rows[0]["Message"] + "');", true);
                           
                        }

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
        private void FillGv()
        {
            DataTable dtGv = cls.selectDataTable("ProcMaster_UserType 'GetAll'");
            GvData.DataSource = dtGv;
            GvData.DataBind();
        }
        private void FillData(int id)
        {
            DataTable dt = new DataTable();
            dt = cls.GetDataTable("Exec [ProcMaster_UserType] 'Get', '" + id + "'");
            if (dt.Rows.Count > 0)
            {
                txtUserType.Text = dt.Rows[0]["Type"].ToString();
                btnSubmit.Text = "Update";
                ViewState["ID"] = id;
                BindTree("GetMenuStr", id);
            }
        }

        public void BindTree(string str, int id)
        {
            TreeMenu.Nodes.Clear();
            TreeDT = cls.GetDataTable("exec [ProcMaster_UserType] " + str + "," + id);
            DataRow[] dr = TreeDT.Select("MenuLevel=1");
            for (int i = 0; i < dr.Length; i++)
            {
                TreeNode mNode = new TreeNode();
                mNode.Expanded = false;
                mNode.Text = dr[i]["MenuName"].ToString();
                mNode.Value = dr[i]["ID"].ToString();
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
                nod.Value = drnod[j]["ID"].ToString();
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
    }
}