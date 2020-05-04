<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EditCriteria.aspx.cs" Inherits="OnlineAptitudeTest.Admin.EditCriteria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class=" col-md-12">
        <div class="card">
         <%--Button For edit subject slect--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelCriteriaList" runat="server" Text="Edit Subject" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_categoryedit" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_categoryedit" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Criteria Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_criteriaedit" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_criteria" runat="server" ErrorMessage="Enter subject" ControlToValidate="txt_criteriaedit" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_EditCriteria" runat="server" Text="Edit Criteria" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_EditCriteria_Click" />
                        </div>
                        <asp:Panel ID="panel_EditCriteria_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_EditCriteria_Warning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
