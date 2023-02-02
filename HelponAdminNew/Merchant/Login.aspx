<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HelponAdminNew.Merchant.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <title>Merchant-Login</title>
    <link rel="shortcut icon" href="assets/img/favicon.png" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css" />
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="../jquery_Package/sweetalert.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <%--<audio id="myAudio" loop="loop" autoplay="autoplay">
            <source src="assets/Sound/sms.mp3" type="audio/ogg">
            <source src="assets/Sound/sms.mp3" type="audio/mpeg">
        </audio>
        <button onclick="playAudio()" type="button" id="btnPlay">Play Audio</button>
        <button onclick="pauseAudio()" type="button">Pause Audio</button>--%>
        <div class="main-wrapper">
            <div class="login-page">
                <div class="login-body container">
                    <div class="loginbox">
                        <div class="login-right-wrap">
                            <div class="account-header">
                                <div class="account-logo text-center mb-4">
                                    <a href="Dashboard.aspx">
                                        <img src="assets/img/logo-icon.png" alt="" class="img-fluid">
                                    </a>
                                </div>
                            </div>
                            <div class="login-header">
                                <h3>Login <span>Helpon</span></h3>
                            </div>
                            <div>
                                <div class="form-group">
                                    <label class="control-label">LoginID</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Email/Mobile"></asp:TextBox>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="control-label">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-primary btn-block account-btn" Text="Login" OnClick="btnlogin_Click" />
                                </div>
                            </div>
                            <div class="text-center forgotpass mt-4"><a href="ForgetPassword.aspx">Forgot Password?</a></div>

                            <div class="text-center dont-have">Don’t have an account? <a href="Signup.aspx">Register</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script>
        var x = document.getElementById("myAudio");

        function playAudio() {
            alert('test');
            x.play();
        }

        function pauseAudio() {
            x.pause();
        }
     
    </script>

</body>
</html>
