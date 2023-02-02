using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelponAdminNew.Model
{
    public class MasterModelList
    {
    }
    public class MasterMerchant
    {
        public int ID { get; set; }
        public int PopularID { get; set; }
        public int MID { get; set; }
        public int CID { get; set; }
        public int SCID { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public string Shopname { get; set; }
        public string Name { get; set; }
        public string Mobile { get; set; }
        public string AlternetMobile { get; set; }
        public string WhatsappNo { get; set; }
        public string TelPhoneNo { get; set; }
        public string Email { get; set; }
        public int StateID { get; set; }
        public string StateName { get; set; }
        public int DistrictID { get; set; }
        public string Districtname { get; set; }
        public int TehsilID { get; set; }
        public string TehsilName { get; set; }
        public string CityName { get; set; }
        public string Address { get; set; }
        public string Pincode { get; set; }
        public string LoginID { get; set; }
        public string Password { get; set; }
        public string Twitter { get; set; }
        public string Instagram { get; set; }
        public string Facebook { get; set; }
        public string WebSite { get; set; }
        public string Aboutus { get; set; }
        public string ProfileImg { get; set; }
        public string ThumbnailIMG { get; set; }
        public string SponserID { get; set; }
        public string SponserType { get; set; }
        public int IsPaid { get; set; }
        public string PaidDate { get; set; }
        public int IsApprove { get; set; }
        public string ApproveDate { get; set; }
        public int IsReject { get; set; }
        public string RejectDate { get; set; }
        public string AddDate { get; set; }
        public string Status { get; set; }
        public string StatusClass { get; set; }
        public string BgColor { get; set; }
        public string FranchiseName { get; set; }
        public string FranchiseID { get; set; }
        public string FranchiseMobile { get; set; }
    }
    public class OrderReport
    {
        public int OrderID { get; set; }
        public int ID { get; set; }
        public string ProductName { get; set; }
        public string IMG1 { get; set; }
        public string Qty { get; set; }
        public string Amount { get; set; }
        public string NetAmount { get; set; }
        public string OrderStatus { get; set; }
        public string Remark { get; set; }
        public string ShippedRemark { get; set; }
        public string DeliveredRemark { get; set; }
        public string CancelRemark { get; set; }
    }
}