<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="HelponAdminNew.Merchant.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <title>Merchant-Registration</title>
    <link rel="shortcut icon" href="assets/img/favicon.png" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css" />
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="../jquery_Package/sweetalert.min.js"></script>
    <script type="text/javascript">
        function fnCountDown() {
            var dt = new Date();
            var countDownDate = dt.setMinutes(dt.getMinutes() + 1);
            var x = setInterval(function () {
                var now = new Date().getTime();
                var distance = countDownDate - now;
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                
               var btnSendOTP = '<%= lnkSendOTP.ClientID %>';
               var button1 = document.getElementById(btnSendOTP);
               //if (button1) { button1.style.display = 'none'; }
               document.getElementById('<%= lnkSendOTP.ClientID %>').innerHTML = "<b>" + seconds + "s</b>";
               if (distance < 0) {
                   clearInterval(x);
                 
                    var btnSendOTP = '<%= lnkSendOTP.ClientID %>';
                   var button1 = document.getElementById(btnSendOTP);
                   if (button1) { button1.style.display = 'block'; }
               }
           }, 1000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="login-page">
                <div class="login-body container">
                    <asp:MultiView ID="MultiviewSignup" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiviewSignup_ActiveViewChanged">
                        <asp:View ID="DefaultView" runat="Server">
                            <div class="loginbox">
                                <div class="login-right-wrap">
                                    <div class="account-header">
                                        <div class="account-logo text-center mb-4">
                                            <img src="../Images/logo.png" class="img-fluid" />
                                        </div>
                                    </div>
                                    <div class="login-header">
                                        <h3>Register</h3>

                                    </div>
                                    <div>
                                        <div class="form-group">
                                            <label class="control-label">Mobile</label>
                                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10" placeholder="Enter your Mobile No."></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">Email (optional)</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your mail id"></asp:TextBox>
                                        </div>
                                        <div class="form-group">

                                            <asp:LinkButton ID="lnkSendOTP" CssClass="text-success" runat="server" Text="SEND OTP" OnClick="btnOTPSend_Click" Style="float: right; "></asp:LinkButton>
                                           
                                            <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                        </div>
                                        <div class="text-center">
                                            <asp:LinkButton ID="lnkbtnSendOTP" runat="Server" Text="Submit" OnCommand="LinkButton_Command" CommandName="PersonalDetailView" CssClass="btn btn-primary btn-block account-btn">   </asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="login-or">
                                        <span class="or-line"></span>
                                        <span class="span-or">or</span>
                                    </div>
                                    <div class="text-center dont-have">Already have an account? <a href="Login.aspx">Login</a></div>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="PersonalDetailView" runat="server">
                            <div class="loginbox" style="max-width: 100%;">
                                <div class="login-right-wrap">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="login-header">
                                                <h3>Personal Detail </h3>

                                            </div>
                                            <div>
                                                <div class="form-group">
                                                    <label class="control-label">Category</label>
                                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Sub Category</label>
                                                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Business Name</label>
                                                    <asp:TextBox ID="txtShopName" runat="server" CssClass="form-control" placeholder="Enter Business Name"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Person Name</label>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Business Name"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Password</label>
                                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Confirm Password</label>
                                                    <asp:TextBox ID="txtCPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label w-100">Sales Executive ID <asp:Label ID="lblSponserName" runat="server" Text=""></asp:Label> </label>
                                                    <asp:HiddenField ID="hdnSponserID" runat="server" Value="0" />
                                                    <asp:TextBox ID="txtSponserID" runat="server" CssClass="form-control" OnTextChanged="txtSponserID_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="login-header">
                                                <h3>Address Detail</h3>

                                            </div>
                                            <div>
                                                <div class="form-group">
                                                    <label class="control-label">State</label>
                                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">District</label>
                                                    <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Tehsil</label>
                                                    <asp:DropDownList ID="ddlTehsil" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">City Name</label>
                                                    <asp:TextBox ID="txtCityName" runat="server" CssClass="form-control" placeholder="Enter City Name"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Address</label>
                                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Address"></asp:TextBox>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">Pincode</label>
                                                    <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="Enter Pincode"></asp:TextBox>
                                                </div>
                                                <div class="text-center">
                                                    <asp:LinkButton ID="LinkButton5" runat="Server" Text="Submit" OnCommand="LinkButton_Command" CommandArgument="AddressDetailView" CommandName="AddressDetailView" CssClass="btn btn-primary btn-block account-btn">   </asp:LinkButton>
                                                    <br />
                                                    <asp:LinkButton ID="LinkButton6" runat="Server" Text="Back" OnCommand="LinkButton_Command" CommandArgument="DefaultView" CommandName="DefaultView">   </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </asp:View>
                        <asp:View ID="AddressDetailView" runat="server">
                        </asp:View>
                    </asp:MultiView>

                </div>
            </div>
        </div>

    </form>

</body>
</html>
