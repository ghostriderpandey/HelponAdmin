<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Franchise.aspx.cs" Inherits="HelponAdminNew.AP.Master_Franchise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
        <div class="card-header justify-content-center theme_bg_1">
            <h5 class="modal-title text_white">Manage Franchise</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Your Name"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Your Mobile No." TextMode="Number" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-md-12 mt-4">
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
                <div class="col-md-12 mt-4">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Your Address" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-4">
                    <asp:TextBox ID="txtCityName" runat="server" CssClass="form-control" placeholder="Enter Your City Name"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-4">
                    <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" placeholder="Enter Your Pincode" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                </div>
               
            </div>

            <asp:LinkButton ID="lnkbtnSignup" runat="server" CssClass="btn btn-primary mt-4" Text="Update" OnClick="lnkbtnSignup_Click"></asp:LinkButton>
           
        </div>
    </div>
</asp:Content>
