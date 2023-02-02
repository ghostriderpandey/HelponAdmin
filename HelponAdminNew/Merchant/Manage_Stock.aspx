<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_Stock.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_Stock" %>

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
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Product</label>
                    <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Quantity</label>
                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                    <columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <itemtemplate>
                                <%#Container.DataItemIndex+1 %>
                            </itemtemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                        <asp:BoundField HeaderText="Qty" DataField="Qty" SortExpression="Qty" />

                    </columns>
                    <emptydatatemplate>
                        <div class="EmptyDataTemplate">
                            No Record Found !
                        </div>
                    </emptydatatemplate>
                    <rowstyle cssclass="RowStyle" />
                    <pagerstyle cssclass="PagerStyle" />
                    <headerstyle cssclass="HeaderStyle" />
                    <alternatingrowstyle cssclass="AltRowStyle" />
                    <pagersettings position="Bottom" />
                </asp:GridView>
            </div>
        </div>
    </div>
   
</asp:Content>
