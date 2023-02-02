<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_Franchise.aspx.cs" Inherits="HelponAdminNew.AP.List_Franchise" %>

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
                    <br />
                    <asp:Button ID="btnsearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnsearch_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-striped" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="LoginID" HeaderText="LoginID" />
                        <asp:BoundField DataField="Password" HeaderText="Password" />
                        <asp:BoundField DataField="StateName" HeaderText="StateName" />
                        <asp:BoundField DataField="Districtname" HeaderText="Districtname" />
                        <asp:BoundField DataField="CityName" HeaderText="CityName" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                        <asp:BoundField DataField="AddDate" HeaderText="AddDate" />
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
