using HelponAdminNew.App_Data;
using HelponAdminNew.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace HelponAdminNew.GlobalHelper
{
    public class MasterListModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
    }
    public class Repository
    {
        public List<MasterListModel> GetMasterList(string Action,int id)
        {
            List<MasterListModel> masterLists = new List<MasterListModel>();
            masterLists = Connection.Query<MasterListModel>("Exec ProcGet_List '" + Action + "','" + id + "'").ToList();
            return masterLists;
        }
        public void BindDropDownList(DropDownList ddl, string Action,int id, string TextField, string ValueField)
        {
            
            ddl.DataSource = GetMasterList(Action,id);
            ddl.DataTextField = TextField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        
        public List<OrderReport> OrderReportWithProduct(int orderID)
        {
            List<OrderReport> merchants = new List<OrderReport>();
            merchants = Connection.Query<OrderReport>("Exec ProcManage_Report 'OrderReportWithProduct','" + orderID + "'").ToList();
            if (merchants.Count <= 0)
            {
                merchants = new List<OrderReport>();
            }
            return merchants;
        }
        
    }
}