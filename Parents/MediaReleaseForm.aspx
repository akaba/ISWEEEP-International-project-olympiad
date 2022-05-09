<%@ Page Title="" Language="C#" MasterPageFile="~/Parents/Parents.master" AutoEventWireup="true"
    CodeFile="MediaReleaseForm.aspx.cs" Inherits="Parents_Media_Release" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Media Release From</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">
    <b style="font-size: 16pt">Media Release Form for
        <%= Session["ChildName"] %></b><br />
    <br />
    Throughout the I-SWEEEP Olympiad, the media may visit the fair to cover special
    events. ISWEEEP officials may also wish to use your child’s photograph, voice or
    project-work for promotional and educational reasons, such as in publications, posters,
    brochures and newsletters; on the I-SWEEEP web site, radio station or Cable TV channel.
    Before your child’s photograph or voice can be used by the media or by the I-SWEEEP
    officials, you must give your permission.
    <br />
    <br />
    <span style="font-size: 20pt">"</span><i><span style="font-family: Georgia; font-size: 14pt">I
        give my permission that my child may be filmed/photographed/interviewed by the media
        and/or the organizer during I-SWEEEP Olympiad and for them to use my child’s photograph/work/voice
        for promotional and educational purposes.</span></i><span style="font-size: 20pt">"</span><br />
    <br />
    <%-- Your name:<asp:TextBox ID="txtParentName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtParentName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
    <br />
    --%><br />
    <div style="text-align: center">
        <asp:Button ID="btnAccept" runat="server" OnClick="btnAccept_Click" Text="Accept" /></div>
    <br />
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#0066CC"></asp:Label>
    &nbsp;
</asp:Content>
