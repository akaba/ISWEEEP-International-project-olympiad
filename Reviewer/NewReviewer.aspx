<%@ Page Title="" Language="C#" MasterPageFile="~/Reviewer/reviewer.master" AutoEventWireup="true" CodeFile="NewReviewer.aspx.cs" Inherits="Reviewer_NewReviewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 144px;
        }
        .style3
        {
            width: 144px;
            height: 26px;
        }
        .style4
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
    <a class="menu" href="newReviewer.aspx">New reviewer</a> 
    <a class="menu" href="manageReviewers.aspx">Manage Reviewers</a>
    <br/> 
    <a class="menu" href="SelectProjects.aspx">Select Projects</a> 
     <a class="menu" href="projects.aspx">Review Projects</a> 
     <a class="menu" href="Logout.aspx">Log out</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        <b>New Reviewer</b></p>
    <table class="style1">
        <tr>
            <td class="style2">
                Full name:</td>
            <td>
                <asp:TextBox ID="txtFullname" runat="server" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFullname" ErrorMessage="required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Password:</td>
            <td>
                <asp:TextBox ID="txtpassw" runat="server" Width="91px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpassw" ErrorMessage="required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="189px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Affiliation:</td>
            <td>
                <asp:TextBox ID="txtAff" runat="server" Width="189px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Area:</td>
            <td>
                <asp:TextBox ID="txtArea" runat="server" Width="189px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Assign to country:</td>
            <td class="style4">
                <asp:DropDownList ID="ddCountry" runat="server" DataSourceID="countryDS" 
                    DataTextField="country" DataValueField="country" 
                    ondatabound="ddCountry_DataBound">
                </asp:DropDownList>
                <asp:AccessDataSource ID="countryDS" runat="server" 
                    DataFile="~/App_Data/isweeep.mdb" 
                    SelectCommand="SELECT [country] FROM [Countries]"></asp:AccessDataSource>
            </td>
        </tr>


        <tr>
            <td class="style2">
                Is reviewer admin?</td>
            <td>
                <asp:CheckBox ID="chkAdmin" runat="server" />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" />
    <asp:Label ID="labMessage" runat="server" Text=""></asp:Label><asp:Button ID="btnadd" runat="server" onclick="btnadd_Click" 
        Text="Add another reviewer" Visible="False" />
</asp:Content>

