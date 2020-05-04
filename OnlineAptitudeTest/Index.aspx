﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Candidatemaster.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="OnlineAptitudeTest.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="server">
    <h2 class="my-4">Category</h2>
    <hr />
    <!-- Category Section -->
    <div class="row">
        <asp:Repeater ID="gridview_categorylist" runat="server">
            <ItemTemplate>
                <div class="col-lg-4 mb-3">
                    <div class="card h-100 text-center">
                        <h4 class="card-header"><%# Eval("category_name") %></h4>
                        <div class="card-footer">
                            <asp:HyperLink ID="btn_category" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "~/Category.aspx?cid=" +  Eval("category_id") %>'>Go to Criteria</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_categoryshow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_categoryshowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
