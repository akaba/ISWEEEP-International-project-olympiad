<%@ Page Language="C#" AutoEventWireup="true" CodeFile="donate.aspx.cs" Inherits="Donations_donate" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Donate to I-SWEEEP</title>
    <style type="text/css">
        .style1
        {
            width: 100%;           
        }
        .style2
        {
            font-weight: bold;
        }
        body{
        font-family:Trebuchet MS;
        font-size:10pt;
        padding:0px; margin:0px;
        }
    .comment { font-family: Arial, Helvetica, sans-serif; font-size: 11px; text-align: left; color: #000000; background-color: #ffffff; }
        .style4
        {
            width: 149px;
        }
        .style5
        {
            font-weight: bold;
            color: #0066CC;
        }
        .style6
        {
            color: #0066CC;
        }
        .style7
        {
            width: 71px;
        }
    </style>
</head>
<body>
<div style="margin:0;padding:0;vertical-align:middle;background-color:#aaccff;padding-left:100px">
    <table style="">
        <tr>
            <td>
                <h3>
                    <a href="http://isweeep.org" target="_blank"><img alt="isweeep-logo" src="../images/I-SWEEEP%20Logo.png" style="width: 100px;
                        height: 111px;border:none" /></a></h3>
            </td>
            <td style="padding: 0 10;">
                <h1 style="color: Green; padding-left: 20px;">
                    Donate to I-SWEEEP</h1>
            </td>
            <td style="padding-left:100px;">
               <span id="siteseal"><script type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=1027423038092c06511011e1de1c95937d3694290966617076286461"></script><br/><a style="font-family:arial;font-size:9px" href="http://www.godaddy.com/gdshop/ssl/ssl_extended.asp" target="_blank"></a></span>
            </td>
            <td>
                <!-- (c) 2005, 2009. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">                                                                                                                                               var ANS_customer_id = "a4966d65-3246-4eed-a22b-cd36bdf64c76";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> <a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank"></a> </div> 
            </td>
        </tr>
    </table>

</div>
<br>

    <form id="form1" runat="server" style="padding:20px 100px">
    
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <div style="">
         Thank you for donating to
         <a href="http://isweeep.org" target="_blank">I-SWEEEP</a>. Please complete this form to donate. (Bold fields are required)</div>
                    <asp:Label ID="lblMessage0" runat="server" Font-Bold="True" 
        ForeColor="Red"></asp:Label>
    <br />
    <div>
        
        <table class="style1">
            <tr>
                <td class="style2">
                    Donation
                    Amount:</td>
                <td>
                    <asp:TextBox ID="txtAmount" style="text-align:right;height:13px" runat="server" MaxLength="5" Width="60px"></asp:TextBox>.00
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtAmount" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <span class="comment">&nbsp;(US Dollars)</span><asp:RangeValidator 
                        ID="RangeValidator1" runat="server" 
                        ControlToValidate="txtAmount" 
                        ErrorMessage=" (Amount should be a number between 5 and 20000)" MaximumValue="20000" 
                        MinimumValue="5" SetFocusOnError="True" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                </td>
            </tr>
            <tr visible="false" style="display:none">
                <td class="style2">
                    Donation Frequency:</td>
                <td>
                    <asp:DropDownList ID="ddFrequency" runat="server">
                        <asp:ListItem>One Time</asp:ListItem>
                        <asp:ListItem>Every Month</asp:ListItem>
                        <asp:ListItem>Every 4 months</asp:ListItem>
                        <asp:ListItem>Every 6 months</asp:ListItem>
                        <asp:ListItem>Every Year</asp:ListItem>
                    </asp:DropDownList>
<span class="comment">&nbsp;(The amount will be charged only once or several times in the selected frequency)</span></td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style6">&nbsp;Donor information:</span></td>
            </tr>
            <tr>
                <td class="style2">
                    First Name:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Organization:</td>
                <td>
                    <asp:TextBox ID="txtOrganization" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style6">&nbsp;Payment 
                    information:</span></td>
            </tr>
            <tr>
                <td class="style2">
                    Name on Card:</td>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style7">
                                First Name:
                            </td>
                            <td>
                    <asp:TextBox ID="txtFirstNameonCard" runat="server" Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="txtFirstNameonCard" Display="Dynamic" 
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                Last Name:</td>
                            <td>
                    <asp:TextBox ID="txtLastNameonCard" runat="server" Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="txtLastNameonCard" Display="Dynamic" 
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>                    
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Card Number:</td>
                <td>
                    <asp:TextBox ID="txtcardNumber" runat="server" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtcardNumber" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <span class="comment">&nbsp;(enter number without spaces or dashes)</span></td>
            </tr>
            <tr>
                <td class="style2">
                    Card Expiration:</td>
                <td>
                    <asp:DropDownList ID="ddMonth" runat="server">
                        <asp:ListItem>Month</asp:ListItem>
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem Value="06"></asp:ListItem>
                        <asp:ListItem Value="07"></asp:ListItem>
                        <asp:ListItem Value="08"></asp:ListItem>
                        <asp:ListItem Value="09"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="11"></asp:ListItem>
                        <asp:ListItem Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="ddMonth" Display="Dynamic" ErrorMessage="Select Month" 
                        InitialValue="Month"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddYear" runat="server">
                        <asp:ListItem>Year</asp:ListItem>
                        <asp:ListItem>2010</asp:ListItem>
                        <asp:ListItem>2011</asp:ListItem>
                        <asp:ListItem>2012</asp:ListItem>
                        <asp:ListItem>2013</asp:ListItem>
                        <asp:ListItem>2014</asp:ListItem>
                        <asp:ListItem>2015</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2018</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="ddYear" Display="Dynamic" ErrorMessage="Select Year" 
                        InitialValue="Year"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Security Code:</td>
                <td>
                    <asp:TextBox ID="txtSecCode" runat="server" MaxLength="4" Width="55px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtSecCode" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <span class="comment">&nbsp;(3 or 4 digit code on the back of your card)</span></td>
            </tr>
            <tr>
                <td class="style5" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Billing Address:</td>
            </tr>
            <tr>
                <td class="style2">
                    Street
                    Address:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <span class="comment">&nbsp;(This is the address where your credit card statements are 
                    mailed)</span></td>
            </tr>
            <tr>
                <td class="style2">
                    City:</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    State:</td>
                <td>
                    <asp:TextBox ID="txtState" runat="server" Width="40px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Country:</td>
                <td>
                    <asp:TextBox Text="United States" Enabled="false" ID="txtCountry" runat="server"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Zip Code:</td>
                <td>
                    <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtZipCode" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    Email Address:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <span class="comment">&nbsp;(A receipt will be e-mailed to this address.)</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" 
                        ErrorMessage="Invalid email address" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Proceed to receipt" 
                        onclick="btnSubmit_Click" />
                &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        
    </div></asp:View>
        <asp:View ID="View2" runat="server">        
                <asp:Label ID="ReceiptLabel" runat="server" Text=""></asp:Label>
                <a href="#" onclick="window.print();return false;">Print Receipt</a>
        </asp:View>
    </asp:MultiView>
    </form>
</body>
</html>
