<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_PopularMerchant.aspx.cs" Inherits="HelponAdminNew.AP.List_PopularMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        
                        <div class="col-md-3">
                             <label>Popular Category</label>
                                <asp:DropDownList ID="ddlPopularCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPopularCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-striped" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting"  >
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                       
                                        <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="IsDelete" CommandArgument='<%# Eval("PopularID") %>' OnClientClick="return confirm('Are you sure you want to delete this ?');"></asp:LinkButton>
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
