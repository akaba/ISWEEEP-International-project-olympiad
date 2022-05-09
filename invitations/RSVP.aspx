<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RSVP.aspx.cs" Inherits="Invitations_RSVP" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Donate to I-SWEEEP</title>
    <style type="text/css">
        body{
        font-family:Trebuchet MS;
        font-size:10pt;
        padding:0px; margin:0px;
        }
    .comment { font-family: Arial, Helvetica, sans-serif; font-size: 11px; text-align: left; color: #000000; background-color: #ffffff; }
        .style1
        {
            width: 429px;
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
                                        I-SWEEEP Invitation</h1>
            </td>
           
        </tr>
    </table>

</div>


    <form id="form1" runat="server" style="padding:20px 100px">
    
   
    Dear Guest,<br />
    You are cordially invited to attend the International Sustainable World Energy, 
    Engineering and Environment Project Olympiad (I-SWEEEP).<br />
    Join us and be a part of this globally impactful event.<br />
    <br />
    Please choose from the following events you would like to attend:<br />
&nbsp;<asp:CheckBoxList ID="CheckBoxList1" runat="server">
        <asp:ListItem>April 16 2010 Thursday, 6:00 pm, Registration &amp; Opening Ceremony 
        (3rd floor)</asp:ListItem>
        <asp:ListItem>April 18 2010, Saturday, 9:00 am - 5:00 pm, Project Display &amp; 
        Judging (1st floor)</asp:ListItem>
        <asp:ListItem>April 19 2010, Sunday, 3:30 pm - 5:00 pm, Award Ceremony (3rd 
        floor)</asp:ListItem>
    </asp:CheckBoxList>
    <br />
    All I-SWEEEP events will be held at George R. Brown Convention Center,<br />
    1001 Las Americas Avenue, Houston, TX, 77010<br />
    <br />
    Please enter the following information:<br />
    <table class="style1">
        <tr>
            <td>
                Your Name:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" Display="Dynamic" 
                    ErrorMessage="Please enter your fullname"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Affiliation:</td>
            <td>
                <asp:TextBox ID="txtAff" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAff" Display="Dynamic" 
                    ErrorMessage="Please enter your affiliation"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtEmail" Display="Dynamic" 
                    ErrorMessage="Please enter your email address"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
&nbsp;<asp:Button ID="Button1" runat="server" BackColor="#0099FF" 
        BorderColor="#CC3300" onclick="Button1_Click" Text="Submit" />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </form>
</body>
</html>
