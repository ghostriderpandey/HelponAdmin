<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HelponAdminNew.AP.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <a href="Manage_Slider.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalSlider" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Slider</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Manage_Banner.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalBannerAds" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Banner Ads</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Master_Category.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalCategory" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Category</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Master_SubCategory.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalSubCategory" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Sub Category</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Manage_PopularCategory.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblPopularCategory" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Popular Category</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Master_PopularCites.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblPopularCity" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Popular City</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Master_Category.aspx?Type=Ecommerce">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalEcommerceCategory" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Ecommerce Category</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="Master_SubCategory.aspx?Type=Ecommerce">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalEcommerceSubCategory" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Ecommerce Sub Category</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="View_Request.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalServiceRequest" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Service Request</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="List_Product.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalProduct" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Product</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
         <div class="col-lg-3 col-md-6">
            <a href="List_Merchant.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalMerchant" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Merchant</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="List_PopularMerchant.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalPopularMerchant" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Popular Merchant</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="View_MerchantProduct.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalMerchantProduct" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Total Merchant Product</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
         <div class="col-lg-3 col-md-6">
            <a href="View_MerchantOrder.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblMerchantOrder" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Merchant Order</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-6">
            <a href="List_SalesPerson.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-12 d-flex justify-content-between align-items-center">
                                <i class="mdi mdi-account-multiple font-20 text-info"></i>
                                <h3 class="font-normal text-right mb-0">
                                    <asp:Label ID="lblTotalSalesPerson" runat="server" Text="0"></asp:Label></h3>
                            </div>
                            <div class="col-12">
                                <p class="font-16 mb-0">Sales Executive Order</p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</asp:Content>
