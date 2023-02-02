<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_Product.aspx.cs" Inherits="HelponAdminNew.AP.List_Product" %>

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
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" ></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Text="Search" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='<%# Eval("IMG1") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product">
                            <ItemTemplate>
                                <label><%# Eval("Productname") %></label>
                                <br />
                                <label class="label label-primary"><%# Eval("Categoryname") %></label>
                                <label class="label label-primary"><%# Eval("SubCategoryName") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="MRP" DataField="MRP" SortExpression="MRP" />
                        <asp:BoundField HeaderText="Price" DataField="Price" SortExpression="Price" />
                        <asp:BoundField HeaderText="IGST" DataField="IGST" SortExpression="IGST" />
                        <asp:BoundField HeaderText="SGST" DataField="SGST" SortExpression="SGST" />
                        <asp:BoundField HeaderText="CGST" DataField="CGST" SortExpression="CGST" />

                        <asp:BoundField HeaderText="Description" DataField="About" SortExpression="About" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href='Manage_Product.aspx?id=<%# Eval("ID") %>' target="_blank" class="btn btn-primary">Edit</a>
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
