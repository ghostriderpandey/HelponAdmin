<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_SubCategory.aspx.cs" Inherits="HelponAdminNew.AP.Master_SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="card">
        <div class="card-body">
            <div class="row">
                 <div class="col-md-4">
                    <label>Category</label>
                   <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Sub Category</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                 
                <div class="col-md-4">
                    <label>Img (Max width 512 Px and height 512 Px and Size 100 KB)</label>
                    <asp:FileUpload ID="filecategory" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <label>Mobile  Icon (Max width 250 Px and height 120 Px and Size 10 KB)</label>
                    <asp:FileUpload ID="fileIconcategory" runat="server" CssClass="form-control" />
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
                        <asp:BoundField HeaderText="SubcategoryName" DataField="SubcategoryName" SortExpression="SubcategoryName" />
                        <asp:BoundField HeaderText="CategoryName" DataField="CategoryName" SortExpression="CategoryName" />
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
   
</asp:Content>
