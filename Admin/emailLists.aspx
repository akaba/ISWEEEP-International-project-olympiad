<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="emailLists.aspx.cs" Inherits="Admin_emailLists" Title="Email List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>table tr td input{background-color:transparent;border:0px ;border-bottom:1px solid blue;cursor:pointer;margin:0px;padding:0px}</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
<table>
<tr>
<td valign=top>
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        Text="Judge Email List" />
    <br />
    <br />
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
        Text="All Project Supervisor Emails"  />
    <br />
    <br />
     <br />
    <br />
    <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
        Text="ALL Logged in Projects' Emails (Status is NOT Null)"  />
   
    <br />
    <br />
    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
        Text="Qualified Projects' Supervisor Emails"  />
    <br />
    <br />
	<asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
        Text="Qualified Projects' Email List"  />
    <br />
    <br />
	<asp:Button ID="Button6" runat="server" onclick="Button6_Click" 
        Text="Not Qualified Projects' Email List"  />
    <br />
    <br />
</td>

<td valign=top>
 <asp:TextBox ID="txtList" runat="server" Height="305px" Rows="20" 
        TextMode="MultiLine" Width="600px"></asp:TextBox>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
</td>
</tr>
</table>


    
   
</asp:Content>

