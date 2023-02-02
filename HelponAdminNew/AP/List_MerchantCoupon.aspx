<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_MerchantCoupon.aspx.cs" Inherits="HelponAdminNew.AP.List_MerchantCoupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label>From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label>To Date</label>
                    <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label>Coupon Type</label>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>MerchantID/Mobile</label>
                    <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                        <asp:TemplateField HeaderText="Merchant">
                            <ItemTemplate>
                                <label><%# Eval("ShopName") %></label>
                                <br />
                                <label class="label label-primary"><%# Eval("MerchantName") %></label>
                                <br />
                                <label class="label label-primary"><%# Eval("Mobile") %> / <%# Eval("LoginID") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Coupon">
                            <ItemTemplate>
                                <label><%# Eval("Name") %>-<%# Eval("Discount") %></label>
                                <br />
                                <label class="label label-primary"><%# Eval("Code") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="ExpireDate" DataField="ExpireDate" SortExpression="ExpireDate" />
                        <asp:BoundField HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate" />
                      
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
