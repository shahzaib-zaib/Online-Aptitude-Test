﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Candidatemaster.Master" AutoEventWireup="true" CodeFile="Myresult.aspx.cs" Inherits="OnlineAptitudeTest.Myresult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <div class="card-header">
        <h2>My Result</h2>
    </div>
    <asp:TextBox ID="getemail" runat="server" Visible ="false"></asp:TextBox>
    <asp:GridView ID="gridmyresult" runat="server" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered" OnPageIndexChanging="gridmyresult_PageIndexChanging" PageSize="8">
        <Columns>
            <asp:BoundField DataField="interview_name" HeaderText="Interview Name" NullDisplayText="no interview name"/>
            <asp:BoundField DataField="interview_date" DataFormatString="{0:M/d/yy}" HeaderText="Exam Date" NullDisplayText="There is some problem to find exam date" />
            <asp:BoundField DataField="totalquestion" HeaderText="Total Question" />
            <asp:BoundField DataField="result_status" HeaderText="Result" />
            <asp:BoundField DataField="interview_marks" HeaderText="Total Marks" />
            <asp:BoundField DataField="result_score" HeaderText="Your Score" />
        </Columns>
    </asp:GridView>
        <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_myresultshow_warning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lbl_myresultshowwarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
