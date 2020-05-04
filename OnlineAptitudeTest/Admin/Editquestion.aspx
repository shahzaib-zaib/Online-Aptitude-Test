<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Editquestion.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Editquestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select add question for exam--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelEditQuestion" runat="server" Text="Edit Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Select Interview</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_EditInterview" runat="server" CssClass="form-control" DataTextField="interview_name" DataValueField="interview_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_EditInterview" runat="server" ErrorMessage="You must select a interview" ControlToValidate="drp_EditInterview" ForeColor="red" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Qusetion Name</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editquestionname" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditQuestionName" runat="server" ErrorMessage="Enter interview name" ControlToValidate="txt_editquestionname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option A</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptionone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditOp1" runat="server" ErrorMessage="Enter option one" ControlToValidate="txt_editoptionone" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option B</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptiontwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditOp2" runat="server" ErrorMessage="Enter option two" ControlToValidate="txt_editoptiontwo" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option C</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_edtoptionthree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditOp3" runat="server" ErrorMessage="Enter option three" ControlToValidate="txt_edtoptionthree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option D</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptionfour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_EditOp4" runat="server" ErrorMessage="Enter option four" ControlToValidate="txt_editoptionfour" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                <label class="col-md-2 col-form-label text-center">Correct Answer</label>
                    <div class="col-md-4">
                        <asp:RadioButtonList ID="rdo_EditCorrectAnswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                            <asp:ListItem Text="A" Value=1></asp:ListItem>
                            <asp:ListItem Text="B" Value=2></asp:ListItem>
                            <asp:ListItem Text="C" Value=3></asp:ListItem>
                            <asp:ListItem Text="D" Value=4></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="req_rdo_EditCorrectAnswer" runat="server" ErrorMessage="Select a correct answer" ControlToValidate="rdo_EditCorrectAnswer" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
            </div>
                <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_EditQuestion" runat="server" Text="Edit Question" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_EditQuestion_Click"/>
                        </div>
                        <asp:Panel ID="panel_EditQuestion_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_EditQuestionWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
            </div>          
        </div>
    </div>
</asp:Content>
