<%@ Page Title="" Language="C#" MasterPageFile="~/Candidatemaster.Master" AutoEventWireup="true" CodeFile="Criteria.aspx.cs" Inherits="OnlineAptitudeTest.Criteria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <h2 class="m-4">All
        <asp:Label ID="lbl_criteriainterview" runat="server"></asp:Label>
    </h2>
    <hr />
    <div class="row">
        <asp:Repeater ID="gridview_criteriainterview" runat="server">
            <ItemTemplate>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header">
                            <h4>Test name:</h4>
                            <h3><%# Eval("interview_name") %></h3>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Interview discription: <%# Eval("interview_description") %></li>
                            <li class="list-group-item">Pass Marks: <%# Eval("interviewpass_marks") %></li>
                            <li class="list-group-item">Total Marks: <%# Eval("interview_marks") %></li>
                            <li class="list-group-item">
                                <asp:HyperLink ID="hlink_gotexam" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "~/Question.aspx?eid=" + Eval("interview_id")%>'>Take Test</asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_interviewshow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_interviewshowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
