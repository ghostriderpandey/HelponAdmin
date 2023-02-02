<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="View_MerchantProduct.aspx.cs" Inherits="HelponAdminNew.AP.View_MerchantProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="loading-overlay">
                <div class="wrapper">
                    <div class="ajax-loader-outer">
                    </div>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                        <div class="col-md-4">
                            <label>Merchant</label>
                            <asp:DropDownList ID="ddlMerchant" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlMerchant_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="">--Select--</asp:ListItem>
                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                     <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this ?');"  />
                    <div class="table-responsive m-t-40">
                        <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand">
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
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <%-- <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" Text="Edit" CommandName="IsChange" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>--%>
                                        <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"btn btn-success":"btn btn-danger" %>' Text='<%# Eval("IsActive").ToString().ToUpper()=="true".ToUpper()?"Active":"In-Active" %>' Style="width: 100%;" CommandName="IsActive" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnApprove" runat="server" CssClass="btn btn-primary mt-2 w-100" Text="Approve" CommandArgument='<%# Eval("ID") %>' CommandName="IsApprove" Visible='<%# Eval("Status").ToString().ToUpper()!="Pending".ToUpper()?false:true %>'></asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnReject" runat="server" CssClass="btn btn-danger mt-2 w-100" Text="Reject" CommandArgument='<%# Eval("ID") %>' CommandName="IsReject" Visible='<%# Eval("Status").ToString().ToUpper()!="Pending".ToUpper()?false:true %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="16px"></HeaderStyle>
                                </asp:TemplateField>

                                <%-- <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <label class='<%# Eval("status").ToString().ToUpper()=="Approved".ToUpper()?"alert alert-success":Eval("status").ToString().ToUpper()=="Rejected".ToUpper()?"alert alert-danger":"alert alert-primary" %>'><%# Eval("Status") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <img src='../Upload/Product/Small/<%# Eval("IMG1") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Merchant">
                                    <ItemTemplate>
                                        <label><%# Eval("ShopName") %></label>
                                        <br />
                                        <label><%# Eval("MerchantName") %></label>
                                        <br />
                                        <label><%# Eval("Mobile") %></label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product">
                                    <ItemTemplate>
                                        <label><%# Eval("Productname") %></label>
                                        <br />
                                        <label class="label label-primary"><%# Eval("Categoryname") %></label>
                                        <label class="label label-primary"><%# Eval("SubCategoryName") %></label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="MRP" DataField="MRP" SortExpression="MRP" />
                                <asp:BoundField HeaderText="Price" DataField="Price" SortExpression="Price" />
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
            </script>
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
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
