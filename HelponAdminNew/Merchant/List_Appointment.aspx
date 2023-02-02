<%@ Page Title="" Language="C#" MasterPageFile="~/Merchant/MerchantMaster.Master" AutoEventWireup="true" CodeBehind="List_Appointment.aspx.cs" Inherits="HelponAdminNew.Merchant.List_Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <label>From Date</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label>To Date</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:TextBox ID="txttoDate" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success mr-2" Text="Search &gt;&gt;" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="GvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField HeaderText="Name" DataField="Name" />
                        <asp:BoundField HeaderText="Mobile" DataField="Mobile" />
                        <asp:BoundField HeaderText="Email" DataField="Email" />
                        <asp:BoundField HeaderText="Appointments Time" DataField="AppointmentsTime" />
                        <asp:BoundField HeaderText="Appointments Date" DataField="AppointmentsDate" />
                        <asp:BoundField HeaderText="Submit Date" DataField="Date" />
                    </Columns>
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
