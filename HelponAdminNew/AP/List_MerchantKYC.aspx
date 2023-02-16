<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="List_MerchantKYC.aspx.cs" Inherits="HelponAdminNew.AP.List_MerchantKYC" %>

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
                    <label>Merchant ID</label>
                    <asp:TextBox ID="txtMerchantID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <label>Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="Verified">Verified</asp:ListItem>
                        <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                    </asp:DropDownList>
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
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="false" OnRowCommand="GvData_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnVerify" runat="server" CssClass="btn btn-sm btn-success w-100" Text="Verify" CommandName="IsVerify" CommandArgument='<%# Eval("ID") %>' Visible='<%# Eval("Status").ToString().ToUpper()=="Pending".ToUpper()?true:false %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnReject" runat="server" CssClass="btn btn-sm btn-danger mt-2 w-100" Text="Reject" CommandName="IsReject" CommandArgument='<%# Eval("ID") %>' Visible='<%# Eval("Status").ToString().ToUpper()=="Pending".ToUpper()?true:false %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnedit" runat="server" CssClass="btn btn-sm btn-danger" CommandName="IsEdit" CommandArgument='<%# Eval("ID") %>'><i class="fa fa-edit"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remark">
                            <ItemTemplate>

                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Text='<%# Eval("Remark") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <label class='<%# Eval("Status").ToString().ToUpper()=="Verified".ToUpper()?"label label-success":Eval("Status").ToString().ToUpper()=="Rejected".ToUpper()?"label label-danger":"label label-primary" %>'><%# Eval("Status") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ShopName" HeaderText="ShopName" />
                        <asp:BoundField DataField="OwnerName" HeaderText="OwnerName" />
                        <asp:BoundField DataField="WhatsappNumber" HeaderText="WhatsappNumber" />
                        <asp:BoundField DataField="PersonalDocName" HeaderText="PersonalDocName" />
                        <asp:TemplateField HeaderText="PersonalDocumentFrontPhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("PersonalFrontPhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PersonalBackPhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("PersonalBackPhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="PersonalDocNumber" HeaderText="PersonalDocNumber" />
                        <asp:BoundField DataField="BusinessDocName" HeaderText="BusinessDocName" />
                        <asp:TemplateField HeaderText="BusinessFrontPhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("BusinessFrontPhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="BusinessBackPhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("BusinessBackPhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Photo" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("Photo") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ShopInsidePhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("ShopInsidePhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ShopOutsidePhoto" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='../Upload/KYCDocument/<%# Eval("ShopOutsidePhoto") %>' style="width: 100%;" />
                            </ItemTemplate>
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
