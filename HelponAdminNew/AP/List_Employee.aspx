<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_Employee.aspx.cs" Inherits="HelponAdminNew.AP.List_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="gvEmployee" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" AutoGenerateColumns="false"
                    AllowPaging="false" DataKeyNames="EmployeeID" Width="100%" OnRowCommand="gvEmployee_RowCommand" ShowHeaderWhenEmpty="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="EmployeeType" DataField="EmployeeTypeName" SortExpression="EmployeeTypeName" />
                        <asp:BoundField HeaderText="EmployeeName" DataField="EmployeeName" SortExpression="EmployeeName" />
                        <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email" />
                        <asp:BoundField HeaderText="LoginID" DataField="LoginID" SortExpression="LoginID" />
                        <asp:BoundField HeaderText="Password" DataField="Password" SortExpression="Password" />
                        <asp:BoundField HeaderText="Mobile" DataField="Mobile" SortExpression="Mobile" />
                        <asp:BoundField HeaderText="Email" DataField="Email" SortExpression="Email" />
                        <asp:TemplateField HeaderText="AddDate" SortExpression="AddDate">
                            <ItemTemplate>
                                <%#String.Format("{0:dd-MMM-yyyy hh:mm tt}", Convert.ToDateTime(Eval("AddDate")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastUpdate" SortExpression="LastUpdate">
                            <ItemTemplate>
                                <%#String.Format("{0:dd-MMM-yyyy hh:mm tt}", Convert.ToDateTime(Eval("LastUpdate")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="16px">
                            <ItemTemplate>
                                <a href="Master_Employee.aspx?id=<%#Eval("EmployeeID") %>" title="Edit this record">
                                    <img src="../Images/icon/edit_16x16.png" alt="Edit" />
                                </a>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="16px">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="../Images/icon/icn_trash.png"
                                    AlternateText="Delete" ToolTip="Delete this record" CommandName="IsDelete" CommandArgument='<%#Eval("EmployeeID") %>'
                                    OnClientClick='return confirm("Are You Sure To Delete This Record?")' />
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="16px" SortExpression="IsActive">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnIsActive" runat="server" ImageUrl='<%# Convert.ToBoolean(Eval("IsActive")) == true ? "../Images/icon/IsActive.png" : "../Images/icon/IsDeactive.png" %>'
                                    AlternateText="Active/Deactive this record" ToolTip='<%# Convert.ToBoolean(Eval("IsActive")) == true ? "Deactive this record" : "Active this record" %>'
                                    CommandName="IsActive" CommandArgument='<%#Eval("EmployeeID") %>' OnClientClick='return confirm("Are You Sure To Active/Deactive This Record?")' />
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px">
                            <ItemTemplate>
                                <a href="ListEmployeeLoginDetail.aspx?id=<%#Eval("EmployeeID") %>">View Login Details</a>
                            </ItemTemplate>
                            <HeaderStyle Width="150px"></HeaderStyle>
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
