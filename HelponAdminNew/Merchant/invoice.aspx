<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="HelponAdminNew.Merchant.invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <title>Helpon</title>

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .invoice-title h2, .invoice-title h3 {
            display: inline-block;
        }

        .table > tbody > tr > .no-line {
            border-top: none;
        }

        .table > thead > tr > .no-line {
            border-bottom: none;
        }

        .table > tbody > tr > .thick-line {
            border-top: 2px solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="rpData" runat="server" OnItemDataBound="rpData_ItemDataBound">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="invoice-title">
                                <h2>
                                    <img src="../Images/icon.jpg" style="width: 50px;" />
                                    Help on</h2>
                                <h3 class="pull-right">Order #<%# Eval("InvoiceNo") %></h3>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-xs-6">
                                    <address>
                                        <strong>Billed To:</strong><br>
                                        <b><%# Eval("ShopName") %></b><br>
                                        <%# Eval("MerchantAddress") %><br>
                                        Pin <%# Eval("Pincode") %> india<br>
                                        Phone. No. <%# Eval("Merchantmobile") %><br>
                                    </address>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <address>
                                        <strong>Shipped To:</strong><br>
                                        <b><%# Eval("CustomerName") %></b><br>
                                        <p style="margin: 0;"><%# Eval("ShippingAddress") %></p>

                                    </address>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <address>
                                        <strong>Payment Method:</strong>
                                        <b><%# Eval("PaymentMode") %></b>
                                        <%# Eval("TransactionNo") %>
                                    </address>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <address>
                                        <strong>Order Date:</strong><br>
                                        <%# Eval("AddDate") %><br>
                                        <br>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><strong>Order summary</strong></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-condensed">
                                            <thead>
                                                <tr>
                                                    <td><strong>Item</strong></td>
                                                    <td class="text-center"><strong>Price</strong></td>
                                                    <td class="text-center"><strong>Quantity</strong></td>
                                                    <td class="text-right"><strong>Total</strong></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="rpProduct" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("Name") %></td>
                                                            <td class="text-center"><%# Eval("Amount") %></td>
                                                            <td class="text-center"><%# Eval("Qty") %></td>
                                                            <td class="text-right"><%# Eval("NetAmount") %></td>
                                                        </tr>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <tr>
                                                    <td class="thick-line"></td>
                                                    <td class="thick-line"></td>
                                                    <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                                    <td class="thick-line text-right"><%# Eval("TotalAmount") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="no-line"></td>
                                                    <td class="no-line"></td>
                                                    <td class="no-line text-center"><strong>Discount</strong></td>
                                                    <td class="no-line text-right"><%# Eval("Discount") %></td>
                                                </tr>
                                                <tr>
                                                    <td class="no-line"></td>
                                                    <td class="no-line"></td>
                                                    <td class="no-line text-center"><strong>Total</strong></td>
                                                    <td class="no-line text-right"><%# Convert.ToDecimal(Eval("PaybleAmount"))>0?Eval("PaybleAmount"):Eval("TotalAmount") %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
