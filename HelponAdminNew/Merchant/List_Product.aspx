<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="List_Product.aspx.cs" Inherits="HelponAdminNew.Merchant.List_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <label>Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <label>Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <%--  <div class="col-md-4">
                    <label>Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="Approved">Approved</asp:ListItem>
                        <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                    </asp:DropDownList>
                </div>--%>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <asp:Button ID="btnUpdateAll" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateAll_Click" OnClientClick="return confirm('Are you sure you want to Update All ?');" />
            <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this ?');" />
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowDeleting="GvData_RowDeleting" OnRowEditing="GvData_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <label class='<%# Eval("status").ToString().ToUpper()=="Approved".ToUpper()?"alert alert-success":Eval("status").ToString().ToUpper()=="Rejected".ToUpper()?"alert alert-danger":"alert alert-primary" %>'><%# Eval("Status") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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
                                <asp:TextBox ID="txtMrp" runat="server" CssClass="form-control" Text='<%# Eval("Mrp") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Text='<%# Eval("Price") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Text='<%# Eval("Stock") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="Stock">
                            <ItemTemplate>
                                <label>Available Stock : <%# Eval("Stock") %></label>
                                <br />
                                <asp:LinkButton ID="lnkbtnstock" runat="server" CssClass="text-primary" CommandName="UpdateStock" CommandArgument='<%# Eval("ID") %>' Text="Update Stock" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField HeaderText="IGST" DataField="IGST" SortExpression="IGST" />
                        <asp:BoundField HeaderText="SGST" DataField="SGST" SortExpression="SGST" />
                        <asp:BoundField HeaderText="CGST" DataField="CGST" SortExpression="CGST" />

                        <asp:BoundField HeaderText="Description" DataField="About" SortExpression="About" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <a href='Manage_Product.aspx?id=<%# Eval("ID") %>' target="_blank" class="btn btn-primary mb-1">Edit</a>
                                <%--<asp:LinkButton ID="lnkbtnActive" runat="server" CssClass='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"btn btn-success":"btn btn-danger" %>' Text='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"Active":"In-Active" %>' CommandName="IsActive" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>--%>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' OnClientClick="if (!confirm('Are you sure you want to delete ? ')) return false;" Text="Delete"></asp:LinkButton>

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
  
    <!-- Modal -->
    <div class="modal fade" id="StockUpdateModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Update Stock</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label>Stock Type</label>
                    <asp:DropDownList ID="ddlStockType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem Value="IN">IN</asp:ListItem>
                        <asp:ListItem Value="OUT">OUT</asp:ListItem>
                    </asp:DropDownList>
                    <label>Stock Qty</label>
                    <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnUpdateStock" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateStock_Click" />
                </div>
            </div>
        </div>
    </div>
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
