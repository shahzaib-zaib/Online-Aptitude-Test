<%@ Page Title="" Language="C#" MasterPageFile="~/Candidatemaster.Master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="OnlineAptitudeTest.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <h2 class="m-4 mb-5">
            All <asp:Label ID="lbl_categoryscriteria" runat="server"></asp:Label> Aptitude Test</h2>
        <hr />
    <div class="row">
                <asp:Repeater ID="gridview_categoryitem" runat="server">
            <ItemTemplate>
                <div class="col-lg-4 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header"><%# Eval("criteria_name") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btn_category" runat="server" CssClass="btn btn-success" ForeColor="White" NavigateUrl='<%# "~/Criteria.aspx?sid=" +  Eval("criteria_id") %>'>Go to Test</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_scriteriashow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_scriteriashowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
