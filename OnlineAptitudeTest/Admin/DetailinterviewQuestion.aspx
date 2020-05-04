<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="DetailinterviewQuestion.aspx.cs" Inherits="OnlineAptitudeTest.Admin.DetailinterviewQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For edit--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_DetailsInterviewQuestion" runat="server" Text="Details Interview Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <%-- For showing the details --%>
                    <div class="table table-responsive">
                        <asp:DetailsView ID="gridview_InterviewDetails" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="interview_description" HeaderText="Interview Discription" NullDisplayText="No Discription">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="question_name" HeaderText="Question">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_one" HeaderText="Option One">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_two" HeaderText="Option Two">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_three" HeaderText="Option three">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="option_four" HeaderText="Option four">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                                <asp:BoundField DataField="question_answer" HeaderText="Correct answer">
                                    <HeaderStyle Font-Bold="true" CssClass="" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                                <asp:Button ID="btn_BackQuestion" runat="server" Text="Back TO Question" CssClass="btn btn-info" BackColor="#3498db" BorderStyle="None" ForeColor="White" PostBackUrl="~/Admin/Question.aspx" />
                            </FooterTemplate>
                            <HeaderStyle CssClass="text-center" />
                        </asp:DetailsView>
                        <asp:Panel ID="panel_InterviewDetails_Warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_InterviewDetailsWarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
