<%@ Page Title="" Language="C#" MasterPageFile="~/Parents/Parents.master" AutoEventWireup="true" CodeFile="CodeOfConduct.aspx.cs" Inherits="Parents_Code_of_conduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Code Of Conduct Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <b style="font-size:16pt">
        Code of Conduct Form for <%= Session["ChildName"] %>
    
    </b><br /><br />


I understand that violation of any rule explained in the <a target="_blank" href="../media/forms/I-SWEEEP Code of Conduct and Legal Disclaimer.pdf">code of conduct form</a> will result in my project’s immediate disqualification and removal of eligibility for all awards. I shall
indemnify, defend and hold I-SWEEEP and organizers of I-SWEEEP harmless from and against any negligence in any case due to injury, illness or any form of
harassment anywhere programs or events of I-SWEEEP takes place including but not limited to hotel, convention center (George R. Brown Center).<br />
    <br />
    Your name:<asp:TextBox ID="txtParentName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtParentName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="btnAccept" runat="server" onclick="btnAccept_Click"  style="margin-left:100px"
        Text="Accept" />

    
    <%--<asp:Button style="margin-left:100px" ID="btnDecline" runat="server" onclick="btnDecline_Click" 
        Text="Decline" OnClientClick="javascript:return confirm('If you decline the code of conduct form, your child cannot participate in I-SWEEEP 2011. Are you sure you want to decline?')" />--%>
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#0066CC"></asp:Label>
&nbsp; 


</asp:Content>

