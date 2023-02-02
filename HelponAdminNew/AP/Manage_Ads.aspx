<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_Ads.aspx.cs" Inherits="HelponAdminNew.AP.Manage_Ads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-4">
                        <label>Type</label>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="IMG">Image</asp:ListItem>
                            <asp:ListItem Value="Video">Video</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label>Merchant ID </label>
                        <asp:HiddenField ID="hndMID" runat="server" Value="0" />
                        <asp:TextBox ID="txtMerchantID" runat="server" CssClass="form-control" OnTextChanged="txtMerchantID_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <asp:Label ID="lblMerchantname" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-3">
                        <label>Position</label>
                        <asp:TextBox ID="txtPosition" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Slider (width 1350px and Height 250px and 100-500 KB)</label>

                        <asp:FileUpload ID="ImgUpload" runat="server" CssClass="form-control" onchange="readURL(this);" accept=".png,.jpg,.jpeg,.gif,.mp4,.mkv" />
                        <asp:Image ID="PreviewImage" runat="server" Style="width: 100%; height: 150px;" />
                    </div>
                    <div class="col-md-12">
                        <label>Link</label>
                        <asp:TextBox ID="txtlink" runat="server" CssClass="form-control"></asp:TextBox>

                    </div>

                    <div class="col-md-12 mt-2">

                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success mt-4" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="gvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" AutoGenerateColumns="false"
                    AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="true" OnRowCommand="gvData_RowCommand" OnRowDeleted="gvData_RowDeleted" OnRowEditing="gvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Slide IMG" HeaderStyle-Width="500px">
                            <ItemTemplate>
                                <img src='../Upload/Ads/<%# Eval("URL") %>' class='<%# Eval("Type").ToString()!="IMG"?"d-none":"" %>' style="" />
                                <video controls="controls" style="object-fit: cover; border-radius: 10px;" class='<%# Eval("Type").ToString()!="Video"?"d-none":"" %>'>
                                    <source src='../Upload/Ads/<%# Eval("URL") %>' type="video/mp4" />
                                </video>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="IsDelete" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger" Text="Delete"></asp:LinkButton>
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
