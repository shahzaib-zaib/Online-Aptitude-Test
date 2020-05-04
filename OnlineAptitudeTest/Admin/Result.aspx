<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_PanelResult" runat="server" Text="All result" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <div class="card text-center mb-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gridViewSpecific" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" Visible="false" OnPageIndexChanging="gridViewSpecific_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="User email" />
                                <asp:BoundField DataField="interview_name" HeaderText="Interview Name" NullDisplayText="no interview name" />
                                <asp:BoundField DataField="interview_date" DataFormatString="{0:M/d/yy}" HeaderText="Interview Date" NullDisplayText="No date" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
                                <asp:BoundField DataField="result_status" HeaderText="Result" />
                                <asp:BoundField DataField="interview_marks" HeaderText="Total Marks" />
                                <asp:BoundField DataField="result_score" HeaderText="Your Score" />
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="gridResult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" PageSize="8" OnPageIndexChanging="gridResult_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="user_email" HeaderText="User email" />
                                <asp:BoundField DataField="interview_name" HeaderText="Interview Name" NullDisplayText="no interview name" />
                                <asp:BoundField DataField="interview_date" DataFormatString="{0:M/d/yy}" HeaderText="Interview Date" NullDisplayText="No date" />
                                <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
                                <asp:BoundField DataField="result_status" HeaderText="Result" />
                                <asp:BoundField DataField="interview_marks" HeaderText="Total Marks" />
                                <asp:BoundField DataField="result_score" HeaderText="Your Score" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Panel ID="panel_ResultShow_Warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_ResultShowWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
