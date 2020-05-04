<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Interviewdetails.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Interviewdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For edit--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_DetailsInterview" runat="server" Text="Details Criteria" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <%-- For showing the details --%>
                    <div class="table table-responsive">
                        <asp:DetailsView ID="Interview_Details" runat="server" Height="50px" GridLines="None" CssClass="table table-bordered" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField DataField="category_name" HeaderText="Category" NullDisplayText="The interview is not under any category">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="criteria_name" HeaderText="Criteria" NullDisplayText="The interview is not under any criteria">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interview_name" HeaderText="Interview Name">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interview_description" HeaderText="Interview Discription" NullDisplayText="No Discription">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interview_date" HeaderText="Interview Date" DataFormatString="{0:d}">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interview_duration" HeaderText="Interview Duration">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interviewpass_marks" HeaderText="Interview Pass Marks">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                                <asp:BoundField DataField="interview_marks" HeaderText="Total Marks" NullDisplayText="No total marks">
                                    <HeaderStyle Font-Bold="true" CssClass="col-md-2" />
                                </asp:BoundField>
                            </Fields>
                            <FooterTemplate>
                            <asp:Button ID="btn_CackInterview" runat="server" Text="Back TO Interview" CssClass="btn btn-info" BackColor="#3498db" BorderStyle="None" ForeColor="White" PostBackUrl="~/Admin/Interview.aspx"/>
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
