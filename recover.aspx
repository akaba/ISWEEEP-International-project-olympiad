<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recover.aspx.cs" Inherits="recover" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Recover Password</title>
   <style type="text/css">
	.hidden{display:none}
*{font:'trebuchet ms'}
a.menu{font:'trebuchet ms';padding:2px;color:#ffffff;display:block;text-decoration:none;border-bottom:1px dashed white}
a.menu:hover{background-color:#b5dc10;color:black;border-left:4px solid white}
</style>
</head>
<body style="margin: 0px; padding: 0px; background-color: #e3ead9">
    <form id="form1" runat="server">
        <div style="position: relative; margin: auto; background-color: #e3ead9">
        </div>
        <div id="top" style="text-align: center; font: 24pt 'trebuchet ms' black; z-index: 101; left: 0px; width: 100%; position: relative; top: 16px; height: 100px;
            background-color: #b5dc10; border: 2px solid #aaaabb">
            I-SWEEEP PROJECT REGISTRATION</div>
        <div id="menu" style="min-height: 500px; height: 100%; background-color: #e06a3b; border: 2px solid #aaaabb; padding: 5px; z-index: 99; left: 15px; width: 160px;
            position: absolute; top: 0px; padding-top: 130px;">
            <%--<a class="menu" href="Register.aspx">Register</a> <a class="menu" href="Login.aspx">Login</a> <a class="menu" href="recover.aspx">Forgot&nbsp; Password?</a>
       --%> </div>
        <div id="content" style="padding: 10px; font: 12pt 'trebuchet ms' black; z-index: 200; margin-left: 191px; padding-top: 30px; position: relative; right: 0px;
            height: auto">
            Enter the following information about your account and your password will be sent to your email address.<br />
        <br />
        First name: &nbsp; &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
        Last name: &nbsp; &nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
        Email Address:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send My Password" />
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Info.mdb" SelectCommand="SELECT [EmpNo], firstname, lastname,  sifre FROM [PersonalInfo] WHERE (([FirstName] = ?) AND ([LastName] = ?) AND ([email] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="" Name="FirstName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox2" Name="LastName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox3" Name="email" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
