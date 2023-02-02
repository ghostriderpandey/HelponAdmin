<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_BankDetail.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_BankDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Bank Detail</h5>
                </div>
                <div class="card-body">
                    <label>Bank Name</label>
                    <asp:DropDownList ID="ddlBank" runat="server" CssClass="form-control"></asp:DropDownList>
                    <label>Account No</label>
                    <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <label>IFSC Code</label>
                    <asp:TextBox ID="txtIFSCCode" runat="server" CssClass="form-control"></asp:TextBox>
                    <label>Bank Branch</label>
                    <asp:TextBox ID="txtBranch" runat="server" CssClass="form-control"></asp:TextBox>
                    <label>Holder Name</label>
                    <asp:TextBox ID="txtHolderName" runat="server" CssClass="form-control"></asp:TextBox>
                    <label>Qrcode</label>
                     <asp:FileUpload ID="fileQrcode" runat="server" CssClass="form-control" onchange="readURL(this);" accept=".png,.jpg,.jpeg,.gif" />
                     <asp:Image ID="PreviewImage" runat="server" Style="width:150px; height: 150px;" />
                    <br />
                    <label>UPI ID</label>
                    <asp:TextBox ID="txtupi" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary w-100" OnClick="btnSubmit_Click" Text="Submit" />
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewImage').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
     </script>
</asp:Content>
