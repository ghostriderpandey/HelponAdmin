using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

namespace HelponAdminNew.AP
{
    public partial class Manage_Gallery : System.Web.UI.Page
    {
        Cls_Connection cls = new Cls_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HtmlContainerControl obj;
                HtmlContainerControl obj1;
                obj = (HtmlContainerControl)this.Master.FindControl("pagename");
                obj1 = (HtmlContainerControl)Master.FindControl("pagename1");
                string pagename = Path.GetFileName(Request.Url.AbsolutePath);
                obj.InnerText = cls.ExecuteStringScalar("EXEC ProcGet_AdminMenuName '" + pagename + "'");
                obj1.InnerText = obj.InnerText;
              
            }
        }
        [System.Web.Services.WebMethod]
        public static string GetGallery(string name)
        {
            Cls_Connection cls_ = new Cls_Connection(); 
            string str = "";
            DataTable dt = cls_.selectDataTable("select * from tblManage_Gallery");
            if (dt.Rows.Count > 0)
            {
                for(int i = 0; i < dt.Rows.Count; i++)
                {
                    str += "<div class='col-md-2'><a href=''><img src='../Upload/Gallery/Compress/"+dt.Rows[i]["ImgName"]+"' style='width: 100%;' /></a><a type='button' class='text-danger btndelete' data-id='"+ dt.Rows[i]["ID"] + "' data-img='"+ dt.Rows[i]["ImgName"] + "'>Delete</a></div>";
                }
            }
            return str;
        }
        [System.Web.Services.WebMethod]
        public static string DeleteGallery(string id,string name)
        {
            string str = "";
            Cls_Connection cls = new Cls_Connection();
            string Name = cls.ExecuteStringScalar("select ImgName from tblManage_Gallery where ID='" + id + "'");
            string Actual =HttpContext.Current.Server.MapPath("../Upload/Gallery/Actual/" + Name);
            string Compress = HttpContext.Current.Server.MapPath("../Upload/Gallery/Compress/" + Name);
            FileInfo Actualfile = new FileInfo(Actual);
            FileInfo Compressfile = new FileInfo(Compress);
            cls.ExecuteQuery("Delete tblManage_Gallery where ID='" + id + "'");

            if (Actualfile.Exists)//check file exsit or not  
            {
                Actualfile.Delete();

            }
            if (Compressfile.Exists)//check file exsit or not  
            {
                Compressfile.Delete();

            }
            return "";
        }
    }
}