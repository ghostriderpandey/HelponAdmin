<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HelponAdminNew.Merchant.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xl-3 col-sm-6 col-12">
            <div class="card">
                <div class="card-body">
                    <div class="dash-widget-header">
                        <span class="dash-widget-icon bg-primary">
                            <i class="far fa-user"></i>
                        </span>
                        <div class="dash-widget-info">
                            <h3>Welcome</h3>
                            <h6 class="text-muted">Package</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <div class="col-xl-3 col-sm-6 col-12">
            
                <div class="card">
                    <div class="card-body">
                        <div class="dash-widget-header">
                            <span class="dash-widget-icon bg-primary">
                                <i class="fas fa-user-shield"></i>
                            </span>
                            <div class="dash-widget-info">
                                <h3 id="lblKYC" runat="server"> </h3>
                                <h6 class="text-muted">KYC</h6>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>
        <div class="col-xl-3 col-sm-6 col-12">
            <a href="List_Appointment.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="dash-widget-header">
                            <span class="dash-widget-icon bg-primary">
                                <i class="fas fa-user-shield"></i>
                            </span>
                            <div class="dash-widget-info">
                                <h3 id="lblTotalAppointment" runat="server"> </h3>
                                <h6 class="text-muted">Appointment</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 col-12">
            <a href="List_EnquiryNow.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="dash-widget-header">
                            <span class="dash-widget-icon bg-primary">
                                <i class="fas fa-qrcode"></i>
                            </span>
                            <div class="dash-widget-info">
                                <h3 id="lblTotalEnquiry" runat="server">0</h3>
                                <h6 class="text-muted">Enquiry</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-sm-6 col-12">
            <a href="Manage_Order.aspx">
                <div class="card">
                    <div class="card-body">
                        <div class="dash-widget-header">
                            <span class="dash-widget-icon bg-primary">
                                <i class="fas fa-shopping-cart"></i>
                            </span>
                            <div class="dash-widget-info">
                                <h3 id="lblTotalorder" runat="server">0</h3>
                                <h6 class="text-muted">Order</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

    </div>
 
</asp:Content>
