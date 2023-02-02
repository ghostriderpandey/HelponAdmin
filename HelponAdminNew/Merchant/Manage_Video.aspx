<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_Video.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_Video" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row justify-content-center">
                <div class="col-md-6 border">
                    <video id="video" runat="server" src="../Upload/Videos/1.mp4" controls="controls" width="100%" />
                     </div>
            </div>
             <asp:FileUpload ID="fileVideo" runat="server" CssClass="form-control" />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Upload" OnClick="btnSubmit_Click" />
              
        </div>
    </div>
</asp:Content>
