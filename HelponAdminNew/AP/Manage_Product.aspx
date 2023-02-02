<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_Product.aspx.cs" Inherits="HelponAdminNew.AP.Manage_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
                 <div class="col-md-4">
                     <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Product Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <label>MRP</label>
                    <asp:TextBox ID="txtMrp" runat="server" CssClass="form-control" placeholder="Enter MRP"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <label>Price</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <label>IGST</label>
                    <asp:TextBox ID="txtIGST" runat="server" CssClass="form-control" placeholder="Enter IGST" OnTextChanged="txtIGST_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <label>CGST</label>
                   <asp:Label ID="lblCGST" runat="server" CssClass="form-control"></asp:Label>
                </div>
                 <div class="col-md-4">
                    <label>SGST</label>
                     <asp:Label ID="lblSGST" runat="server" CssClass="form-control"></asp:Label>
                </div>
                 <div class="col-md-12">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                </div>
                 <div class="col-md-4">
                    <label>Thumbnail Image</label>
                      <asp:Image ID="PreviewImage" runat="server" Style="width:100%; height: 150px;" />
                      <asp:FileUpload ID="fileImgThumbnail" runat="server" CssClass="form-control" onchange="readURL(this);" accept=".png,.jpg,.jpeg,.gif" />
                </div>
                <div class="col-md-4">
                    <label>image- 1</label>
                    <asp:FileUpload ID="fileImg1" runat="server" CssClass="form-control" />
                     <label>image- 3</label>
                    <asp:FileUpload ID="fileImg3" runat="server" CssClass="form-control" />
                  
                  
                </div>
                <div class="col-md-4">
                     <label>image- 2</label>
                    <asp:FileUpload ID="fileImg2" runat="server" CssClass="form-control" />
                      <label>image- 4</label>
                    <asp:FileUpload ID="fileImg4" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-12">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
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
