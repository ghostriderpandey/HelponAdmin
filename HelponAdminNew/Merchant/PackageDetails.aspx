<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PackageDetails.aspx.cs" Inherits="HelponAdminNew.Merchant.PackageDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Helpon</title>
    <link rel="shortcut icon" href="assets/img/favicon.png">

    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="../jquery_Package/sweetalert.min.js"></script>
    <link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css" rel="stylesheet" />

    <style>
        .loaderbox {
            display: none;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            background: rgba(0,0,0,0.5);
        }
    </style>
    <script>
        function Startloader() {
            $(".loaderbox").css("display", "flex");
        }
        function Stoploader() {
            $(".loaderbox").css("display", "none");
        }
    </script>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function isDecimalNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function isDecimalNumberNegKey(evt) {

        }

        function trimNumber(obj) {
            var s = obj.value;
            while (s.substr(0, 1) == '0' && s.length > 1) { s = s.substr(1, 9999); }
            obj.value = s;
        }
        function getInternetExplorerVersion()
        // Returns the version of Windows Internet Explorer or a -1
        // (indicating the use of another browser).
        {
            var rv = -1; // Return value assumes failure.
            if (navigator.appName == 'Microsoft Internet Explorer') {
                var ua = navigator.userAgent;
                var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
                if (re.exec(ua) != null)
                    rv = parseFloat(RegExp.$1);
            }
            return rv;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table">
                <tr>
                    <td width="25%"><span style="font-weight:bold"> Package Name</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblpcknme" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Amount</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblamt" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Business Name</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblbuinsesnme" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Contact Person Name</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblcontactprson" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Address</td>
                    <td>
                        <asp:Label runat="server" ID="lbladress" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Contact No</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblcontno" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">E-Mail</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblemail" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">About us</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblaboutus" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">SEO</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblseo" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Google Map</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblgooglemp" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Bank Details (Qr UPI)</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblbankdtl" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Business Inquiry</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblbussinq" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Web Site</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblwebsite" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Profile Image</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblprofimg" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Website Thumbnail</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblwebthumb" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Ads Slider</span></td>
                    <td>
                        <asp:Label runat="server" ID="lbladslid" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Gallery Images</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblgalleryimg" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Video Clip</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblvideoclip" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Coupon Facility</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblcoupanfacil" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Selling Product</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblsellprod" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Tax Invoice Facility</span></td>
                    <td>
                        <asp:Label runat="server" ID="lbltxinvo" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Delivery Facility</span></td>
                    <td>
                        <asp:Label runat="server" ID="lbldevfact" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td><span style="font-weight:bold">Login ID /Password</span></td>
                    <td>
                        <asp:Label runat="server" ID="lblpassword" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
