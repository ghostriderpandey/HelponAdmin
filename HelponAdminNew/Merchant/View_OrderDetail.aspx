<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="View_OrderDetail.aspx.cs" Inherits="HelponAdminNew.Merchant.View_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="150px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnAction" runat="server" CssClass="btn btn-success" Text='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"Delivered":"Shipped" %>' CommandName='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"Delivered":"Shipped" %>' CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to Shipped this product?');" Visible='<%# (Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper() || Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper())?false:true %>'></asp:LinkButton>

                                <asp:LinkButton ID="lnkbtnReject" runat="server" CssClass="btn btn-danger" Text="Reject" Visible='<%# (Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper() || Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper())?false:true %>' CommandArgument='<%# Eval("ID") %>' CommandName="Reject" OnClientClick="return confirm('Are you sure you want to reject this product?');"></asp:LinkButton>
                                <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control mt-1" TextMode="MultiLine" placeholder="Enter Remark" Text='<%# Eval("Remark") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" HeaderStyle-Width="150px">
                            <ItemTemplate>
                                <label class='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"alert alert-info":Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper()?"alert alert-success":Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper()?"alert alert-danger":"alert alert-primary" %>'><%# Eval("OrderStatus") %></label>
                                <br />
                                <label class="w-100"><%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?Eval("ShippedRemark"):Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper()?Eval("DeliveredRemark"):Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper()?Eval("CancelRemark"):"" %></label>


                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View" HeaderStyle-Width="150px">
                            <ItemTemplate>
                                <img src='<%# Eval("IMG1") %>' width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product">
                            <ItemTemplate>
                                <label><%# Eval("ProductName") %> x <%# Eval("Qty") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Amount" DataField="Amount" />
                        <asp:BoundField HeaderText="NetAmount" DataField="NetAmount" />

                    </Columns>
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
