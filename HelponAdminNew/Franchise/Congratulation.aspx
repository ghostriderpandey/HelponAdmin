<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Congratulation.aspx.cs" Inherits="HelponAdminNew.Franchise.Congratulation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Congratulation</title>

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
                            <div class="col-lg-8">
                                <div class="modal-content cs_modal">
                                    <div class="modal-header justify-content-center theme_bg_1">
                                        <h5 class="modal-title text_white">Congratulation</h5>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table">
                                            <tr>
                                                <td>Name</td>
                                                <td><asp:Label ID="lblName" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td><asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Mobile</td>
                                                <td><asp:Label ID="lblMobile" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>LoginID</td>
                                                <td><asp:Label ID="lblLoginID" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Password</td>
                                                <td><asp:Label ID="lblPassword" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                        <a href="Login.aspx" class="btn_1 full_width text-center">Go To Login</a>
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
