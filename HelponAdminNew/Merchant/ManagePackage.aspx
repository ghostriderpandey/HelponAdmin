<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="ManagePackage.aspx.cs" Inherits="HelponAdminNew.Merchant.ManagePackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
    <div class="row">
        <div class="row card-deck mb-3 text-center">
            <asp:Repeater runat="server" ID="rdt">
                <ItemTemplate>
                    <div class="col-4">
                        <div class="card mb-4 box-shadow">
                            <div class="card-header">
                                <h4 class="my-0 font-weight-normal"><%# Eval("Name") %></h4>
                            </div>
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title">
                                    <label class="label label-primary"><%# Eval("Amount") %></label>
                                    <small class="text-muted">/ yearly</small></h1>
                                <ul class="list-unstyled mt-3 mb-4">
                                    <li>Business Name =><span style="color:red"> <%# Eval("IsBusinessName") %></span></li>
                                    <li>Contact Person Name =><span style="color:red"> <%# Eval("IsPersonalName") %></span></li>
                                    <li>Video Clip =><span style="color:red"> <%# Eval("Video") %></span></li>
                                    <li>Coupon Facility =><span style="color:red"> <%# Eval("IsCoupons") %></span></li>
                                    <li>
                                        <asp:TemplateField HeaderText="Buy Now">
                                            <itemtemplate>
                                                <a class="fancybox fancybox.iframe" data-toggle="tooltip" data-placement="bottom" title="View Package Details" style="font-weight: bold" href='<%#"PackageDetails.aspx?Id="+ Eval("PackageID").ToString()%>' target="_blank">More...</i>
                                                </a>
                                            </itemtemplate>
                                            <headerstyle width="16px"></headerstyle>
                                        </asp:TemplateField>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-lg btn-block btn-outline-primary"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Buy Now</button>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <link rel="stylesheet" type="text/css" href="../AdminJs/fancybox/css/jquery.fancybox.css" />
    <script src="../AdminJs/fancybox/js/jquery.fancybox.js"></script>
    <script type="text/javascript">
        $(".fancybox").fancybox({});
    </script>

    
</asp:Content>
