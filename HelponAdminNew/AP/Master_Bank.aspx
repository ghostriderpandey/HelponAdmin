<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Bank.aspx.cs" Inherits="HelponAdminNew.AP.Master_Bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label>Bank Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
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
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                      
                        <asp:BoundField HeaderText="BankName" DataField="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="IsChange" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"btn btn-success":"btn btn-danger" %>' Text='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"Active":"In-Active" %>' CommandName="IsActive" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
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
