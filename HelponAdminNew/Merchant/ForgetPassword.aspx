<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="HelponAdminNew.Merchant.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <title>Merchant-Forget Password</title>
    <link rel="shortcut icon" href="assets/img/favicon.png" />
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css" />
</head>
<body>
    <form id="form1" runat="server">
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
                            <h3>Forgot Password? <span>Helpon</span></h3>
                            <p class="text-muted">Enter your email to get a password reset link</p>
                        </div>
                        <div >
                            <div class="form-group mb-4">
                                <label class="control-label">Email</label>
                                <input class="form-control" type="text" placeholder="Enter your mail id">
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary btn-block account-btn" type="submit">Reset Password</button>
                            </div>
                        </div>
                        <div class="text-center dont-have">Remember your password? <a href="login.aspx">Login</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
