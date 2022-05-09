<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdultSVLogin.aspx.cs" Inherits="AdultSVLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Adult Supervisor Login Page</title>
    <link href='../isweeep.css' rel='stylesheet' type='text/css' />

    <link rel="shortcut icon" href="favicon.ico?v=1" type="image/x-icon" />   
  
    <link href="../bootstrap.min.css"  rel='stylesheet' type='text/css' />
     <script  src="../Scripts/jquery-2.1.0.min.js" type="text/javascript"></script>  
    <script src="../Scripts/chosen.jquery.min.js" type="text/javascript"></script>

         <script type="text/javascript">
             //<![CDATA[ 
             $(document).ready(function () {
                 var url = $(location).attr('href');
                 url = url.substr(url.lastIndexOf('/') + 1);
                 $('li:has(a[href="' + url + '"])').addClass('active');
             });


             //]]>
    </script> 

</head>
<body>
    <div id="top">
        <%--<div id="header">Project Registration</div>--%>
    </div>
    <div id="content">
        <form id="form1" runat="server">

        <div id="menuDiv">
            <ul class="nav navbar-nav">  
            <li><a class="menu" href="AdultSVRegister.aspx">Register</a></li>
            <li><a class="menu" href="AdultSVLogin.aspx">Login</a></li>
            </ul>
        </div>

        <div id="contentDiv">
            <h3>Adult Supervisor Login</h3>
            Please enter the following information to login:<br />
            <table class="style1">
                <tr>
                    <td class="style2">
                        Email Address:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        Password:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtpsw" runat="server" TextMode="Password" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpsw"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button Visible="true" ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
            <asp:Label ID="lblMessage" Text="" runat="server" ForeColor="Red"></asp:Label>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
                SelectCommand="SELECT * FROM [AdultSupervisors] WHERE (([ASVemail] = ?) AND ([sifre] = ?))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" Name="ASVemail" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtpsw" Name="sifre" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
            <br />
            <br />
            Forgot password?
            <br />
            Please check your email address, or send an email to <a href="mailto:info@isweeep.org">
                info@isweeep.org</a>.
        </div>
        <br style="clear: both;">
        </form>
    </div>
    <div id="bot">
    </div>
</body>
</html>
