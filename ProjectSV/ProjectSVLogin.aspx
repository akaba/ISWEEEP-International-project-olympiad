<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="ProjectSVLogin.aspx.cs" Inherits="ProjectSupervisor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .style2
        {
            height: 26px;
        }
        .style4
        {
            height: 26px;
            width: 190px;
        }
        </style>
</asp:Content>        
<asp:Content ID="Content1" ContentPlaceHolderID="cp1" runat="server">
            <b>PROJECT SUPERVISOR LOGIN<br />
            <br />
            </b>
    
            Please enter the following information to login:<br />
    
    <div>
    
        <table>
            			
            <tr>
                <td class="style2">
                    Email:</td>
                <td class="style4">
                    <asp:TextBox ID="txtEmail" runat="server" Width="170px"></asp:TextBox>
                    *</td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
			
            <tr>
                <td class="style2">
                    Project Code:</td>
                <td class="style4">
                    <asp:TextBox ID="txtPcode" runat="server" Width="169px" TextMode="Password"></asp:TextBox>
                        *</td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtPcode" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
			
            <tr>
                <td class="style2">
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/isweeep.mdb" 
                        
                        SelectCommand="SELECT [ProjectCode], [SVemail], [svid], [pid] FROM [SupervisorsQuery] WHERE (([ProjectCode] = ?) AND ([SVemail] = ?))">
                        <SelectParameters>
                            <asp:controlparameter ControlID="txtPcode" Name="ProjectCode" 
                                PropertyName="Text" Type="String" />
                            <asp:controlparameter ControlID="txtEmail" Name="SVemail" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style4">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" 
                        Width="83px" />
                        </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
			
        </table>
        
    </div>
    <p>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        </p>
    
</asp:Content>
