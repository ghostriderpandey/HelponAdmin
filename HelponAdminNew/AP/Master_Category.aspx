<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Category.aspx.cs" Inherits="HelponAdminNew.AP.Master_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <label>Category</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label>Img (Max width 512 Px and height 512 Px and Size 100 KB)</label>
                    <asp:FileUpload ID="filecategory" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-12">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="col-md-12">
                    <label>Mobile Icon (Max width 250 Px and height 120 Px and Size 10 KB)</label>
                    <div class="input-group mb-3">
                        <asp:FileUpload ID="fileSlideImgUpload" runat="server" CssClass="form-control" onchange="readURL(this);" accept=".png,.jpg,.jpeg,.gif" />
                    </div>
                    <asp:Image ID="PreviewImage" runat="server" Style="width: 100%; height: 150px;" />
                </div>

                <div class="col">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnSubmit_Click" />
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
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="200px">
                            <ItemTemplate>
                                <img src='../Upload/Category/<%# Eval("IMG") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                        <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="IsChange" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="IsDelete" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to delete this ?');" ></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
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
    <script>
      
   
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
