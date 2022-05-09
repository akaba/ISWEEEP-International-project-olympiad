<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdultSVRegister.aspx.cs"
    Inherits="AdultSVRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adult Supervisor Registration Page</title>
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
    <style type="text/css">
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 28px;
        }
        .style4
        {
            width: 169px;
        }
        .style5
        {
            height: 28px;
            width: 169px;
        }
        .style6
        {
            height: 26px;
            width: 169px;
        }
        
        .style7
        {
            width: 270px;
        }
        .style8
        {
            height: 28px;
            width: 270px;
        }
        .style9
        {
            height: 26px;
            width: 270px;
        }
    </style>
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
            <table>
                <tr>
                    <td colspan="3">
                        <b>Adult Supervisor Registration<br />
                        </b>
                        <br />
                        Please fill the following form to register as an adult supervisor.
                        <br />
                        You will receive a password via e-mail. Please, check your e-mail address after
                        you submit the information below.
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Firstname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>*
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Lastname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>*
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Email Address:
                    </td>
                    <td class="style3">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>*
                    </td>
                    <td class="style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Confirm Email Address:
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtEmail2" runat="server" ></asp:TextBox>*
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtEmail2"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail2"
                            Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
                SelectCommand="SELECT [ASVemail], [ASVName], [ASVLastName] FROM [AdultSupervisors] WHERE ([ASVemail] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" Name="ASVemail" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
        </div>
        <br style="clear: both;">
        </form>
    </div>
    <div id="bot">
    </div>
</body>
</html>
