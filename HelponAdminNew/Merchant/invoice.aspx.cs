using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.Text;

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
                DataTable dt = cls.selectDataTable("Exec Proc_GetInvoice 'GetDetail','" + id + "'");
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
        protected void Download(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["ID"]);
            DataTable dt = cls.selectDataTable("Exec Proc_GetInvoice 'GetDetail','" + id + "'");
            using (StringWriter sw = new StringWriter())
            {
                {
                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append("<div class=\"container\">");
                        sb.Append("<div class=\"row\">");
                        sb.Append(" <div class=\"col-xs-12\">");
                        sb.Append("<div class=\"invoice-title\">");
                        sb.Append("<img style=\"width: 50px;\" src='" + Server.MapPath("../Images/icon.jpg") + "' /> ");
                        sb.Append(" <h3 class=\"pull-right\">Order #" + dt.Rows[0]["InvoiceNo"].ToString() + "</h3>");
                        sb.Append("</div>");
                        sb.Append(" <hr>");
                        sb.Append("<div class=\"row\">");
                        sb.Append("<div class=\"col-xs-6\">");
                        sb.Append("<address>");
                        sb.Append(" <strong>Billed To:</strong><br>");
                        sb.Append("<b>" + dt.Rows[0]["ShopName"].ToString() + "</b><br>");
                        sb.Append("" + dt.Rows[0]["MerchantAddress"].ToString() + "<<br>");
                        sb.Append("Pin " + dt.Rows[0]["Pincode"].ToString() + " india<br>");
                        sb.Append("Phone.No. " + dt.Rows[0]["Merchantmobile"].ToString() + "<br>");
                        sb.Append("</address>");
                        sb.Append("</div>");
                        sb.Append("<div class=\"col-xs-6 text-right\">");
                        sb.Append("<address>");
                        sb.Append("<strong>Shipped To:</strong><br>");
                        sb.Append("<b>" + dt.Rows[0]["CustomerName"].ToString() + "</b><br>");
                        sb.Append("<p style = \"margin: 0;\"> " + dt.Rows[0]["ShippingAddress"].ToString() + " </p>");
                        sb.Append("</address>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("<div class=\"row\">");
                        sb.Append("<div class=\"col-xs-6\">");
                        sb.Append("<address>");
                        sb.Append("<strong>Payment Method:</strong>");
                        sb.Append("<b>" + dt.Rows[0]["PaymentMode"].ToString() + "</b>");
                        sb.Append("<b>" + dt.Rows[0]["TransactionNo"].ToString() + "</b>");
                        sb.Append("</address>");
                        sb.Append("</div>");
                        sb.Append("<div class=\"col -xs-6 text-right\">");
                        sb.Append("<address>");
                        sb.Append("<strong>Order Date:</strong><br>");
                        sb.Append("" + dt.Rows[0]["AddDate"].ToString() + "<br>");
                        sb.Append("<br>");
                        sb.Append("</address>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");

                        sb.Append("<div class=\"row\">");
                        sb.Append("<div class=\"col-md-12\">");
                        sb.Append("<div class=\"panel panel-default\">");
                        sb.Append("<div class=\"panel-heading\">");
                        sb.Append("<h3 class=\"panel-title\"><strong>Order summary</strong></h3>");
                        sb.Append("</div>");
                        sb.Append("<div class=\"panel-body\">");
                        sb.Append("<div class=\"table-responsive\">");
                        sb.Append(" <table class=\"table table-condensed\" width=\"100%\">");
                        sb.Append("<thead>");
                        sb.Append("<tr>");
                        sb.Append("<td><strong>Item</strong></td>");
                        sb.Append("<td class=\"text-center\"><strong>Price</strong></td>");
                        sb.Append("<td class=\"text-center\"><strong>Quantity</strong></td>");
                        sb.Append("<td class=\"text-right\"><strong>Total</strong></td>");
                        sb.Append("</tr>");
                        sb.Append("</thead>");
                        sb.Append("<tbody>");
                        DataTable dtProduct = cls.selectDataTable("Exec Proc_GetInvoice 'InvoiceProduct','" + id + "'");
                        for (int s = 0; s < dtProduct.Rows.Count; s++)
                        {
                            sb.Append("<tr>");
                            sb.Append("<td>" + dtProduct.Rows[s]["Name"].ToString() + "</td>");
                            sb.Append("<td class=\"text-center\">" + dtProduct.Rows[s]["Amount"].ToString() + "</td>");
                            sb.Append("<td class=\"text-center\">" + dtProduct.Rows[s]["Qty"].ToString() + "</td>");
                            sb.Append("<td class=\"text-right\">" + dtProduct.Rows[s]["NetAmount"].ToString() + "</td>");
                            sb.Append("</tr>");
                        }
                        sb.Append("<tr>");
                        sb.Append("<td class=\"thick-line\"></td>");
                        sb.Append("<td class=\"thick-line\"></td>");
                        sb.Append("<td class=\"thick-line text-center\"><strong>Subtotal</strong></td>");
                        sb.Append("<td class=\"thick-line text-right\">" + dt.Rows[0]["TotalAmount"].ToString() + "</td>");
                        sb.Append("</tr>");
                        sb.Append("<tr>");
                        sb.Append("<td class=\"no-line\"></td>");
                        sb.Append("<td class=\"no-line\"></td>");
                        sb.Append("<td class=\"no-line text-center\"><strong>Discount</strong></td>");
                        sb.Append("<td class=\"no -line text-right\">" + dt.Rows[0]["Discount"].ToString() + "</td>");
                        sb.Append("</tr>");
                        sb.Append("<tr>");
                        sb.Append("<td class=\"no-line\"></td>");
                        sb.Append("<td class=\"no-line\"></td>");
                        sb.Append("<td class=\"no-line text-center\"><strong>Total</strong></td>");
                        if (Convert.ToDouble(dt.Rows[0]["PaybleAmount"].ToString()) > 0)

                            sb.Append("<td class=\"no-line text-right\">" + dt.Rows[0]["PaybleAmount"].ToString() + "</td>");
                        else
                            sb.Append("<td class=\"no-line text-right\">" + dt.Rows[0]["TotalAmount"].ToString() + "</td>");
                        sb.Append("</tr>");
                        sb.Append("</tbody>");
                        sb.Append("</table>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        sb.Append("</div>");
                        Response.ContentType = "application/pdf";
                        Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["InvoiceNo"].ToString() + ".pdf");
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);

                        //Export HTML String as PDF.
                        StringReader sr = new StringReader(sb.ToString());
                        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 50f, 0f);
                        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                        pdfDoc.Open();
                        htmlparser.Parse(sr);
                        pdfDoc.Close();
                        Response.Write(pdfDoc);
                        Response.End();
                    }
                }
            }

        }
        public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
        { }
    }
}