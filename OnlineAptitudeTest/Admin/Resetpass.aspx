<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Resetpass.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Resetpass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_PanelReste" runat="server" Text="Reset Password" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <%--Add category --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Present Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_admipresentpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_AdmiPresentPass" runat="server" ErrorMessage="Enter admin name" ControlToValidate="txt_admipresentpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">New Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminewpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_AdminNewPass" runat="server" ErrorMessage="Enter new password" ControlToValidate="txt_adminewpass" ForeColor="red" Display="Dynamic" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Re-peat password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminnewpassrpeat" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_AdminPassRepeat" runat="server" ErrorMessage="Re-peat password" ControlToValidate="txt_adminnewpassrpeat" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="reqcompre_AdminPassRepeat" runat="server" ErrorMessage="Password don't match" ControlToValidate="txt_adminnewpassrpeat" ControlToCompare="txt_adminewpass" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_ResetPass" runat="server" Text="Reset Password" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_ResetPass_Click" />
                    </div>
                    <asp:Panel ID="panel_ResetPass_Warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_ResetPassWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
