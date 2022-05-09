<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true" CodeFile="SupervisorInformation.aspx.cs" Inherits="SupervisorInformation" %>


<asp:Content ContentPlaceHolderID="cp1" runat="server">

 <b>PROJECT SUPERVISOR INFORMATION FORM</b><p>
                Project Supervisor: The person who provided the most assistance for the project.<br /><br />
                If your project requires Risk management form, then your project supervisor 
                needs to login with the email address provided here and project code.Your supervisor will receive an e-mail from I-SWEEEP about how to fill out the online form after you submit your project</p>
            <p>
                Please enter the project supervisor&#39;s information:</p>
    <div>
        
        <table>
            <tr>
                <td>
                    First name:</td>
                <td>
            <asp:TextBox ID="txtFirstName" Width="100px" runat="server"></asp:TextBox>*</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
            Last name:</td>
                <td>
            <asp:TextBox ID="txtLastName" Width="100px"  runat="server"></asp:TextBox>*</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" Width="220px"  runat="server"></asp:TextBox>
                    *</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email address"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
		</td>
            </tr>
        </table>
        
    </div>
    <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" Text="Save" Font-Bold="True" Width="57px" />
    <br />
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [SVemail], [SVName], [SVLastName] FROM [ProjectSupervisors] WHERE ([SVID] = ?)">
            <SelectParameters>
                <asp:parameter DefaultValue="0" Name="SVID" Type="Int32" />
            </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
