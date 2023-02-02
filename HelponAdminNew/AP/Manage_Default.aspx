<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_Default.aspx.cs" Inherits="HelponAdminNew.AP.Manage_Default" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card">
        <div class="card-header">
            <h5>Personal Details</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                </div>
                <div class="col-md-4">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Video</label>
                    <asp:FileUpload ID="fileVideo" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label>Profile<span style="color: red">Max width 512 Px and height 512 Px and Size 100 KB</span></label>
                    <asp:FileUpload ID="FileProfile" runat="server" CssClass="form-control" onchange="FileProfile(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PreviewProfile" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>
                <div class="col-md-4">
                    <label>Thumbnail  <span style="color: red">Max width 1250px and Height 400px and 300-500 KB</span></label>
                    <asp:FileUpload ID="FileThumbnail" runat="server" CssClass="form-control" onchange="FileThumbnail(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PreviewThumbnail" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>
                <div class="col-md-4">
                    <label>Slider <span style="color: red">Max width 1250px and Height 400px and 300-500 KB</span></label>
                    <asp:FileUpload ID="FileSlider" runat="server" CssClass="form-control" onchange="FileSlider(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PreviewSlider" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>
                <div class="col-md-4">
                    <label>Gallery-1 <span style="color: red">Max width 250px and Height 220px and 300-500 KB</span></label>
                    <asp:FileUpload ID="FileGallery1" runat="server" CssClass="form-control" onchange="FileGallery1(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PriviewFileGallery1" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>
                <div class="col-md-4">
                    <label>Gallery-2 <span style="color: red">Max width 250px and Height 220px and 300-500 KB</span></label>
                    <asp:FileUpload ID="FileGallery2" runat="server" CssClass="form-control" onchange="FileGallery2(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PriviewFileGallery2" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>
                <div class="col-md-4">
                    <label>Gallery-3 <span style="color: red">Max width 250px and Height 220px and 300-500 KB</span></label>
                    <asp:FileUpload ID="FileGallery3" runat="server" CssClass="form-control" onchange="FileGallery3(this);" accept=".png,.jpg,.jpeg,.gif" />
                    <asp:Image ID="PriviewFileGallery3" runat="server" Style="width: 100%; height: 150px; margin-top: 5px;" />
                </div>

                <div class="col-md-6">
                    <label>About us</label>
                    <CKEditor:CKEditorControl Toolbar="Basic" ID="txtAboutus" CssClass="form-control" runat="server" Height="150px" Width="100%"></CKEditor:CKEditorControl>

                </div>
                <div class="col-md-6">
                    <label>Amenities</label>
                    <CKEditor:CKEditorControl Toolbar="Basic" ID="txtAmenities" CssClass="form-control" runat="server" Height="150px" Width="100%"></CKEditor:CKEditorControl>
                </div>
                <div class="col-md-12">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowEditing="GvData_RowEditing" OnRowDeleting="GvData_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="IsChange" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="IsDelete" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to delete this ?');"></asp:LinkButton>
                                <asp:LinkButton runat="server" ID="LBProduct" class="btn btn2 btn-secondary" Style="font-weight: bold" data-toggle="tooltip" CommandName="IsProduct" CommandArgument='<%# Eval("ID") %>' data-placement="bottom" title="Product"><i class="fa fa-product-hunt" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Category" DataField="Category" SortExpression="Category" />
                        <asp:BoundField HeaderText="SubCategory" DataField="SubCategory" SortExpression="SubCategory" />
                        <asp:BoundField HeaderText="Abouts" DataField="Abouts" SortExpression="Abouts" />
                        <asp:BoundField HeaderText="Amenities" DataField="Amenities" SortExpression="Amenities" />
                        <asp:TemplateField HeaderText="video" HeaderStyle-Width="100px">
                            <ItemTemplate>

                                <video controls="controls" style="object-fit: cover; border-radius: 10px; width: 150px;">
                                    <source src='../Upload/Default/<%# Eval("video") %>' type="video/mp4">
                                </video>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profile" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Profile") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thumbnail" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Thumbnail") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Slider" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Slider") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gallery1" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Gallery1") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gallery2" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Gallery2") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gallery3" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='../Upload/Default/<%# Eval("Gallery3") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                    <EmptyDataTemplate>
                        <div class="EmptyDataTemplate">
                            No Record Found !
                       
                        </div>
                    </EmptyDataTemplate>
                    <RowStyle CssClass="RowStyle" />
                    <PagerStyle CssClass="PagerStyle" />
                    <HeaderStyle CssClass="HeaderStyle" />
                    <AlternatingRowStyle CssClass="AltRowStyle" />
                    <PagerSettings Position="Bottom" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function FileProfile(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewProfile').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FileThumbnail(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewThumbnail').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FileSlider(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PreviewSlider').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FileGallery1(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PriviewFileGallery1').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FileGallery2(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PriviewFileGallery2').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        function FileGallery3(input) {
            if (input.files && input.files[0]) {//Check if input has files.
                var reader = new FileReader();//Initialize FileReader.

                reader.onload = function (e) {
                    $('#ContentPlaceHolder1_PriviewFileGallery3').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
</asp:Content>
