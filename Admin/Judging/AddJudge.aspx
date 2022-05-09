 <%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="AddJudge.aspx.cs" Inherits="Judges" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
Please enter the following information:</p>
    <div>
    
        <table>
            <tr>
                <td>
                    First name:</td>
                <td>
            <asp:TextBox ID="txtFirstName" runat="server" Width="133px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="style3">
                    
            Last name:</td>
                <td class="style3">
            <asp:TextBox ID="txtLastName" runat="server" Width="133px"></asp:TextBox></td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    Company/Institution Name</td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server" Width="167px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    
                    Position/Title</td>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" Width="167px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    
                    Which categories do&nbsp; you want to judge?</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    1st Preference:</td>
                <td class="style4">
                    <asp:DropDownList ID="ddPref1" runat="server" Width="133px">
                        <asp:ListItem Value="&quot;&quot;">Select One</asp:ListItem>
                        <asp:ListItem>Junior-Engineering</asp:ListItem>
                        <asp:ListItem>Senior-Engineering</asp:ListItem>
                        <asp:ListItem>Junior-Energy</asp:ListItem>
                        <asp:ListItem>Senior-Energy</asp:ListItem>
                        <asp:ListItem>Junior-Environment</asp:ListItem>
                        <asp:ListItem>Senior-Environment</asp:ListItem>
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
                    2nd Preference:</td>
                <td class="style4">
                    <asp:DropDownList ID="ddPref2" runat="server" Width="133px">
                        <asp:ListItem Value="&quot;&quot;">Select One</asp:ListItem>
                        <asp:ListItem>Junior-Engineering</asp:ListItem>
                        <asp:ListItem>Senior-Engineering</asp:ListItem>
                        <asp:ListItem>Junior-Energy</asp:ListItem>
                        <asp:ListItem>Senior-Energy</asp:ListItem>
                        <asp:ListItem>Junior-Environment</asp:ListItem>
                        <asp:ListItem>Senior-Environment</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td class="style4">
                    3rd Preference:</td>
                <td class="style4">
                    <asp:DropDownList ID="ddPref3" runat="server" Width="133px">
                        <asp:ListItem Value="&quot;&quot;">Select One</asp:ListItem>
                        <asp:ListItem>Junior-Engineering</asp:ListItem>
                        <asp:ListItem>Senior-Engineering</asp:ListItem>
                        <asp:ListItem>Junior-Energy</asp:ListItem>
                        <asp:ListItem>Senior-Energy</asp:ListItem>
                        <asp:ListItem>Junior-Environment</asp:ListItem>
                        <asp:ListItem>Senior-Environment</asp:ListItem>
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
                    &nbsp;</td>
            
            </tr>
			
            <tr>
                <td class="style2">
                    Email Address:</td>
                <td class="style2">
                    <asp:TextBox ID="txtEmail" runat="server" Width="167px"></asp:TextBox>
                        </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td class="style2">
                    Confirm Email Address:</td>
                <td class="style2">
                    <asp:TextBox ID="txtEmail2" runat="server" Width="167px"></asp:TextBox>
                        </td>
                <td class="style2">
                    &nbsp;</td>
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
            <asp:Button visible="true" ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" 
                        Font-Bold="True" Font-Size="Medium" Width="167px" /></td>
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