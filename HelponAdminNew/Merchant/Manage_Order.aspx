<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_Order.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <label>From Date</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label>To Date</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:TextBox ID="txttoDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success mr-2" Text="Search &gt;&gt;" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <table class="table table-bordered table-condensed table-hover table-striped w-100">
                    <thead>
                        <tr>
                            <th>S.no</th>
                            <th>Action</th>
                            <th>Status</th>
                            <th>Customer</th>
                            <th>Payment Mode</th>
                            <th>Shipping Address</th>
                            <th>Total Amount</th>
                            <th>Order Date</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rpData" runat="server" OnItemDataBound="rpData_ItemDataBound" OnItemCommand="rpData_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Container.ItemIndex+1 %></td>
                                    <td>
                                        <a data-toggle="collapse" href='#collapseOrder_<%# Eval("ID") %>' role="button" aria-expanded="false" aria-controls='collapseOrder_<%# Eval("ID") %>' class="btn btn-primary">View 
                                        </a>

                                        <asp:HiddenField ID="hdnID" runat="server" Value='<%# Eval("ID") %>' />
                                        <asp:LinkButton ID="lnkbtnAction" runat="server" CssClass="btn btn-success" Text='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"Delivered":"Shipped" %>' CommandName='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"Delivered":"Shipped" %>' CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to Shipped this product?');" Visible='<%# (Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper() || Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper())?false:true %>'></asp:LinkButton>

                                        <asp:LinkButton ID="lnkbtnReject" runat="server" CssClass="btn btn-danger" Text="Reject" Visible='<%# (Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper() || Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper())?false:true %>' CommandArgument='<%# Eval("ID") %>' CommandName="Reject" OnClientClick="return confirm('Are you sure you want to reject this product?');"></asp:LinkButton>
                                        <a href='invoice.aspx?ID=<%# Eval("ID") %>' class="btn btn-dark text-white">Invoice</a>
                                        <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control mt-1" TextMode="MultiLine" placeholder="Enter Remark" Text='<%# Eval("Remark") %>' Visible='<%# (Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper() || Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper())?false:true %>'></asp:TextBox>

                                    </td>
                                    <td>
                                        <label class='<%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?"alert alert-info":Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper()?"alert alert-success":Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper()?"alert alert-danger":"alert alert-primary" %>'><%# Eval("OrderStatus") %></label>
                                        <br />
                                        <label class="w-100"><%# Eval("OrderStatus").ToString().ToUpper()=="Shipped".ToUpper()?Eval("ShippedRemark"):Eval("OrderStatus").ToString().ToUpper()=="Delivered".ToUpper()?Eval("DeliveredRemark"):Eval("OrderStatus").ToString().ToUpper()=="Cancelled".ToUpper()?Eval("CancelRemark"):"" %></label>
                                    </td>
                                    <td>
                                        <label><%# Eval("CustomerName") %></label>
                                        <br />
                                        <label><%# Eval("CustomerMobile") %></label>
                                        <br />
                                        <label><%# Eval("CustomerEmail") %></label>
                                    </td>
                                    <td>
                                        <label><%# Eval("PaymentMode") %></label>
                                        <br />
                                        <label><%# Eval("UPI") %></label>
                                        <br />
                                        <label><%# Eval("TransactionNo") %></label>
                                        <br />
                                        <%# Eval("TransactionNo").ToString().Length>0?"<a href='"+Eval("ScreenShot")+"' class='badge badge-success text-white'>Screen Shot</a>":"" %>
                                    
                                    </td>
                                    <td><%# Eval("ShippingAddress") %></td>
                                    <td><%# Eval("TotalAmount") %></td>
                                    <td><%# Eval("OrderDate") %></td>

                                </tr>
                                <tr>
                                    <td colspan="8">
                                        <div class="collapse" id='collapseOrder_<%# Eval("ID") %>'>
                                            <div class="card card-body">
                                                <asp:Repeater ID="rpData" runat="server">
                                                    <ItemTemplate>
                                                        <div class="card">
                                                            <div class="card-body alert alert-primary">
                                                                <div class="row">
                                                                    <div class="col-md-2">
                                                                        <img src='<%# Eval("IMG1") %>' style="width: 100px;" />

                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <label><%# Eval("ProductName") %> x <%# Eval("Qty") %></label>
                                                                        <br />
                                                                        <label>Price  : <%# Eval("Amount") %></label>
                                                                        <br />
                                                                        <label>Total Amount  : <%# Eval("NetAmount") %></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <%--<div class="table-responsive m-t-40">
                                                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                                                    <Columns>

                                                        <asp:TemplateField HeaderText="IMG" HeaderStyle-Width="150px">
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
                                            </div>--%>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>


                </table>

            </div>
        </div>
    </div>

</asp:Content>
