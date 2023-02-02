<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="Manage_WebColor.aspx.cs" Inherits="HelponAdminNew.AP.Manage_WebColor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowUpdating="GvData_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Background and Font Color">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-6">
                                        <label>Font Color</label>

                                    </div>
                                    <div class="col-6">
                                        <asp:TextBox ID="txtColor" runat="server" TextMode="Color" data-id='<%# Eval("ID") %>' CssClass="fontcolor" Text='<%# Eval("Color")%>'></asp:TextBox>

                                    </div>
                                    <div class="col-6">
                                        <label>Background Color</label>
                                    </div>
                                    <div class="col-6">
                                        <asp:TextBox ID="txtBgColor" runat="server" TextMode="Color" data-id='<%# Eval("ID") %>' CssClass="bgcolor" Text='<%# Eval("BgColor")%>'></asp:TextBox>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Preview">
                            <ItemTemplate>
                                <div style='display:flex;justify-content:center;align-items:center; width: 100px; height: 50px; border: 1px solid black;background:<%# Eval("BgColor")%>' id='bgColor_<%# Eval("ID") %>'>
                                    <p style='text-align:center;font-weight:bold;color:<%# Eval("Color")%>' id='fontsColor_<%# Eval("ID") %>'>Font Color</p>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-primary" Text="Update" CommandName="IsUpdate" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('Are you sure you want to Update this ?');"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="16px"></HeaderStyle>
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
    <script>
        $(".bgcolor").each(function () {
            $(this).on('change', function () {
                $("#bgColor_" + $(this).attr('data-id')).css("background", $(this).val());
            });
        });
        $(".fontcolor").each(function () {
            $(this).on('change', function () {
                $("#fontsColor_" + $(this).attr('data-id')).css("color", $(this).val());
            });
        });
    </script>
</asp:Content>
