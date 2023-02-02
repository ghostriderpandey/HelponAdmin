<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="ManageChangepassword.aspx.cs" Inherits="HelponAdminNew.Merchant.ManageChangepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-header">
            <h5>Change Password</h5>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <asp:Literal runat="server" ID="litmsg"></asp:Literal>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label>Old Password</label>
                        <asp:TextBox ID="txtoldpassword" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ControlToValidate="txtoldpassword" ValidationGroup="Save" SetFocusOnError="true"
                            runat="server" ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        <label>New Password</label>
                        <asp:TextBox ID="txtnewpassword" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtnewpassword" ValidationGroup="Save" SetFocusOnError="true"
                            runat="server" ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-3">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtconfirmpassword" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ControlToValidate="txtconfirmpassword" ValidationGroup="Save" SetFocusOnError="true"
                            runat="server" ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpassword"
                            ControlToValidate="txtconfirmpassword" ValidationGroup="Save" Display="Dynamic" SetFocusOnError="true"
                            ErrorMessage="Not match new password & confirm password .!" ForeColor="Red" Style="font-size: 13px !important;"></asp:CompareValidator>
                    </div>
                    <div class="col-md-3">
                        <br />

                        <asp:Button ID="btnsubmit" runat="server" ClientIDMode="Static" CssClass="btn btn-success" ValidationGroup="Save" Text="Submit" OnClick="btnsubmit_Click" />
                        <asp:Button ID="btncancel" runat="server" ClientIDMode="Static" CssClass="btn btn-primary" Text="Cancel" OnClick="btncancel_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">

        $("#txtoldpassword").change(function () {
            var oldpassword = $("#txtoldpassword").val();
            $.ajax({
                url: "ManageChangepassword.aspx/GetCheckOldPassword",
                type: "POST",
                data: '{oldpassword: "' + oldpassword + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == "false") {
                        $("#txtoldpassword").val('');
                        $("#txtoldpassword").focus();
                        alert('Old Password Not match');

                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        });

    </script>
</asp:Content>
