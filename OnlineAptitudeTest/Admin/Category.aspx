<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelCategoryList" runat="server" Text="Category List" CssClass="btn btn-info" OnClick="btn_panelCategoryList_Click" BorderStyle="None" CausesValidation="False" />
                <asp:Button ID="btn_panelAddCategory" runat="server" Text="Add Category" CssClass="btn btn-info" OnClick="btn_panelAddCategory_Click" BorderStyle="None" CausesValidation="False" />
            </div>
            <%--Add category panel--%>
            <asp:Panel ID="panel_AddCategory" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Category Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_category" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_category" runat="server" ErrorMessage="Enter category" ControlToValidate="txt_category" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_AddCategory" runat="server" Text="Add Category" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_AddCategory_Click" />
                        </div>
                        <asp:Panel ID="panel_AddCategory_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_CategoryAddWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--category list panel--%>
            <asp:Panel ID="panel_categorylist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_CategoryList" runat="server" CssClass="table table-bordered" GridLines="None" AutoGenerateColumns="False" OnRowCommand="grdview_CategoryList_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="grdview_CategoryList_PageIndexChanging">                              
                                 <Columns>
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" >
                                     <HeaderStyle CssClass="card-header" />
                                     </asp:BoundField>
                                    <asp:TemplateField HeaderText="Options">
                                        <HeaderStyle CssClass="card-header" />
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_EditCategoryx" runat="server" CssClass="btn" BackColor=" #3498db" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/EditCategory.aspx?cid=" + Eval("category_id")%>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_DeleteCategory" runat="server" CssClass="btn" BackColor=" #e74c3c" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("category_id") %>' CommandName="delete_category">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no category right now. Create now
                                </EmptyDataTemplate>
                                 <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="panel_CategoryList_Warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_CategoryListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
