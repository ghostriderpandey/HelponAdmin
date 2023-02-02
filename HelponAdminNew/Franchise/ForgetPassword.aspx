<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="HelponAdminNew.Franchise.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Franchise-Signup</title>

    <link rel="stylesheet" href="css/bootstrap1.min.css" />

    <link rel="stylesheet" href="css/style1.css" />
    <link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS" />
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
                                        <h5 class="modal-title text_white">Forget Password</h5>
                                    </div>
                                    <div class="modal-body">
                                        <asp:TextBox ID="txtloginID" runat="server" CssClass="form-control" placeholder="Enter your Email/Mobile"></asp:TextBox>
                                       
                                        <asp:LinkButton ID="lnkbtnSubmit" runat="server" CssClass="btn_1 full_width text-center" Text="Send" OnClick="lnkbtnSubmit_Click"></asp:LinkButton>
                                        <p>You are Already Registered ? <a href="Login.aspx">Login</a></p>
                                       
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
