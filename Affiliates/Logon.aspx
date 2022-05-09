<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logon.aspx.cs" Inherits="Affiliates_Logon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Affiliates Logon Page</title>
      <link href='../admin.css' rel='stylesheet' type='text/css' />
     <link href="../bootstrap.min.css"  rel='stylesheet' type='text/css' />
<style type="text/css">
	.hidden{display:none}
*{font:'trebuchet ms'}
a.menu{font:'trebuchet ms';padding:2px;color:#ffffff;display:block;text-decoration:none;border-bottom:1px dashed white}
a.menu:hover{background-color:#b5dc10;color:black;border-left:4px solid white}
   
    </style>
</head>
<body style="margin: 0px; padding: 0px; background-color: #e3ead9">
        <div id="top">
          AFFILIATE ADMIN INTERFACE
        </div>
       
    
    
     <form id="form1" runat="server">
       <div style="position: relative; margin: auto; background-color: #e3ead9">
        </div>
        <div id="menu">
             </div>
        <div id="content" style="padding: 10px; font: 12pt 'trebuchet ms' black; z-index: 200; margin-left: 191px; padding-top: 30px; position: relative; right: 0px;
            height: auto">
        <b>AFFILIATE LOGIN<br />
    </b> 
    Please enter the following information to login:<br />
    &nbsp;<table >
        <tr>
            <td >
                Username:</td>
            <td >
                <asp:TextBox ID="TextBox1" runat="server" Width="167px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Password:</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="117px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" class="btn btn-default" runat="server" OnClick="Button1_Click" Text="Login" />
    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb"         
        SelectCommand="SELECT * FROM AllSciencefairs WHERE (([user_name] = ?) AND ([pass_word] = ?))">
        <SelectParameters>
            <asp:controlparameter ControlID="TextBox1" Name="user_name" PropertyName="Text" 
                Type="String" />
            <asp:controlparameter ControlID="TextBox2" Name="pass_word" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <br />
    </div>
    </form>
</body>
</html>
