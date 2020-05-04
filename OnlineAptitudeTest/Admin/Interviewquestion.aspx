<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Interviewquestion.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Interviewquestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select edit--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelInterviewQuestion" runat="server" Text="Interview Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
        </div>
        <div class="card text-center mb-3">
            <div class="card-body">
                <%-- Examquestion list --%>
                <div class="table-responsive">
                    <asp:GridView ID="gridview_InterviewQuestion" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gridview_InterviewQuestion_PageIndexChanging" OnRowCommand="gridview_InterviewQuestion_RowCommand" PageSize="5">
                        <Columns>
                            <asp:TemplateField HeaderText="Interview Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("interview_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Question">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("question_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Options">
                                <ItemTemplate>
                                    <asp:HyperLink ID="btn_DetailsInterview" runat="server" CssClass="btn" BackColor="#f1c40f" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/DetailinterviewQuestion.aspx?eid=" + Eval("interview_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="btn_EditInterview" runat="server" CssClass="btn" BackColor="#3498db" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Editquestion.aspx?qid=" + Eval("question_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                    </asp:HyperLink>
                                    <asp:LinkButton ID="btn_DeleteInterview" runat="server" CssClass="btn" BackColor="#e74c3c" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("question_id") %>' CommandName="deleteinterviewquestion">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            There is no question. Add question
                        </EmptyDataTemplate>
                        <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
                <asp:Panel ID="panel_InterviewQuestion_Warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_InterviewQuestionWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
