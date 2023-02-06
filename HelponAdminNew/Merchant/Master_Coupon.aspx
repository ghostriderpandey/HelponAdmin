<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="Master_Coupon.aspx.cs" Inherits="HelponAdminNew.Merchant.Master_Coupon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .couponBox {
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
                    <label>Title</label>
                    <asp:TextBox ID="txttitle" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txttitle"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Coupon Type</label>
                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control"></asp:DropDownList>

                   <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlType"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"  InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Discount</label>
                    <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control" Text="0.00" MaxLength="6"></asp:TextBox>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9"  runat="server" ControlToValidate="txtDiscount"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Expire Date</label>
                    <asp:TextBox ID="txtExpireDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                     <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="txtExpireDate"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <label>Background Color</label>
                    <asp:TextBox ID="txtBgColor" runat="server" CssClass="form-control" TextMode="Color"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <label>Text Color</label>
                    <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" TextMode="Color"></asp:TextBox>
                </div>
                <div class="col-md-12">
                    <label>Term & Condition</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                      <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3"  runat="server" ControlToValidate="txtDescription"
                        ErrorMessage="This field is required .!" ForeColor="Red" Style="font-size: 13px !important;"
                        SetFocusOnError="true" ValidationGroup="Save"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-3">
                    <br />
                    <asp:Button ID="btnSubmit" ValidationGroup="Save" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
                <div class="col-md-9">

                    <div class="couponBox CopiedCouponCode" id="Coupon">
                        <p class="couponValid">valid <span id="spnExpireDate">29 OCT 2022</span></p>
                        <label style="text-align: center; font-family: cursive;">
                            <span style="font-family: 'circularstd'; text-transform: capitalize; font-size: 30px;">Rs.</span>
                            <span style="font-size: 3rem;">5000</span><span style="font-size: 19px;">Flat Discount</span></label>
                        <p class="promocode">Promo code: <span class="code">FLAT123456</span></p>
                    </div>
                </div>
                 
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="GvData_RowCommand" OnRowEditing="GvData_RowEditing" OnRowDeleting="GvData_RowDeleting">
                    <columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <itemtemplate>
                                <%#Container.DataItemIndex+1 %>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Coupon">
                            <itemtemplate>
                                <label><%# Eval("Name") %>-<%# Eval("Discount") %></label>
                                <br />
                                <label class="alert alert-success text-uppercase"><%# Eval("CouponsCode") %></label>
                            </itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Description" DataField="Description" SortExpression="Description" />
                        <asp:BoundField HeaderText="ExpireDate" DataField="ExpireDate" SortExpression="ExpireDate" />
                        <asp:BoundField HeaderText="AddDate" DataField="AddDate" SortExpression="AddDate" />
                        <asp:TemplateField HeaderText="Action">
                            <itemtemplate>
                                <asp:LinkButton ID="lnkbtnEdit" runat="server" CssClass="btn btn-primary"  CommandName="IsChange" CommandArgument='<%# Eval("ID") %>'><i class="fas fa-edit" aria-hidden="true"></i></asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CssClass="btn btn-danger"  CommandArgument='<%# Eval("ID") %>' CommandName="IsDelete" OnClientClick="return confirm('Are you sure you want to delete this ?');"><i class="fa fa-trash" aria-hidden="true"></i></asp:LinkButton>
                            </itemtemplate>
                            <headerstyle width="16px"></headerstyle>
                        </asp:TemplateField>
                    </columns>
                    <emptydatatemplate>
                        <div class="EmptyDataTemplate">
                            No Record Found !
                        </div>
                    </emptydatatemplate>
                    <rowstyle cssclass="RowStyle" />
                    <pagerstyle cssclass="PagerStyle" />
                    <headerstyle cssclass="HeaderStyle" />
                    <alternatingrowstyle cssclass="AltRowStyle" />
                    <pagersettings position="Bottom" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <script>
        $("#ContentPlaceHolder1_txtBgColor").change(function () {
            var type = $(this).val().replace(" ", "");
            $("#Coupon").css("background-color", type);
        });
        $("#ContentPlaceHolder1_txtColor").change(function () {
            var type = $(this).val().replace(" ", "");
            $("#Coupon").css("color", type);
        });
    </script>
</asp:Content>
