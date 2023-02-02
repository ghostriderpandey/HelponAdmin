<%@ Page Title="" Language="C#" MasterPageFile="~/AP/Admin.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="HelponAdminNew.AP.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="form-group row">
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
                            <label>Mobile</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                                <asp:TextBox ID="txtSearchMobile" runat="server" CssClass="form-control" type="number"></asp:TextBox>
                            </div>
                        </div>
                         <div class="col-md-3">
                            <label>Status</label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ti-user"></i></span>
                                </div>
                               <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                   <asp:ListItem Value="">--Select--</asp:ListItem>
                                   <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                   <asp:ListItem Value="Active">Active</asp:ListItem>
                                   
                               </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success mr-2 mt-2" Text="Search" OnClick="btnSearch_Click" />
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary mt-2" data-toggle="modal" data-target="#exampleModal">
                                Add New User
                            </button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <asp:GridView ID="gvData" runat="server" CssClass="table table-bordered table-condensed table-hover table-striped" Width="100%" ShowHeaderWhenEmpty="True" AutoGenerateColumns="false" OnRowCommand="gvData_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr. No.">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Status">
                           <ItemTemplate>
                               <label class='<%# Eval("Status").ToString()=="Approved"?"label label-success":Eval("Status").ToString()=="Rejected"?"label label-danger":"label label-primary" %>'><%# Eval("Status") %></label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="UnderName" HeaderText="UnderID" />
                        <asp:BoundField DataField="Type" HeaderText="UserType" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Password" HeaderText="Password" />
                        <asp:BoundField DataField="AddDate" HeaderText="DOJ" />
                        <asp:TemplateField HeaderText="Active">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnActive" runat="server" CommandName="IsActive" CommandArgument='<%# Eval("UID") %>'><img src='../Images/icon/<%# Eval("IsApprove").ToString().ToUpper()=="TRUE"?"IsActive.png":"IsDeactive.png" %>' /></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                 <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="IsDelete" CommandArgument='<%# Eval("UID") %>' Text="Delete" CssClass="btn btn-danger" OnClientClick="return confirm('Are you sure you want to delete ?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View">
                            <ItemTemplate>
                                <a href='Manage_UserDetail.aspx?id=<%# Eval("UID") %>' class="btn btn-primary">View</a>
                            </ItemTemplate>
                        </asp:TemplateField>
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

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add New User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label>User Type</label>
                            <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEmployeeType" runat="server" ControlToValidate="ddlUserType" Display="Dynamic" ErrorMessage="Please Select User Type !" SetFocusOnError="True"
                                ValidationGroup="v" InitialValue="0"><img src="../Images/icon/Warning.png"/></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <label>Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmployeeName" runat="server" ControlToValidate="txtFullName" Display="Dynamic" ErrorMessage="Please Enter Full Name !" SetFocusOnError="True" ValidationGroup="v"><img src="../Images/icon/Warning.png"/></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <label>Mobile</label>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Number" MaxLength="10"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Please Enter Mobile No !" SetFocusOnError="True" ValidationGroup="v"><img src="../Images/icon/Warning.png"/></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <label>State</label>
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlState" Display="Dynamic" ErrorMessage="Please Select State !" SetFocusOnError="True"
                                ValidationGroup="v" InitialValue="0"><img src="../Images/icon/Warning.png"/></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-12">
                            <asp:ValidationSummary ID="ValidationSummary" runat="server" ClientIDMode="Static"
                                ValidationGroup="v" ForeColor="Red" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="v" />
                </div>
            </div>
        </div>
    </div>
    <script>
        function fnn() {
            $('#<%= gvData.ClientID%>').prepend($("<thead></thead>").append($("#<%= gvData.ClientID%>").find("tr:first"))).DataTable({
                "responsive": true,
                "dom": 'Bfrtip',
                "buttons": ['copy', 'excel', 'csv', 'pdf', 'print', 'pageLength'],
                "pageLength": 10,
                "aLengthMenu": [[10, 25, 50, 100, 200, -1],
                [10, 25, 50, 100, 200, "All"]
                ],
            });
        }
    </script></asp:Content>
