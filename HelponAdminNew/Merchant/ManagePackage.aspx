<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="ManagePackage.aspx.cs" Inherits="HelponAdminNew.Merchant.ManagePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Buy Now">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server"  CssClass="btn btn-primary"  CommandName="IsChange" CommandArgument='<%# Eval("PackageID") %>'><i class="fa fa-shopping-cart" aria-hidden="true"></i></asp:LinkButton>
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
