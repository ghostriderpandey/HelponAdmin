<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HelponAdminNew.AP.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex,nofollow" />
    <title>Admin Login</title>
    <link href="assets/css/style.min.css" rel="stylesheet" />
</head>
<body>

    <div id="main-wrapper">
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center" style="background: url(assets/images/userbg.jpg) no-repeat center center; background-size: cover;">
            <div class="auth-box" style="background: rgba(255,255,255,1);">
                <div id="loginfo">
                    <div class="logo">
                       
                        <h5 class="font-medium m-b-20">Sign In to Admin</h5>
                    </div>
                    <!-- Form -->
                    <div class="row">
                        <div class="col-12">
                            <form class="form-horizontal m-t-20" runat="server" id="loginform">
                                <div class="input-group mb-3">
                                  
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control " placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required></asp:TextBox>
                                </div>
                                <div class="input-group mb-3">
                                   
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                            <label for="chkremember"> <asp:CheckBox ID="chkremember" runat="server"/> Remember me</label>
                                    </div>
                                </div>
                                <div class="form-group text-center">
                                    <div class="col-xs-12 p-b-20">
                                        <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-block btn-lg btn-info" OnClick="btnLogin_Click" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
</body>
</html>
