<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Parents_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ISWEEEP Parent Login</title>
    <link href='../isweeep.css' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="top">
        <%--<div id="header">Project Registration</div>--%>
    </div>
    <div id="content">
        <form id="form1" runat="server">
        
        <div id="contentDiv">
            <h3>Parent Login</h3>
            Please enter the following information to login:<br /><br />
            <table class="style1">
                <tr>
                    <td class="style2">
                        Parent&#39;s
                        Email Address:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtParentEmail" runat="server" Width="142px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtParentEmail"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Contestant firstname:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtChildFirstName" runat="server" Width="142px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtChildFirstName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Contestant lastname:</td>
                    <td class="style3">
                        <asp:TextBox ID="txtChildLastName" runat="server" Width="142px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtChildLastName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Contestant&#39;s Project Code: 
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtProjectCode" runat="server" TextMode="Password" Width="142px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProjectCode"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button Visible="true" ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
            <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
                SelectCommand="SELECT Projects.pid, Projects.ProjectCode,ContestantID, firstname, lastname, parentEmail, CodeOfConduct, MediaRelease FROM [Contestants] inner join projects on contestants.pid = projects.pid WHERE Projects.ProjectCode = ? and Contestants.firstname = ? and Contestants.lastname=? and Contestants.ParentEmail=?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtProjectCode" Name="ProjectCode" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtChildFirstName" Name="firstname" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtChildLastName" Name="lastname" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtParentEmail" Name="ParentEmail" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
            <br />
           
        </div>
        <br style="clear: both;">
        </form>
    </div>
    <div id="bot">
    </div>
</body>
</html>
