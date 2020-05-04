<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Addcandidate.aspx.cs" Inherits="OnlineAptitudeTest.Admin.Addcandidate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
     <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-warning">
                <asp:Button ID="btn_panelAddCandidate" runat="server" Text="Add Candidate" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#000222" />
            </div>
            <%--Add category --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">First Name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candifname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandidateFName" runat="server" ErrorMessage="Enter first name" ControlToValidate="txt_candifname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Last Name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candilname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandidateLName" runat="server" ErrorMessage="Enter last name" ControlToValidate="txt_candilname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Father Name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candifathername" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandidateFatherName" runat="server" ErrorMessage="Enter father name" ControlToValidate="txt_candifathername" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">NIC Number</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candinicnumber" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandidateNICNmuber" runat="server" ErrorMessage="Enter nic number" ControlToValidate="txt_candinicnumber" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Email</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiemail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandidateEmail" runat="server" ErrorMessage="Enter email" ControlToValidate="txt_candiemail" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candipass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiPass" runat="server" ErrorMessage="Enter password" ControlToValidate="txt_candipass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Re-peat password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candipassrpeat" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiPassRepeat" runat="server" ErrorMessage="Re-peat password" ControlToValidate="txt_candipassrpeat" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="reqcompre_CandiPassRepeat" runat="server" ErrorMessage="Password don't match" ControlToValidate="txt_candipassrpeat" ControlToCompare="txt_candipass" ForeColor="Red" ></asp:CompareValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Gender</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candigender" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiGender" runat="server" ErrorMessage="Enter gender" ControlToValidate="txt_candigender" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Date of Birth</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candidob" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiDob" runat="server" ErrorMessage="Enter date of birth" ControlToValidate="txt_candidob" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Address</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiaddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiAddress" runat="server" ErrorMessage="Enter address" ControlToValidate="txt_candiaddress" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">City</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicity" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiCity" runat="server" ErrorMessage="Enter city" ControlToValidate="txt_candicity" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Country</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicountry" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiCountry" runat="server" ErrorMessage="Enter Country" ControlToValidate="txt_candicountry" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Mobile Number</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candinumber" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiMobile" runat="server" ErrorMessage="Enter mobile number" ControlToValidate="txt_candinumber" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Education</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiedu" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiEducation" runat="server" ErrorMessage="Enter education" ControlToValidate="txt_candiedu" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">High School / University</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiuni" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiUni" runat="server" ErrorMessage="Enter high school/university" ControlToValidate="txt_candiuni" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">High School / University Address</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiuniadd" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_UniAddress" runat="server" ErrorMessage="Enter address" ControlToValidate="txt_candiuniadd" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Phone Number</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candieduphone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_UniPhone" runat="server" ErrorMessage="Enter Phone Number" ControlToValidate="txt_candieduphone" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Degree / Certificate</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiedudgree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_UniDegree" runat="server" ErrorMessage="Enter degree" ControlToValidate="txt_candiedudgree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Start Date</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candiedusdate" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_UniStartDate" runat="server" ErrorMessage="Enter start date" ControlToValidate="txt_candiedusdate" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">End Date</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candieduedate" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_UniEndDate" runat="server" ErrorMessage="Enter end date" ControlToValidate="txt_candieduedate" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Company name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CompanyName" runat="server" ErrorMessage="Enter company name" ControlToValidate="txt_candicomname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Company Address</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomaddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CompanyAddress" runat="server" ErrorMessage="Enter company address" ControlToValidate="txt_candicomaddress" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Job Title</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomjob" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiJobTitle" runat="server" ErrorMessage="Enter job title" ControlToValidate="txt_candicomjob" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Job Experience</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomexp" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_CandiJobExperience" runat="server" ErrorMessage="Enter job experience" ControlToValidate="txt_candicomexp" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Start Date</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomsdate" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_JobStartDate" runat="server" ErrorMessage="Enter start date" ControlToValidate="txt_candicomsdate" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">End Date</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_candicomedate" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_JobEndDate" runat="server" ErrorMessage="Enter start date" ControlToValidate="txt_candicomedate" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_AddCandidate" runat="server" Text="Add Candidate" CssClass="btn" BackColor="#82e0aa" BorderStyle="None" ForeColor="White" OnClick="btn_AddCandidate_Click" />
                    </div>
                    <asp:Panel ID="panel_AddCandidate_Warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_AddCandidateWarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
