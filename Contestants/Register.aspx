<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
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
            if (dd.value == "UNITED STATES") {
                tr.Selected = true;
                tr.style.display = "";
            }
            else {tr.style.display = "none";}

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
<body onload="javascript:toggle()">
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
            <b>PROJECT REGISTRATION</b><br />
            Please, note that the email address provided here will be used for communication
            with the contestant(s).
            <br />
            A confirmation email will be sent to the email address with your <b>project code</b>
            and login information.<br />
            <br />
            <b>Please enter the information below to get your project code:</b><br />
            <table>
                <tr>
                    <td>
                        Project Title:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTitle" runat="server" Width="500px" MaxLength="255"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle"
                            ErrorMessage="Required" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Country:
                    </td>
                    <td>
                        <asp:DropDownList onchange="javascript:toggle()" ID="ddCountry" class="chosen-select" runat="server" DataSourceID="AccessDataSource2"
                            DataTextField="country" DataValueField="country" OnDataBound="ddCountry_DataBound">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
                            SelectCommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:AccessDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddCountry"
                            Display="Dynamic" ErrorMessage="Required" InitialValue="Select Country" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                
                <tr id="stateTR" style="display: none">
                    <td>
                        State (if in USA):
                    </td>
                    <td>
                        <asp:DropDownList ID="ddState" runat="server">
                            <asp:ListItem Value="Select State">Select State</asp:ListItem>
                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                            <asp:ListItem Value="CA">California</asp:ListItem>
                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                            <asp:ListItem Value="NY">New York</asp:ListItem>
                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                </tr>
                   
                <tr>
                    <td>
                        Contact Email Address:
                    </td>
                    <td style="width: 168px">
                        <asp:TextBox ID="txtEmail" runat="server" Width="193px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Font-Size="Small"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Required" Font-Size="Small"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
                SelectCommand="SELECT [pid], [Title], [sifre], [Email] FROM [Projects]"></asp:AccessDataSource>
     </div>
        <br style="clear: both;">
<script type="text/javascript">
                      var config = {
                          '.chosen-select': {},
                          '.chosen-select-deselect': { allow_single_deselect: true },
                          '.chosen-select-no-single': { disable_search_threshold: 10 },
                          '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
                          '.chosen-select-width': { width: "95%" }
                      }
                      for (var selector in config) {
                          $(selector).chosen(config[selector]);
                      }
  </script>
        </form>
    </div>
    <div id="bot">
    </div>
</body>
</html>
