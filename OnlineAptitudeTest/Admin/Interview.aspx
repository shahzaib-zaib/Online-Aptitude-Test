<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Interview.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Interview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelInterviewList" runat="server" Text="Test List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelInterviewList_Click" />
                <asp:Button ID="btn_panelAddInterview" runat="server" Text="Add Test" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelAddInterview_Click" />
            </div>
            <%--Add exam panel--%>
            <asp:Panel ID="panel_AddInterview" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_CategoryInterview" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_DrpCategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_CategoryInterview" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Criteria</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_CriteriaInterview" runat="server" CssClass="form-control" DataTextField="criteria_name" DataValueField="criteria_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_CriteriaInterview" runat="server" ErrorMessage="You must select a criteria" ControlToValidate="drp_CriteriaInterview" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_interviewname" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_InterviewName" runat="server" ErrorMessage="Enter interview name" ControlToValidate="txt_interviewname" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Discription</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_interviewdis" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Date</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_interviewdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_InterviewDate" runat="server" ErrorMessage="Enter interview date" ControlToValidate="txt_interviewdate" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Duration(Minute)</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_interviewduration" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_InterviewDuration" runat="server" ErrorMessage="Enter interview duration" ControlToValidate="txt_interviewduration" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="requireregular_InterviewDuration" runat="server" ErrorMessage="Enter a valid time" ControlToValidate="txt_interviewduration" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Pass Marks</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_interviewpassmarks" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_InterviewPassMark" runat="server" ErrorMessage="Enter interview pass marks" ControlToValidate="txt_interviewpassmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="requireregular_InterviewPassMark" runat="server" ErrorMessage="Enter a valid marks" ControlToValidate="txt_interviewpassmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Test Total Marks</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_interviewmatotalmarks" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_InterviewMaTotal" runat="server" ErrorMessage="Enter total marks" ControlToValidate="txt_interviewmatotalmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rege_InterviewMaTotal" runat="server" ErrorMessage="Enter a valid total marks" ControlToValidate="txt_interviewmatotalmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_AddInterview" runat="server" Text="Add Interview" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_AddInterview_Click" />
                        </div>
                        <asp:Panel ID="panel_AddInterview_Warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_InterviewAddWarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--exam list panel--%>
            <asp:Panel ID="panel_InterviewList" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_InterviewList" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="grdview_InterviewList_RowCommand" AllowPaging="True" OnPageIndexChanging="grdview_InterviewList_PageIndexChanging" PageSize="5">

                                <Columns>
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" />
                                    <asp:BoundField DataField="criteria_name" HeaderText="Criteria Name" />
                                    <asp:BoundField DataField="interview_name" HeaderText="Test Name" />
                                    <asp:BoundField DataField="interview_date" HeaderText="Test Date" DataFormatString="{0:d}" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_DetailsInterview" runat="server" CssClass="btn" BackColor="#f1c40f" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Interviewdetails.aspx?eid=" + Eval("interview_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="btn_EditInterview" runat="server" CssClass="btn" BackColor="#3498db" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Editinterview.aspx?eid=" + Eval("interview_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_DeleteInterview" runat="server" CssClass="btn" BackColor="#e74c3c" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("interview_id") %>' CommandName="deleteexam">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                            <asp:HyperLink ID="btn_AddQuestion" runat="server" CssClass="btn" BackColor=" #2ecc71" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Addquestion.aspx?eid=" + Eval("interview_id") %>'>
                                            <i class="fa fa-plus" aria-hidden="true"></i> Add Question
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="btn_ViewQuestion" runat="server" CssClass="btn" BackColor="#76d7c4" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Interviewquestion.aspx?eid=" + Eval("interview_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> View Question
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no interview added now. Add interview
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>

                        </div>
                        <asp:Panel ID="panel_InterviewList_Warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_InterviewListWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
