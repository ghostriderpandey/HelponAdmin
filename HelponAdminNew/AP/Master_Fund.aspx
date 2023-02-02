<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Fund.aspx.cs" Inherits="HelponAdminNew.AP.Master_Fund" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="form-group">
                 <div class="col-md-6">
                    <label>Wallet Type</label>
                    <div class="input-group mb-3">
                       <asp:DropDownList ID="ddlWalletType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlWalletType_SelectedIndexChanged" AutoPostBack="true">
                           <asp:ListItem Value="0">--Select--</asp:ListItem>
                           <asp:ListItem Value="Merchant">Merchant Wallet</asp:ListItem>
                           <asp:ListItem Value="Customer">Customer Wallet</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Mobile&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblName" runat="server" Text=""></asp:Label></label>
                    <asp:HiddenField ID="hidMsrNo" runat="server" />
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ti-user"></i></span>
                        </div>
                        <asp:TextBox ID="txtMemberID" runat="server" CssClass="form-control" PlaceHolder="Mobile" AutoPostBack="true" OnTextChanged="txtMemberID_TextChanged"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required" ForeColor="Red" ValidationGroup="V"
                            ControlToValidate="txtMemberID" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Balance</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ti-user"></i></span>
                        </div>
                        <asp:Label ID="lblBalance" runat="server" CssClass="form-control" PlaceHolder="Balance"></asp:Label>
                    </div>
                </div>
                 <div class="col-md-6">
                    <label>Factor</label>
                    <div class="input-group mb-3">
                       <asp:DropDownList ID="ddlFactor" runat="server" CssClass="form-control">
                           <asp:ListItem Value="0">--Select--</asp:ListItem>
                           <asp:ListItem Value="Cr">Credit</asp:ListItem>
                           <asp:ListItem Value="Dr">Debit</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Amount</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ti-user"></i></span>
                        </div>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" PlaceHolder="Amount"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="* Required" ForeColor="Red" ValidationGroup="V"
                            ControlToValidate="txtAmount" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Narration</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ti-user"></i></span>
                        </div>
                        <asp:TextBox ID="txtNarration" runat="server" TextMode="MultiLine" CssClass="form-control" PlaceHolder="Narration"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="* Required" ForeColor="Red" ValidationGroup="V"
                            ControlToValidate="txtNarration" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnSubmit" runat="server" ValidationGroup="V" CssClass="btn btn-success mr-2" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-success mr-2" Text="Reset" OnClick="btnReset_Click" />
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" ClientIDMode="Static" ValidationGroup="V" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
