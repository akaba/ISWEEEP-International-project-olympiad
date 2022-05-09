<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="Judges.aspx.cs" Inherits="Judges" %>

<asp:Content ContentPlaceHolderID="cp1" runat="server">
<h3>I-SWEEEP Judge Registration</h3>
      <p>  Thank you for being interested in judging at I-SWEEEP fair.</p>
    <p>
        Please enter the following information:</p>
    <div>    
        <table>
            <tr>
                <td>
                    First name:</td>
                <td>
            <asp:TextBox ID="txtFirstName" runat="server" Width="250px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="style3">
                    
            Last name:</td>
                <td class="style3">
            <asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox></td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    Company/Institution Name</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server" Width="400px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtCompany" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    Position/Title</td>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" Width="400px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtPosition" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    
                    Which categories do&nbsp; you want to judge?</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    1<sup>st</sup> Preference:</td>
                <td class="style4">
                    <asp:DropDownList ID="ddPref1" runat="server" Width="133px">
                        <asp:ListItem Value="&quot;&quot;">Select One</asp:ListItem>
                            <asp:ListItem>Engineering</asp:ListItem>
                            <asp:ListItem>Energy</asp:ListItem>
                            <asp:ListItem>Environment- Management & Pollution</asp:ListItem>
                            <asp:ListItem>Environment- Health & Disease Prevention</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                <td class="style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddPref1" ErrorMessage="Required" 
                        InitialValue="&quot;&quot;"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    2<sup>nd</sup> Preference:</td>
                <td class="style4">
                    <asp:DropDownList ID="ddPref2" runat="server" Width="133px">
                        <asp:ListItem Value="&quot;&quot;">Select One</asp:ListItem>
                        <asp:ListItem>Engineering</asp:ListItem>
                        <asp:ListItem>Energy</asp:ListItem>
                        <asp:ListItem>Environment- Management & Pollution</asp:ListItem>
                        <asp:ListItem>Environment- Health & Disease Prevention</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                <td class="style4">
                    </td>
            </tr>
            
			
            <tr>
                <td>
                    Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Width="133px"></asp:TextBox>
                        </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        
        </td>
            
            </tr>
			
            <tr>
                <td class="style2">
                    Email Address:</td>
                <td class="style2">
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                        </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email adress"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
			
            <tr>
                <td class="style2">
                    Confirm Email Address:</td>
                <td class="style2">
                    <asp:TextBox ID="txtEmail2" runat="server" Width="250px"></asp:TextBox>
                        </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtEmail2" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail2" Display="Dynamic" ErrorMessage="Invalid email adress"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
			
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td style="height: 21px">
            <asp:Button  enabled=true  visible="true" ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" 
                        /></td>
                <td style="height: 21px">
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/isweeep.mdb" 
                        SelectCommand="SELECT [JudgeId], [JudgeName], [JudgeLastName], [JPhone], [JEmail], [CompanyName], [Position] FROM [Judges]">
                    </asp:AccessDataSource>
                </td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
        
    </div>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

