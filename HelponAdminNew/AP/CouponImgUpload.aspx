<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="CouponImgUpload.aspx.cs" Inherits="HelponAdminNew.AP.CouponImgUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="form-group">
                <div class="row">

                    <div class="col-md-6">
                        <label>Slider (width 350px and Height 250px and 100-500 KB)</label>
                        <div class="input-group mb-3">
                            <asp:FileUpload ID="ImgUpload" runat="server" CssClass="form-control" accept=".png,.jpg,.jpeg,.gif" />
                        </div>
                    </div>
                    <div class="col-md-12 mt-2">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success mt-4" Text="Submit" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="gvData" runat="server" CssClass="table-bordered table-condensed table-hover table-striped" AutoGenerateColumns="false"
                    AllowPaging="false" Width="100%" ShowHeaderWhenEmpty="true" OnRowCommand="gvData_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Coupon Image" HeaderStyle-Width="500px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblimgname" Text='<%# Eval("ImgName") %>' Visible="false"></asp:Label>
                                <img src='<%# Eval("ImgNamepath") %>' width="120" height="80" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="IsDelete" CommandArgument='<%# Eval("ImgId") %>' CssClass="btn btn-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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
