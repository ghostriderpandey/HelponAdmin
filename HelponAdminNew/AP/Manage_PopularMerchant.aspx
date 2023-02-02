<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_PopularMerchant.aspx.cs" Inherits="HelponAdminNew.AP.Manage_PopularMerchant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card">
        <div class="card-body">
            <div class="row">

                <div class="col-md-3">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                </div>
                <div class="col-md-3">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <label>Popular Category</label>
                    <asp:DropDownList ID="ddlPopularCategory" runat="server" CssClass="form-control" ></asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-striped" AutoGenerateColumns="false" AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="false">
                    <Columns>

                        <asp:TemplateField HeaderText="select">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAllApproved" onclick="selectCheckBoxesgvApproved(this)" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkrow" runat="server" />
                                <asp:HiddenField ID="hdnid" runat="server" Value='<%#Eval("MID") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Thumbnail Photo" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='<%# Eval("ThumbnailIMG")  %>' style="width: 100px;" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Profile Photo" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <img src='<%# Eval("ProfileIMG")  %>' style="width: 100px;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Shopname" HeaderText="ShopName" />
                        <asp:BoundField DataField="name" HeaderText="Name" />

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
        function selectCheckBoxesgvApproved(chk) {
            var grid = document.getElementById('<%=GvData.ClientID %>');
            var arrCheckList = grid.getElementsByTagName('input');
            var count = 0;
            for (var i = 0; i < arrCheckList.length; i++) {
                if (arrCheckList[i].type == 'checkbox') {
                    arrCheckList[i].checked = chk.checked;
                }
            }
        }
    </script>
</asp:Content>
