<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_Gallery.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" />
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        /* .container{
	width:90%
	margin:10px auto;
} */
        .portfolio-menu {
            text-align: center;
        }

            .portfolio-menu ul li {
                display: inline-block;
                margin: 0;
                list-style: none;
                padding: 10px 15px;
                cursor: pointer;
                -webkit-transition: all 05s ease;
                -moz-transition: all 05s ease;
                -ms-transition: all 05s ease;
                -o-transition: all 05s ease;
                transition: all .5s ease;
            }

        .portfolio-item {
            /*width:100%;*/
        }

            .portfolio-item .item {
                /*width:303px;*/
                float: left;
                margin-bottom: 10px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="form-group row">
                <div class="col-md-12">
                    <%--<label>Img (Max width 1024 Px and height 800 Px and Size 300 KB)</label>--%>
                    <div id="dvPreview">
                        <label for="ContentPlaceHolder1_fileGallery" style="width:100px;height:100px;border:1px solid black;display:flex;justify-content:center;align-items:center;">Add Photos</label>
                    </div>
                    <asp:FileUpload ID="fileGallery" runat="server" multiple="multiple" CssClass="form-control d-none" />
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Upload Now" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="portfolio-item row">
                <asp:Repeater ID="rpData" runat="server" OnItemCommand="rpData_ItemCommand">
                    <ItemTemplate>
                        <div class="item selfie col-lg-3 col-md-4 col-6 col-sm">
                            <a href='../Upload/Gallery/<%# Eval("IMG") %>' class="fancylight popup-btn" data-fancybox-group="light">
                                <img class="img-fluid" src='../Upload/Gallery/<%# Eval("IMG") %>' alt="">
                            </a>
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="text-danger" Text="Delete" CommandName="IsDelete" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>

        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.js"></script>

    <script>
        $('.portfolio-menu ul li').click(function () {
            $('.portfolio-menu ul li').removeClass('active');
            $(this).addClass('active');

            var selector = $(this).attr('data-filter');
            $('.portfolio-item').isotope({
                filter: selector
            });
            return false;
        });
        $(document).ready(function () {
            var popup_btn = $('.popup-btn');
            popup_btn.magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        });
    </script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("[id*=ContentPlaceHolder1_fileGallery]").change(function () {
                if (typeof (FileReader) != "undefined") {
                    var dvPreview = $("#dvPreview");
                    dvPreview.html("");
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var img = $("<img />");
                                img.attr("style", "height:100px;width: 100px;margin-left:15px;");
                                img.attr("src", e.target.result);
                                dvPreview.append(img);
                            }
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            dvPreview.html("");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });
        });
    </script>
</asp:Content>
