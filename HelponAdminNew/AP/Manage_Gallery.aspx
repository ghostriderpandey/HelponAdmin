<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_Gallery.aspx.cs" Inherits="HelponAdminNew.AP.Manage_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../jquery_Package/jquery-ui.css" rel="stylesheet" />
    <script src="../jquery_Package/jquery-ui.js"></script>
    <link href="../jquery_Package/jquery-ui.structure.css" rel="stylesheet" />
    <link href="../jquery_Package/jquery-ui.theme.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-group row">
                        <div class="col-md-3">
                            <label>From Date</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:FileUpload ID="uploader" runat="server" AllowMultiple="true" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-3">
                            <br />
                            <input type="button" id="btnUpload" class="btn btn-success" value="Upload Now" />
                        </div>
                        <div class="col-md-6">
                            <div style="width: 500px">
                                <div id="progress-bar" style="position: relative; display: none">
                                    <span id="progressbar-label" style="position: absolute; left: 30%; top: 20%;">Please Wait...</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" id="GalleryStr">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">  
            function GetGallery() {
                var progressbarLabel = $('#progressbar-label');
                var progressbarDiv = $('#progress-bar');
                $.ajax
                    ({
                        type: "POST",
                        url: "Manage_Gallery.aspx/GetGallery",
                        data: '{name: "Hello" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            progressbarLabel.text('loaded Successfully');
                            progressbarDiv.fadeOut(2000);
                            $("#GalleryStr").html('');
                            $("#GalleryStr").html(data.d);
                            $(".btndelete").each(function () {
                                $(this).click(function () {
                                    var id = $(this).attr('data-id');
                                    var img = $(this).attr('data-img');

                                    var progressbarLabel = $('#progressbar-label');
                                    var progressbarDiv = $('#progress-bar');
                                    $.ajax
                                        ({
                                            type: "POST",
                                            url: "Manage_Gallery.aspx/DeleteGallery",
                                            data: '{id:"' + id + '",name: "' + img + '" }',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            success: function (data) {
                                                progressbarLabel.text('Deleted Successfully');
                                                progressbarDiv.fadeOut(2000);
                                                GetGallery();
                                            },
                                            error: function (err) {
                                                progressbarLabel.text(err.statusText);
                                            }
                                        });
                                    progressbarLabel.text('Deleting ...');
                                    progressbarDiv.progressbar({
                                        value: false
                                    }).fadeIn(1000);
                                });
                            });
                        },
                        error: function (err) {

                            progressbarLabel.text(err.statusText);
                        }
                    });
                progressbarLabel.text('Please Wait Getting Photos ...');
                progressbarDiv.progressbar({
                    value: false
                }).fadeIn(1000);

            }
            $('#btnUpload').click(function (event) {
                var uploadedFiles = $('#ContentPlaceHolder1_uploader')[0].files;
                if (uploadedFiles.length > 0) {
                    var formData = new FormData();
                    for (var i = 0; i < uploadedFiles.length; i++) {
                        formData.append(uploadedFiles[i].name, uploadedFiles[i]);
                    }
                }
                var progressbarLabel = $('#progressbar-label');
                var progressbarDiv = $('#progress-bar');
                $.ajax
                    ({
                        url: '../Handler.ashx',
                        method: 'post',
                        contentType: false,
                        processData: false,
                        data: formData,
                        success: function () {
                            progressbarLabel.text('Uploaded Successfully');
                            progressbarDiv.fadeOut(2000);
                            GetGallery();
                        },
                        error: function (err) {
                            alert(err.statusText);
                        }
                    });
                progressbarLabel.text('Please Wait...');
                progressbarDiv.progressbar({
                    value: false
                }).fadeIn(1000);
            });
       
        GetGallery();
    </script>
</asp:Content>
