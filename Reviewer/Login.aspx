<%@ Page Title="" Language="C#" MasterPageFile="~/Reviewer/reviewer.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Reviewer_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 117px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
    Thank you for helping us review projects.</p>
<p>
    Please login below using the access code sent to you by I-SWEEEP:<br />
    <asp:Panel ID="panle1" DefaultButton="Button1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                Access Code:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
</p>
</asp:Content>

