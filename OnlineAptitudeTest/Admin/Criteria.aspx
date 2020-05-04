<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Criteria.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Criteria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelCriteriaList" runat="server" Text="Criteria List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelCriteriaList_Click" />
                <asp:Button ID="btn_panelAddCriteria" runat="server" Text="Add Criteria" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelAddCriteria_Click" />
            </div>
            <%--Add subject panel--%>
            <asp:Panel ID="panel_AddCriteria" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_category" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_category" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Criteria Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_criteria" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_criteria" runat="server" ErrorMessage="Enter Criteria" ControlToValidate="txt_criteria" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_AddCriteria" runat="server" Text="Add Criteria" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_AddCriteria_Click" />
                        </div>
                        <asp:Panel ID="panel_AddCriteria_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_AddCriteria_Warning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--category list panel--%>
            <asp:Panel ID="panel_CriteriaList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_CriteriaList" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="grdview_CriteriaList_RowCommand" AllowPaging="True" OnPageIndexChanging="grdview_CriteriaList_PageIndexChanging" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="criteria_name" HeaderText="Criteria Name" />
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" NullDisplayText="The criteria is under no category" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_EditCriteria" runat="server" CssClass="btn" BackColor="#3498db" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/EditCriteria.aspx?sid=" + Eval("criteria_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_DeleteCriteria" runat="server" CssClass="btn" BackColor="#e74c3c" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("criteria_id") %>' CommandName="DeleteRow">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no criteria added now. Add criteria
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>

                        <asp:Panel ID="panel_CriteriaList_Warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_CriteriaListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
