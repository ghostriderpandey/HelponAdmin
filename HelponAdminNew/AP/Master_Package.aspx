<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Master_Package.aspx.cs" Inherits="HelponAdminNew.AP.Master_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-2">
                    <label>Package </label>
                    <asp:DropDownList ID="ddlPackage" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPackage_SelectedIndexChanged" AutoPostBack="true">
                       
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Package Price</label>
                    <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Business Name</label>
                    <asp:DropDownList ID="ddlBusinessName" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Contact Person Name</label>
                    <asp:DropDownList ID="ddlContactPersonName" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Address</label>
                    <asp:DropDownList ID="ddlAddress" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Contact No</label>
                    <asp:DropDownList ID="ddlContactNo" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>About us</label>
                    <asp:DropDownList ID="ddlAboutus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>SEO</label>
                    <asp:DropDownList ID="ddlSeo" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Google Map</label>
                    <asp:DropDownList ID="ddlGoogleMap" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Bank Details (Qr UPI)</label>
                    <asp:DropDownList ID="ddlBankDetail" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Business Inquiry</label>
                    <asp:DropDownList ID="ddlBusinessInquiry" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Web Site</label>
                    <asp:DropDownList ID="ddlWebsite" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>E-Mail</label>
                    <asp:DropDownList ID="ddlEmail" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Coupon Facility</label>
                    <asp:DropDownList ID="ddlCouponFacility" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Tax Invoice Facility</label>
                    <asp:DropDownList ID="ddlTaxInvoiceFacility" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Delivery Facility</label>
                    <asp:DropDownList ID="ddlDeliveryFacility" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Login ID /Password</label>
                    <asp:DropDownList ID="ddlLogin" runat="server" CssClass="form-control">
                        <asp:ListItem Value="2">--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-2">
                    <label>Profile Image</label>
                    <asp:TextBox ID="txtProfileImg" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Website Thumbnail</label>
                    <asp:TextBox ID="txtWebsiteThumbnail" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Ads Slider</label>
                    <asp:TextBox ID="txtAdsSlider" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Gallery Images</label>
                    <asp:TextBox ID="txtGallery" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Video Clip</label>
                    <asp:TextBox ID="txtVideoClip" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <label>Selling Product</label>
                    <asp:TextBox ID="txtProduct" runat="server" Text="0" TextMode="Number" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-12">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
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
                         <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="IsChange" CommandArgument='<%# Eval("PackageID") %>'></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"btn btn-success":"btn btn-danger" %>' Text='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"Active":"In-Active" %>' CommandName="IsActive" CommandArgument='<%# Eval("PackageID") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="PackageName" DataField="Name"/>
                        <asp:BoundField HeaderText="Amount" DataField="Amount"/>
                        <asp:BoundField HeaderText="Business Name" DataField="IsBusinessName"/>
                        <asp:BoundField HeaderText="Contact Person Name" DataField="IsPersonalName"/>
                        <asp:BoundField HeaderText="Address" DataField="IsAddress"/>
                        <asp:BoundField HeaderText="Contact No" DataField="IsContactNo"/>
                        <asp:BoundField HeaderText="E-Mail" DataField="IsEmail"/>
                        <asp:BoundField HeaderText="About us" DataField="IsAboutus"/>
                        <asp:BoundField HeaderText="SEO" DataField="IsSeo"/>
                        <asp:BoundField HeaderText="Google Map" DataField="IsGoogleMap"/>
                        <asp:BoundField HeaderText="Bank Details (Qr UPI)" DataField="IsBankDetail"/>
                        <asp:BoundField HeaderText="Business Inquir" DataField="IsBusinessInquiry"/>
                        <asp:BoundField HeaderText="Web Site" DataField="IsWebsite"/>
                        <asp:BoundField HeaderText="Profile Image" DataField="ProfileIMG"/>
                        <asp:BoundField HeaderText="Website Thumbnail" DataField="Thumbnail"/>
                        <asp:BoundField HeaderText="Ads Slider" DataField="AdsSlider"/>
                        <asp:BoundField HeaderText="Gallery Images" DataField="Gallery"/>
                        <asp:BoundField HeaderText="Video Clip" DataField="Video"/>
                        <asp:BoundField HeaderText="Coupon Facility" DataField="IsCoupons"/>
                        <asp:BoundField HeaderText="Selling Product" DataField="Product"/>
                        <asp:BoundField HeaderText="Tax Invoice Facility" DataField="IsTaxInvoice"/>
                        <asp:BoundField HeaderText="Delivery Facility" DataField="DeliveryFacility"/>
                        <asp:BoundField HeaderText="Login ID /Password" DataField="IsLogin"/>
                      
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
