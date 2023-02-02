<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_KYC.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_KYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Shop Detail</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label>Shop Name</label>
                            <asp:TextBox ID="txtShopName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>Your Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>Mobile</label>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>Document</label>
                            <asp:DropDownList ID="ddlPersonalDoc" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>Front Photo</label>
                            <asp:FileUpload ID="filePersonalFront" runat="server" CssClass="form-control" onchange="PersonalFront(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PriviewPersonalFront" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-6">
                            <label>Back Photo</label>
                            <asp:FileUpload ID="filePersonalBack" runat="server" CssClass="form-control" onchange="PersonalBack(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewPersonalBack" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-12">
                            <label>Document Number</label>
                            <asp:TextBox ID="txtPersonalDocNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            
            </div>
              <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger w-100 h-100">

              </asp:Label>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Business Detail</h5>
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-12">
                            <label>Document</label>
                            <asp:DropDownList ID="ddlDocumtnBusiness" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>Front Photo</label>
                            <asp:FileUpload ID="FileUploadBusinessFront" runat="server" CssClass="form-control" onchange="UploadBusinessFront(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewBusinessFront" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-6">
                            <label>Back Photo</label>
                            <asp:FileUpload ID="FileUploadBusinessBack" runat="server" CssClass="form-control" onchange="UploadBusinessBack(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewBusinessBack" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-12">
                            <label>Document Number</label>
                            <asp:TextBox ID="txtBusinessDocNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>Your Photo</label>
                            <asp:FileUpload ID="FileUploadPhoto" runat="server" CssClass="form-control" onchange="UploadPhoto(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewUploadPhoto" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-6">
                            <label>Shop Inside Photo</label>
                            <asp:FileUpload ID="FileUploadShopInside" runat="server" CssClass="form-control" onchange="UploadShopInside(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewUploadShopInside" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <div class="col-md-6">
                            <label>Shop Outside Photo</label>
                            <asp:FileUpload ID="FileUploadOutSide" runat="server" CssClass="form-control" onchange="UploadOutSide(this);" accept=".png,.jpg,.jpeg,.gif" />
                            <asp:Image ID="PreviewUploadOutSide" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                        </div>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success w-100 mt-3" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function PersonalFront(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PriviewPersonalFront').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function PersonalBack(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewPersonalBack').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function UploadBusinessFront(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewBusinessFront').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function UploadBusinessBack(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewBusinessBack').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function UploadPhoto(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewUploadPhoto').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function UploadShopInside(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewUploadShopInside').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function UploadOutSide(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewUploadOutSide').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
