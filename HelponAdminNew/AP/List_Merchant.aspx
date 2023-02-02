<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_Merchant.aspx.cs" Inherits="HelponAdminNew.AP.List_Merchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label>From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>To Date</label>
                    <asp:TextBox ID="txttoDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                </div>
                <div class="col-md-3">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" ></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Sales Executive</label>
                    <asp:DropDownList ID="ddlSalesExecutive" runat="server" CssClass="form-control" ></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnsearch_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this ?');"  />
            <div class="table-responsive">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-striped" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="select">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAllApproved" onclick="selectCheckBoxesgvApproved(this)" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkrow" runat="server" />
                                <asp:HiddenField ID="hdnid" runat="server" Value='<%#Eval("MID") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href='Master_Merchant.aspx?MID=<%# Eval("MID") %>' class="btn btn-primary">Edit</a>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="IsDelete" CommandArgument='<%# Eval("MID") %>' OnClientClick="return confirm('Are you sure you want to delete this ?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <label class='<%# Eval("StatusClass") %>'><%# Eval("Status") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" />
                        <asp:BoundField DataField="SubCategoryName" HeaderText="SubCategoryName" />
                        <asp:BoundField DataField="ShopName" HeaderText="ShopName" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="LoginID" HeaderText="LoginID" />
                        <asp:BoundField DataField="Password" HeaderText="Password" />
                        <asp:BoundField DataField="AlternetMobile" HeaderText="AlternetMobile" />
                        <asp:BoundField DataField="WhatsappNo" HeaderText="WhatsappNo" />
                        <asp:BoundField DataField="TelPhoneNo" HeaderText="TelPhoneNo" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="StateName" HeaderText="StateName" />
                        <asp:BoundField DataField="Districtname" HeaderText="Districtname" />
                        <asp:BoundField DataField="TehsilName" HeaderText="TehsilName" />
                        <asp:BoundField DataField="CityName" HeaderText="CityName" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                        <asp:BoundField DataField="Twitter" HeaderText="Twitter" />
                        <asp:BoundField DataField="Instagram" HeaderText="Instagram" />
                        <asp:BoundField DataField="Facebook" HeaderText="Facebook" />
                        <asp:BoundField DataField="WebSite" HeaderText="WebSite" />
                        <asp:BoundField DataField="Aboutus" HeaderText="Aboutus" />
                        <asp:BoundField DataField="AddDate" HeaderText="AddDate" />
                        <asp:BoundField DataField="PaidDate" HeaderText="PaidDate" />
                        <asp:BoundField DataField="ApproveDate" HeaderText="ApproveDate" />
                        <asp:BoundField DataField="RejectDate" HeaderText="RejectDate" />
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
        function selectCheckBoxesgvApproved(chk) {
            var grid = document.getElementById('<%=GvData.ClientID %>');
            var arrCheckList = grid.getElementsByTagName('input');
            var count = 0;
            for (var i = 0; i < arrCheckList.length; i++) {
                if (arrCheckList[i].type == 'checkbox') {
                    arrCheckList[i].checked = chk.checked;
                }
            }
        }
     </script>
</asp:Content>
