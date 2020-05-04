<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Editcategory.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Editcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelCategoryList" runat="server" Text="Edit Category" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <%--Add category --%>
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Category Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_categoryedit" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_category" runat="server" ErrorMessage="Enter category" ControlToValidate="txt_categoryedit" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_EditCategory" runat="server" Text="Edit Category" CssClass="btn" BackColor="#3498db" BorderStyle="None" ForeColor="White" OnClick="btn_EditCategory_Click"/>
                        </div>
                        <asp:Panel ID="panel_EditCategory_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_CategoryEditWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
