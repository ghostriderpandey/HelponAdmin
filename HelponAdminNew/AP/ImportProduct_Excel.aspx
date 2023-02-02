<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="ImportProduct_Excel.aspx.cs" Inherits="HelponAdminNew.AP.ImportProduct_Excel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                </div>
                <div class="col-md-3">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Excel File</label>
                    <asp:FileUpload ID="fileExcel" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success mt-2" Text="Submit" OnClick="btnSubmit_Click" />
                 <a href="../../ExcelFormat/ProductFormat.xlsx" class="btn btn-primary mt-2">Download Format</a>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="gvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <label class='<%# Eval("status").ToString().ToUpper()=="Success".ToUpper()?"label label-success":Eval("status").ToString().ToUpper()=="Failed".ToUpper()?"label label-danger":"label label-primary" %>'><%# Eval("Status") %></label>
                                <label class="alert alert-danger mt-2" id="lblMessage" runat="server" visible='<%# Eval("Status").ToString() == "Failed" ? true : false %>'>
                                    <%# Eval("Message") %>
                                </label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='<%# Eval("Image") %>' style="width:100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="MRP" HeaderText="MRP" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                       
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
        <div class=" card-footer">
            <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-success" Text="Upload" OnClick="btnUpload_Click" Visible="false" />
        </div>
    </div>
</asp:Content>
