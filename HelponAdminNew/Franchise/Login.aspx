<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HelponAdminNew.Franchise.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Franchise-Login</title>

    <link rel="stylesheet" href="css/bootstrap1.min.css" />

    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS" />
     <script src="../Merchant/assets/js/jquery-3.6.0.min.js"></script>
    <script src="../jquery_Package/sweetalert.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid p-0">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="white_box mb_30">
                        <div class="row justify-content-center">
                            <div class="col-lg-6">

                                <div class="modal-content cs_modal">
                                    <div class="modal-header justify-content-center theme_bg_1">
                                        <h5 class="modal-title text_white">Log in</h5>
                                    </div>
                                    <div class="modal-body">
 
                                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter your Email/Mobile"></asp:TextBox>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="******" TextMode="Password"></asp:TextBox>
                                        <asp:LinkButton ID="lnkbtnLogin" runat="server" CssClass="btn_1 full_width text-center" Text="Log in" OnClick="btnlogin_Click"></asp:LinkButton>
                                        <p>Need an account? <a href="Signup.aspx">Sign Up</a></p>
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
