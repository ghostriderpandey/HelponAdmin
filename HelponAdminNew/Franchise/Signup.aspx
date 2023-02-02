<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="HelponAdminNew.Franchise.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Franchise-Signup</title>

    <link rel="stylesheet" href="css/bootstrap1.min.css" />

    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS" />
    <script src="../Merchant/assets/js/jquery-3.6.0.min.js"></script>
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
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="white_box mb_30">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-content cs_modal">
                                    <div class="modal-header justify-content-center theme_bg_1">
                                        <h5 class="modal-title text_white">Sign up</h5>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Your Mobile No." TextMode="Number" MaxLength="10"></asp:TextBox>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Your Email" TextMode="Email"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <label>State</label>
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-6">
                                                <label>District</label>
                                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-12 mt-2">
                                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Your Address" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtCityName" runat="server" CssClass="form-control" placeholder="Enter Your City Name"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="Enter Your Pincode" TextMode="Number"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">

                                                <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter Your OTP" TextMode="Number"></asp:TextBox>
                                                <asp:LinkButton ID="lnkSendOTP" CssClass="text-success" runat="server" Text="SEND OTP" OnClick="btnOTPSend_Click" Style="float: right;"></asp:LinkButton>

                                            </div>
                                        </div>

                                        <asp:LinkButton ID="lnkbtnSignup" runat="server" CssClass="btn_1 full_width text-center" Text="Sign up" OnClick="lnkbtnSignup_Click"></asp:LinkButton>
                                        <p>You are Already Registered ? <a href="Login.aspx">Login</a></p>
                                        <div class="text-center">
                                            <a href="ForgetPassword.aspx" class="pass_forget_btn">Forget Password?</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
