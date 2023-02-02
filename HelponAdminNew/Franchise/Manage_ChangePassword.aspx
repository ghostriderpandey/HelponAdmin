<%@ Page Title="" Language="C#" MasterPageFile="~/Franchise/Franchise.Master" AutoEventWireup="true" CodeBehind="Manage_ChangePassword.aspx.cs" Inherits="HelponAdminNew.Franchise.Manage_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-header">
                    <h5>Change Password</h5>
                </div>
                <div class="card-body">
                    <label>Current Password</label>
                    <asp:TextBox ID="txtCurrentPassword" TextMode="Password" placeholder="Current Password" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMenuName" runat="server" ControlToValidate="txtCurrentPassword"
                        Display="Dynamic" ErrorMessage="Please Enter Current Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="v"></asp:RequiredFieldValidator>
                    <label>New Password</label>
                    <asp:TextBox ID="txtpassword" TextMode="Password" placeholder="New Password" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtpassword"
                        Display="Dynamic" ErrorMessage="Please Enter New Password" SetFocusOnError="True"
                        ValidationGroup="v"></asp:RequiredFieldValidator>
                    <label>Confirm Password</label>
                    <asp:TextBox ID="txtConfirmpassword" TextMode="Password" placeholder="Confirm Password" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtConfirmpassword"
                        Display="Dynamic" ErrorMessage="Please Enter Confirm Password" SetFocusOnError="True"
                        ValidationGroup="v"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpDate" Text="Password MisMitch" ControlToValidate="txtpassword" Display="Dynamic" ControlToCompare="txtConfirmpassword" Type="String" Operator="Equal" runat="server" />
                    <label>&nbsp;</label>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" ValidationGroup="v" OnClick="btnSubmit_Click" />
                    &nbsp;&nbsp;&nbsp;
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ShowMessageBox="True"
                                        ShowSummary="False" ValidationGroup="v" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
