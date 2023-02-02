<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Manage_MyProfile.aspx.cs" Inherits="HelponAdminNew.Merchant.Manage_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-4">
            <div class="card" id="ProfileBg" runat="server">
                <div class="card-header">
                    <h5>Profile Photo <span class="fa fa-edit float-end" data-name="edit" id="btnEdit"></span></h5>
                </div>
                <div class="card-body text-center">
                    <div class="row">
                        <div class="col-md-12">
                            <img id="imgProfile" runat="server" style="width: 150px; height: 140px;" src="assets/img/user.jpg" alt="Admin">
                            <div class="d-none mt-2" id="divUpdateProfilePhoto">
                                <label style="font-size: 12px;">Max width 512 Px and height 512 Px and Size 100 KB</label>
                                <asp:FileUpload ID="fileProfileImg" runat="server" CssClass="form-control" />
                                <asp:TextBox ID="txtbgColor" runat="server" CssClass="form-control" TextMode="Color"></asp:TextBox>
                                <asp:Button ID="btnUpdateImg" runat="server" CssClass="btn btn-primary" Text="Update" OnCommand="btnUpdateImg_Command" CommandName="Profile" />
                            </div>
                        </div>
                        <div class="col-md-12 mt-3">
                            <label class="text-left">Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            <label class="text-left">Sub Category</label>
                            <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control mt-2"></asp:DropDownList>

                        </div>

                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5>Thumbnail Photo</h5>
                </div>
                <div class="card-body text-center">
                    <div class="row">
                        <div class="col-md-12">
                            <img id="imgThumbnail" runat="server" src="assets/img/user.jpg" alt="Admin" style="width: 230px; height: 175px;">

                            <label style="font-size: 12px;">Max width 512 Px and height 512 Px and Size 100 KB</label>
                            <asp:FileUpload ID="Filethumbnail" runat="server" CssClass="form-control" />
                            <asp:Button ID="btnUpdatethumbnail" runat="server" CssClass="btn btn-primary" Text="Update" OnCommand="btnUpdateImg_Command" CommandName="Thumbnail" />

                        </div>

                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5>Social Media</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <label><i class="fa fa-twitter"></i>Twitter</label>
                            <asp:TextBox ID="txtTwitter" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-instagram"></i>Instagram</label>
                            <asp:TextBox ID="txtInstagram" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-facebook"></i>Facebook</label>
                            <asp:TextBox ID="txtfacebook" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <label><i class="fa fa-chrome"></i>Web Site</label>
                            <asp:TextBox ID="txtwebsite" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5>Aminities/Service</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <asp:TextBox ID="txtAminities" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <button class="btn btn-success" id="btnSubmitAminities" type="button">Submit</button>
                        </div>
                    </div>
                    <br />
                    <ul style="list-style: none; padding: 0;" id="GetAminites">
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h5>Personal Details</h5>
                </div>
                <div class="card-body">
                    <div class="row">

                        <div class="col-md-6">
                            <label>Shop Name</label>
                            <asp:TextBox ID="txtshopname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Name</label>
                            <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Mobile</label>
                            <asp:TextBox ID="txtMobile" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Alternet Mobile</label>
                            <asp:TextBox ID="txtAlternetMobile" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Tel-Phone</label>
                            <asp:TextBox ID="txtTelphone" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Whatsapp Number</label>
                            <asp:TextBox ID="txtWhatsappnumber" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>User Id</label>
                            <asp:TextBox ID="txtuserid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="col-md-12">
                            <label>About us</label>
                            <asp:TextBox ID="txtAboutus" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5>Address</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <label>State</label>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>Tehsil</label>
                            <asp:DropDownList ID="ddlTehsil" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <label>City Name</label>
                            <asp:TextBox ID="txtCityname" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Pin code</label>
                            <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>

                    </div>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdate_Click" />
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <h5>Service Availablity</h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvserviceAvailbile" runat="server" ClientIDMode="Static" CssClass="" BorderStyle="None" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="WeekName" HeaderText="Week" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%# Eval("ID") %>' />
                                    <asp:LinkButton ID="lnkbtnstatus" runat="server" CssClass='<%# Eval("Status").ToString()=="ON"?"btn btn-success":"btn btn-danger" %>' Text='<%# Eval("Status") %>'></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Open Time">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOpenTime" runat="server" CssClass="form-control" Text='<%# Eval("Opentime") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Close Time">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCloseTime" runat="server" CssClass="form-control" Text='<%# Eval("Closetime") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnUpdateTime" runat="server" CssClass="btn btn-primary float-end" Text="Update" OnClick="btnUpdateTime_Click" />
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#gvserviceAvailbile').DataTable({
                dom: 'Blfrtip', destroy: true, paging: false, exportOptions: {
                     //stripHtml: false
                }
            });
        });
        $('#ContentPlaceHolder1_txtbgColor').on('change', function () {

            $("#ContentPlaceHolder1_ProfileBg").css("background", this.value);
        });
        $("#btnEdit").click(function () {
            var a = $(this).attr('data-name');
            if (a == 'edit') {
                $("#divUpdateProfilePhoto").removeClass('d-none');
                $("#btnEdit").removeClass('fa-edit');
                $("#btnEdit").addClass('fa-times');
                $("#btnEdit").removeAttr('data-name');
                $("#btnEdit").attr('data-name', 'not');
            }
            else {
                $("#divUpdateProfilePhoto").addClass('d-none');
                $("#btnEdit").removeClass('fa-times');
                $("#btnEdit").addClass('fa-edit');
                $("#btnEdit").removeAttr('data-name');
                $("#btnEdit").attr('data-name', 'edit');
            }
        });
    </script>
    <script type="text/javascript">  
        function GetAminites() {
            $.ajax({
                type: "POST",
                url: "Manage_MyProfile.aspx/GetAminities",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (d) {
                    $("#GetAminites").html('');
                    $("#GetAminites").html(d.d);
                    $("#<%=txtAminities.ClientID%>")[0].value = "";
                        $(".btnDelete").each(function () {
                            $(this).click(function () {
                                var id = $(this).attr('data-id');
                                $.ajax({
                                    type: "POST",
                                    url: "Manage_MyProfile.aspx/DeleteAminities",
                                    data: '{id: "' + id + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (d) {
                                        GetAminites();
                                    },
                                    failure: function (response) {
                                        alert(response.d);
                                    }
                                });
                            });
                        });
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
        }
        GetAminites();
        $("#btnSubmitAminities").click(function () {
            $.ajax({
                type: "POST",
                url: "Manage_MyProfile.aspx/AddAminities",
                data: '{name: "' + $("#<%=txtAminities.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (d) {
                        GetAminites();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            });
        
        
    </script>
</asp:Content>
