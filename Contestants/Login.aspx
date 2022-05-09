<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contestant Login Page</title>
	<link rel="shortcut icon" href="favicon.ico?v=1" type="image/x-icon" />
    <link href='../isweeep.css' rel='stylesheet' type='text/css' />
    <link href="../chosen.css"  rel='stylesheet' type='text/css' />
    <link href="../bootstrap.min.css"  rel='stylesheet' type='text/css' />
     <script  src="../Scripts/jquery-2.1.0.min.js" type="text/javascript"></script>  
    <script src="../Scripts/chosen.jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function toggle() {
            //alert("changed");
            var tr = document.getElementById("stateTR");
            var dd = document.getElementById("ddCountry");
            if (dd.value == "UNITED STATES")
                tr.style.display = "";
            else tr.style.display = "none";

        }
    </script>
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
            <li><a class="menu" href="Register.aspx">Register</a></li>
            <li><a class="menu" href="Login.aspx">Login</a></li>
            </ul>
        </div>
        <div id="contentDiv">
        <b>PROJECT LOGIN<br />
        </b>
        <br />
        Please enter the following information to login:<br />
       
                    <table>
                        <tr>
                            <td>
                                Project Contact Email:
                            </td>
                            <td class="style6">
                                <asp:TextBox ID="TextBox2" runat="server" Width="167px" CausesValidation="True"></asp:TextBox>

                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="Required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Project Code:
                            </td>
               
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" Width="87px" CausesValidation="True"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login"  />

        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [pid], [ProjectCode], [Email], [Status], [ApplicationType],[continuation],[riskformdata],[country],[RegionalName], [State]  FROM [Projects] WHERE ([ProjectCode] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="ProjectCode" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
       </div>
        <br style="clear: both;" />
        </form>
    </div>
    <div id="bot">
    </div>
</body>
</html>
