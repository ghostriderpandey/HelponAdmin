<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="ManagePackage.aspx.cs" Inherits="HelponAdminNew.Merchant.ManagePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="row card-deck mb-3 text-center">

            <div class="col-4">
                <div class="card mb-4 box-shadow">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Pro</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">$15 <small class="text-muted">/ mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>20 users included</li>
                            <li>10 GB of storage</li>
                            <li>Priority email support</li>
                            <li>Help center access</li>
                        </ul>
                        <button type="button" class="btn btn-lg btn-block btn-primary">Get started</button>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="card mb-4 box-shadow">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Enterprise</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">$29 <small class="text-muted">/ mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>30 users included</li>
                            <li>15 GB of storage</li>
                            <li>Phone and email support</li>
                            <li>Help center access</li>
                        </ul>
                        <button type="button" class="btn btn-lg btn-block btn-primary">Contact us</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:Repeater runat="server" ID="rdt">
                    <ItemTemplate>
                        <div class="col-4">
                            <div class="card mb-4 box-shadow">
                                <div class="card-header">
                                    <h4 class="my-0 font-weight-normal"><label class="label label-primary"><%# Eval("PackageName") %></label></h4>
                                </div>
                                <div class="card-body">
                                    <h1 class="card-title pricing-card-title"><label class="label label-primary"><%# Eval("Amount") %></label> <small class="text-muted">/ mo</small></h1>
                                    <ul class="list-unstyled mt-3 mb-4">
                                        <li>10 users included</li>
                                        <li>2 GB of storage</li>
                                        <li>Email support</li>
                                        <li>Help center access</li>
                                    </ul>
                                    <button type="button" class="btn btn-lg btn-block btn-outline-primary">Sign up for free</button>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buy Now">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" CommandName="IsChange" CommandArgument='<%# Eval("PackageID") %>'><i class="fa fa-shopping-cart" aria-hidden="true"></i></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="PackageName" DataField="Name" />
                        <asp:BoundField HeaderText="Amount" DataField="Amount" />
                        <asp:BoundField HeaderText="Business Name" DataField="IsBusinessName" />
                        <asp:BoundField HeaderText="Contact Person Name" DataField="IsPersonalName" />
                        <asp:BoundField HeaderText="Address" DataField="IsAddress" />
                        <asp:BoundField HeaderText="Contact No" DataField="IsContactNo" />
                        <asp:BoundField HeaderText="E-Mail" DataField="IsEmail" />
                        <asp:BoundField HeaderText="About us" DataField="IsAboutus" />
                        <asp:BoundField HeaderText="SEO" DataField="IsSeo" />
                        <asp:BoundField HeaderText="Google Map" DataField="IsGoogleMap" />
                        <asp:BoundField HeaderText="Bank Details (Qr UPI)" DataField="IsBankDetail" />
                        <asp:BoundField HeaderText="Business Inquir" DataField="IsBusinessInquiry" />
                        <asp:BoundField HeaderText="Web Site" DataField="IsWebsite" />
                        <asp:BoundField HeaderText="Profile Image" DataField="ProfileIMG" />
                        <asp:BoundField HeaderText="Website Thumbnail" DataField="Thumbnail" />
                        <asp:BoundField HeaderText="Ads Slider" DataField="AdsSlider" />
                        <asp:BoundField HeaderText="Gallery Images" DataField="Gallery" />
                        <asp:BoundField HeaderText="Video Clip" DataField="Video" />
                        <asp:BoundField HeaderText="Coupon Facility" DataField="IsCoupons" />
                        <asp:BoundField HeaderText="Selling Product" DataField="Product" />
                        <asp:BoundField HeaderText="Tax Invoice Facility" DataField="IsTaxInvoice" />
                        <asp:BoundField HeaderText="Delivery Facility" DataField="DeliveryFacility" />
                        <asp:BoundField HeaderText="Login ID /Password" DataField="IsLogin" />

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
        function fnn() {
            $('#<%= GvData.ClientID%>').prepend($("<thead></thead>").append($("#<%= GvData.ClientID%>").find("tr:first"))).DataTable({
                "responsive": true,
                "dom": 'Bfrtip'
            });
        }
    </script>
</asp:Content>
