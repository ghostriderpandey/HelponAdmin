<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Merchant.aspx.cs" Inherits="HelponAdminNew.AP.Master_Merchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>Personal Details</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                        </div>
                        <div class="col-md-6">
                            <label>Sub Category</label>
                            <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>Shop Name</label>
                            <asp:TextBox ID="txtshopname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Mobile</label>
                            <asp:TextBox ID="txtMobile" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Alternet Mobile</label>
                            <asp:TextBox ID="txtAlternetMobile" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Tel-Phone</label>
                            <asp:TextBox ID="txtTelphone" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Whatsapp Number</label>
                            <asp:TextBox ID="txtWhatsappnumber" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>About us</label>
                            <asp:TextBox ID="txtAboutus" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5>Social Media</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <label><i class="fa fa-twitter"></i>Twitter</label>
                            <asp:TextBox ID="txtTwitter" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-instagram"></i>Instagram</label>
                            <asp:TextBox ID="txtInstagram" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-facebook"></i>Facebook</label>
                            <asp:TextBox ID="txtfacebook" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-chrome"></i>Web Site</label>
                            <asp:TextBox ID="txtwebsite" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h5>Address</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label>State</label>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>Tehsil</label>
                            <asp:DropDownList ID="ddlTehsil" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>City Name</label>
                            <asp:TextBox ID="txtCityname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Pin code</label>
                            <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Sales Executive ID</label>
                            <asp:TextBox ID="txtSponserID" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
