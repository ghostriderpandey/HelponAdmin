<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Buy_Product.aspx.cs" Inherits="HelponAdminNew.Merchant.Buy_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .productname {
            display: block;
            white-space: nowrap;
            width: 12em;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btnAdd_Click" OnClientClick="Startloader();" />
            <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed  table-striped ProductDataTablefilter" AutoGenerateColumns="false"  Width="100%" ShowHeaderWhenEmpty="false">
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
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
                            <asp:HiddenField ID="hdnCID" runat="server" Value='<%#Eval("CID") %>' />
                            <asp:HiddenField ID="hdnSCID" runat="server" Value='<%#Eval("SCID") %>' />
                            <asp:HiddenField ID="hdnProductName" runat="server" Value='<%#Eval("ProductName") %>' />
                            <asp:HiddenField ID="hdnMRP" runat="server" Value='<%#Eval("MRP") %>' />
                            <asp:HiddenField ID="hdnPrice" runat="server" Value='<%#Eval("Price") %>' />
                            <asp:HiddenField ID="hdnAbout" runat="server" Value='<%#Eval("About") %>' />
                            <asp:HiddenField ID="hdnIMG1" runat="server" Value='<%#Eval("IMG1") %>' />
                            <asp:HiddenField ID="hdnIGST" runat="server" Value='<%#Eval("IGST") %>' />
                            <asp:HiddenField ID="hdnSGST" runat="server" Value='<%#Eval("SGST") %>' />
                            <asp:HiddenField ID="hdnCGST" runat="server" Value='<%#Eval("CGST") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# Eval("IMG1") %>' style="width: 100px;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate>
                            <label><%# Eval("ProductName") %></label>
                            <br />
                            <label>Mrp : <%# Eval("MRP") %></label>
                            <br />
                            <label>Price : <%# Eval("Price") %></label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="About" HeaderText="About" />

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
                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
            </asp:GridView>
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
