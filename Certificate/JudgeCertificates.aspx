<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JudgeCertificates.aspx.cs" Inherits="Certificate_JudgeCertificates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Certificate Search</title>    
    <link href="../admin.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="searchform">
        <h2>Judge Certificate Search</h2>
        <table>
            <tr><td>
        Email:</td><td>
        <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email address" ValidationGroup="button1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Font-Size="Small" ForeColor="Yellow"></asp:RegularExpressionValidator>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ValidationGroup="button1" ErrorMessage="Required" Font-Size="Small" ForeColor="Yellow"></asp:RequiredFieldValidator>
            </td><td>
                  </td>              
        </tr><tr><td>

               </td>
                <td>
                   
                  
                    </td>
                <td>
                   
                    &nbsp;</td>
                    
                    </tr>
            
            
            <tr><td>
            </td><td>
                 <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Font-Bold="True"></asp:Label>
                <br/> <br/>
        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn large" OnClick="Button1_Click" ValidationGroup="button1" />

</td> <td>
                    &nbsp;</td> </td> </tr>
            
            
            <tr><td colspan="2"><br/>
                OR search with name<br/><br/>
                           </td> <td>
                    &nbsp;</td> </tr>
            
            
            <tr><td>
                FirstName:</td><td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ForeColor="Yellow" ErrorMessage="Required" ValidationGroup="button2" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator></td>
                 <td>
                    &nbsp;</td> </tr>
            
            
            <tr><td>
                 LastName:</td><td>
                    <asp:TextBox ID="txtLastNAme" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ForeColor="Yellow" ErrorMessage="Required" ValidationGroup="button2" ControlToValidate="txtLastNAme"></asp:RequiredFieldValidator></td> <td>
                    &nbsp;</td> </tr>
            
            
            <tr><td>
                 &nbsp;</td><td>
                     <asp:Label ID="Label2" runat="server" Text="" ForeColor="Yellow" Font-Bold="True"></asp:Label> <br/> <br/>
                     <asp:Button ID="Button2" runat="server" Text="Search" CssClass="btn large" OnClick="Button2_Click" ValidationGroup="button2"  /></td> <td>
                    &nbsp;</td> </tr>
            </table>


        
    
    </div>
    </form>
</body>
</html>
