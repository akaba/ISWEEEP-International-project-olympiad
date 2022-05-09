<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectInformation.aspx.cs"
    Inherits="Admin_ProjectInformation" Title="Details Page" %>

<%@ Register TagPrefix="user" TagName="ProjectDetails" Src="ProjectDetails.ascx" %>
<html>
<body style="background-color:#21C9E1;font-family:Trebuchet MS;font-size:10pt;text-align:center">
    <form runat="server" id="form1">
    <user:ProjectDetails ID="WebUserControl0" runat="server"></user:ProjectDetails>
    </form>
</body>
</html>
