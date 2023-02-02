using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HelponAdminNew.GlobalHelper
{
    public class ApptransactionMessage
    {
        public int Status { get; set; }
        public string Message { get; set; }
    }
    public class ImageUploadStatus
    {
        public bool Status { get; set; }
        public string ImgName { get; set; }
    }
}