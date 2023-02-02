<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="ImportMerchant_Excel.aspx.cs" Inherits="HelponAdminNew.AP.ImportMerchant_Excel" %>

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
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success mt-2" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="Startloader();" />
                 <a href="../ExcelFormat/MerchantFormet.xlsx" class="btn btn-primary">Download Format</a>
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
                          <asp:TemplateField HeaderText="#" HeaderStyle-Width="100px">
                            <ItemTemplate>
                               
                                <img src='<%# Eval("Photo") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BusinessName" HeaderText="BusinessName" />
                        <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="State" HeaderText="State" />
                        <asp:BoundField DataField="District" HeaderText="District" />
                        <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                        <asp:BoundField DataField="Facebook" HeaderText="Facebook" />
                        <asp:BoundField DataField="Twitter" HeaderText="Twitter" />
                        <asp:BoundField DataField="Instagram" HeaderText="Instagram" />
                        <asp:BoundField DataField="Website" HeaderText="Website" />
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
            <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-success" Text="Upload" OnClick="btnUpload_Click" Visible="false" OnClientClick="Startloader();" />
        </div>
    </div>
</asp:Content>
