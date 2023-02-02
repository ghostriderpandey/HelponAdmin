<%@ Page Title="" Language="C#" MasterPageFile="~/Franchise/Franchise.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HelponAdminNew.Franchise.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="page_title_box d-flex flex-wrap align-items-center justify-content-between">
                <div class="page_title_left">
                    <h3 class="f_s_25 f_w_700 dark_text">Dashboard</h3>
                    <ol class="breadcrumb page_bradcam mb-0">
                        <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                        <li class="breadcrumb-item active">Default</li>
                    </ol>
                </div>
                <div class="page_title_right">
                    <div class="page_date_button">
                       <asp:Label ID="lblDOJ" runat="server"></asp:Label>
                               
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
    <div class="row ">
        <div class="col-xl-12">
            <div class="white_card card_height_100 mb_30 social_media_card">
                <div class="white_card_header">
                    <div class="main-title">
                        <h3 class="m-0">Detail</h3>
                        <span>About Your Work</span>
                    </div>
                </div>
                <div class="media_thumb ml_25">
                    <img src="img/media.svg" alt="">
                </div>
                <div class="media_card_body">
                    <div class="media_card_list">
                        <div class="single_media_card">
                            <span>Total Merchant</span>
                            <h3>0</h3>
                        </div>
                        <div class="single_media_card">
                            <span>Paid Merchant</span>
                            <h3>0</h3>
                        </div>
                        <div class="single_media_card">
                            <span>Reject Merchant</span>
                            <h3>0</h3>
                        </div>
                        <div class="single_media_card">
                            <span>Pending Merchant</span>
                            <h3>0</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
</asp:Content>
