<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="ProductAssgin.aspx.cs" Inherits="HelponAdminNew.AP.ProductAssgin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

     
    <div class="card">
        <div class="card-body">
            <asp:Button ID="btnUpdateAll" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateAll_Click" OnClientClick="return confirm('Are you sure you want to Update All ?');" />
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="select">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAllApproved" onclick="selectCheckBoxesgvApproved(this)" runat="server" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkrow" runat="server" />
                                <asp:HiddenField ID="hdnid" runat="server" Value='<%#Eval("ID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <img src='<%# Eval("IMG1") %>' style="width: 100px;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product" HeaderStyle-Width="100px">
                            <ItemTemplate>
                                <label><%# Eval("Productname") %></label>
                                <br />
                                <label class="label label-primary"><%# Eval("Categoryname") %></label>
                                <label class="label label-primary"><%# Eval("SubCategoryName") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MRP">
                            <ItemTemplate>
                                <asp:Label ID="txtMrp" runat="server" CssClass="form-control" Text='<%# Eval("Mrp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="txtPrice" runat="server" CssClass="form-control" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:Label ID="txtStock" runat="server" CssClass="form-control" Text='<%# Eval("Stock") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="IGST" DataField="IGST" SortExpression="IGST" />
                        <asp:BoundField HeaderText="SGST" DataField="SGST" SortExpression="SGST" />
                        <asp:BoundField HeaderText="CGST" DataField="CGST" SortExpression="CGST" />

                        <asp:BoundField HeaderText="Description" DataField="About" SortExpression="About" />

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

    <!-- Modal -->

    <script>
        function fnn() {
            $('#<%= GvData.ClientID%>').prepend($("<thead></thead>").append($("#<%= GvData.ClientID%>").find("tr:first"))).DataTable({
                "responsive": true,
                "dom": 'Bfrtip',
                "buttons": ['copy', 'excel', 'csv', 'pdf', 'print', 'pageLength'],
                "pageLength": 10,
                "aLengthMenu": [[10, 25, 50, 100, 200, -1],
                [10, 25, 50, 100, 200, "All"]
                ],
            });
        }
        function StockUpdateModel() {
            $('#StockUpdateModel').modal('show');
        }
    </script>
</asp:Content>
