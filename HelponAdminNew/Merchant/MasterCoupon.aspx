<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="MasterCoupon.aspx.cs" Inherits="HelponAdminNew.Merchant.Master_Coupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .couponBox {
            float: left !important;
            width: 260px;
            height: 141px;
            background-color: #e24c79;
            color: #fff;
            font-family: 'Libre Baskerville';
            text-transform: uppercase;
            padding: 10px;
            position: relative;
            border-radius: 15px;
            border: 2px dashed;
        }

        .couponValid {
            margin: 0;
            text-align: center;
            font-weight: 600;
            font-size: 11px;
            font-family: 'Libre Baskerville';
        }

        .Discount {
            font-size: 3rem;
            font-weight: bold;
            position: absolute;
            left: 0;
            top: 6px;
        }

        .Percentage {
            margin: 0;
            padding: 0;
            position: absolute;
            font-weight: bold;
            left: 80px;
            top: 10px;
            font-size: 2.5rem;
        }

        .off {
            font-weight: bold;
            font-size: 15px;
            position: absolute;
            left: 80px;
            top: 50px;
        }

        .nameofDiscount {
            font-size: 14px;
            position: absolute;
            right: 0;
            top: 15px;
            font-weight: bold;
            width: 100px;
            text-align: left;
        }

        .promocode {
            margin: 0;
            text-align: center;
            font-weight: 600;
            font-size: 11px;
            font-family: 'Libre Baskerville';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
        }

        .code {
            background-color: #663543;
            display: inline;
            padding: 0;
            font-size: 9px;
            letter-spacing: 1px;
            font-weight: normal;
            padding-left: 10px;
            padding-right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="card-body">
            <div class="form-group row">
                <div class="col-md-4">
                    <label>Template</label>
                    <asp:DropDownList ID="ddltemplatetype" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddltemplatetype_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddltemplatetype"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Business Name</label>
                    <asp:TextBox ID="txtbusinessname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtbusinessname"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Festival Name</label>
                    <asp:TextBox ID="txtfestivalname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfestivalname"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Product Name</label>
                    <asp:TextBox ID="txtproductname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtproductname"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Product Image</label>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="ti-user"></i></span>
                        </div>
                        <asp:FileUpload ID="uploader" runat="server" CssClass="form-control" accept=".png,.jpg,.jpeg,.gif" />
                    </div>
                </div>
                <div class="col-md-4">
                    <label>Discount</label>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlType"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-2">
                    <label>Amount </label>
                    <asp:TextBox ID="txtamount" runat="server" onkeypress="return isDecimalNumberKey(event);" Text="0.00" MaxLength="6" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtamount"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-2">
                    <label>Coupons Code </label>
                    <asp:TextBox ID="txtcoupancode" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label>Expire Date</label>
                    <asp:TextBox ID="txtExpireDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtExpireDate"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Text Color</label>
                    <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" TextMode="Color"></asp:TextBox>
                </div>
                <div class="col-md-12">
                    <label>Remark</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnSubmit" runat="server" ValidationGroup="Save" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
                <div class="row">
                    <div runat="server" id="divcoupon" visible="false">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowEditing="GvData_RowEditing" OnRowDeleting="GvData_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Coupon">
                            <ItemTemplate>
                                <label><%# Eval("Name") %>-<%# Eval("Discount") %></label>
                                <br />
                                <label class="alert alert-success text-uppercase"><%# Eval("CouponsCode") %></label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Description" DataField="Remark" SortExpression="Remark" />
                        <asp:BoundField HeaderText="ExpiryDate" DataField="Expiry" SortExpression="Expiry" />
                        <asp:BoundField HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary" CommandName="IsChange" CommandArgument='<%# Eval("CID") %>'><i class="fa fa-edit "></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("CID") %>' CommandName="IsDelete" OnClientClick="return confirm('Are you sure you want to delete this ?');"><i class="fa fa-trash"></i></asp:LinkButton>
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
        $("#ContentPlaceHolder1_ddlctype").change(function () {
            var type = $(this).val().replace(" ", "");
            $("#Coupon").css("background-image", type);
        });
        $("#ContentPlaceHolder1_txtColor").change(function () {
            var type = $(this).val().replace(" ", "");
            $("#Coupon").css("color", type);
        });
    </script>
</asp:Content>
