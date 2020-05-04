<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Editinterview.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Editinterview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class=" col-md-12">
        <div class="card">
            <%--Button For select edit--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelEditInterview" runat="server" Text="Edit Interview" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <%-- Edit exam --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Select Category</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_EditCategoryInterview" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_DrpeEitCategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_EditCategoryInterview" ForeColor="red" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Select Criteria</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_EditCriteriaInterview" runat="server" CssClass="form-control" DataTextField="criteria_name" DataValueField="criteria_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_EditCriteriaInterview" runat="server" ErrorMessage="You must select a Criteria" ControlToValidate="drp_EditCriteriaInterview" ForeColor="red" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editinterviewname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditInterviewName" runat="server" ErrorMessage="Enter interview name" ControlToValidate="txt_editinterviewname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Discription</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editinterviewdis" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Date</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editinterviewdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditInterviewDate" runat="server" ErrorMessage="Enter interview date" ControlToValidate="txt_editinterviewdate" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Duration(Minute)</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editinterviewduration" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editinterviewduration" runat="server" ErrorMessage="Enter interview duration" ControlToValidate="txt_editinterviewduration" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="requireregular_EditInterviewDuration" runat="server" ErrorMessage="Enter a valid time" ControlToValidate="txt_editinterviewduration" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Pass Marks</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editpassinterviewmarks" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditPassInterviewMark" runat="server" ErrorMessage="Enter interview marks" ControlToValidate="txt_editpassinterviewmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="requireregular_editpassinterviewmark" runat="server" ErrorMessage="Enter a valid marks" ControlToValidate="txt_editpassinterviewmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Interview Total Marks</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_editinterviewtotalmarks" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditInterviewMaTotalMarks" runat="server" ErrorMessage="Enter interview total marks" ControlToValidate="txt_editpassinterviewmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reg_EditInterviewMaTotalMarks" runat="server" ErrorMessage="Enter a valid marks" ControlToValidate="txt_editinterviewtotalmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_EditInterview" runat="server" Text="Edit Interview" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_EditInterview_Click"/>
                    </div>
                    <asp:Panel ID="panel_EditInterview_Warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_InterviewEditWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
