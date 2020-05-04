﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="OnlineAptitudeTest.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login - Online Aptitude Test Sytem</title>
    <!-- Bootstrap core CSS-->
    <link href="vendor/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for login-->
    <link href="vendor/css/custom.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="_D3hj container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header bg-warning text-center font-weight-bold">Candidate Login</div>
            <div class="card-body">
                <form runat="server" id="formlogin">
                    <asp:Panel ID="pnl_warning" runat="server" Visible="false">
                    <div class="form-group card-header text-center">
                        <div class="alert-danger">
                        <asp:Label ID="lbl_warning" runat="server" Text="Label" CssClass="col-form-label text-center"></asp:Label>
                        </div>
                    </div>
                    </asp:Panel>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" placeholder="Enter email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqr_emil" runat="server" ErrorMessage="Enter email" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rqrexpre_email" runat="server" ErrorMessage="Enter validate email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqr_pass" runat="server" ErrorMessage="Enter password" ControlToValidate="txt_pass" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <label class="form-check-label">
                                <asp:CheckBox ID="chk_remember" runat="server" CssClass="form-check-input remembermecustom" />
                                Remember Password
                            </label>
                        </div>
                    </div>
                    <asp:Button ID="btn_login" runat="server" Text="Log In" CssClass="btn btn-primary btn-block" OnClick="btn_login_Click" />
                </form>
            </div>
        </div>
    </div>
</body>

</html>
