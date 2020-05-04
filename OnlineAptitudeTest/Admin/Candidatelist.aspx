<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Candidatelist.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Candidatelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelresult" runat="server" Text="All Candidates" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#222" />
            </div>
            <div class="card text-center mb-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gridAllCandidates" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gridAllCandidates_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="candidate_fname" HeaderText="First Name" />
                                <asp:BoundField DataField="candidate_lname" HeaderText="Last nName" />
                                <asp:BoundField DataField="candidate_fathername" HeaderText="Father Name" />
                                <asp:BoundField DataField="candidate_nicnumber" HeaderText="NIC Number" />
                                <asp:BoundField DataField="candidate_email" HeaderText="Email" />
                                <asp:BoundField DataField="candidate_gender" HeaderText="Gender" />
                                <asp:BoundField DataField="candidate_dob" HeaderText="Date of Birth" />
                                <asp:BoundField DataField="candidate_address" HeaderText="Address" />
                                <asp:BoundField DataField="candidate_city" HeaderText="City" />
                                <asp:BoundField DataField="candidate_country" HeaderText="Country" />
                                <asp:BoundField DataField="candidate_number" HeaderText="Mobile Number" />
                                <asp:BoundField DataField="candidate_eduname" HeaderText="Education" />
                                <asp:BoundField DataField="candidate_eduuniversity" HeaderText="High School/University" />
                                <asp:BoundField DataField="candidate_eduaddress" HeaderText="Address" />
                                <asp:BoundField DataField="candidate_eduphone" HeaderText="Phone Number" />
                                <asp:BoundField DataField="candidate_edudgree" HeaderText="Degree/Certificate" />
                                <asp:BoundField DataField="candidate_edusdate" HeaderText="Start Date" />
                                <asp:BoundField DataField="candidate_eduedate" HeaderText="End Date" />
                                <asp:BoundField DataField="candidate_comname" HeaderText="Company Name" />
                                <asp:BoundField DataField="candidate_comaddress" HeaderText="Company Address" />
                                <asp:BoundField DataField="candidate_comjob" HeaderText="Job Title" />
                                <asp:BoundField DataField="candidate_comexp" HeaderText="Job Experience" />
                                <asp:BoundField DataField="candidate_comsdate" HeaderText="Start Date" />
                                <asp:BoundField DataField="candidate_comedate" HeaderText="End Date" />
                                <asp:TemplateField HeaderText="Result">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="btn_viewquestion" runat="server" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/Admin/Result.aspx?uid=" + Eval("candidate_email") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> View Result
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="panel_CandidateListShow_Warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_CandidateListShowWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
