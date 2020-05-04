<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-12">
    <h1>Dashboard</h1>
    <hr />
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-aqua o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    
                </div>
                <h3><asp:Label ID="lblTotalInterview" runat="server"></asp:Label></h3>
                <div class="mr-5">Total Test</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Interview.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    
                </div>
                <h3><asp:Label ID="lblTotalQuestion" runat="server"></asp:Label></h3>
                <div class="mr-5">Total Questions</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Question.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-red o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">

                </div>
                <h3><asp:Label ID="lblTotalCandidates" runat="server"></asp:Label></h3>
                <div class="mr-5">Total Canidates</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="Candidatelist.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_Index_Warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_IndexWarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
