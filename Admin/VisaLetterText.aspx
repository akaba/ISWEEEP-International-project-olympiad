<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="VisaLetterText.aspx.cs" Inherits="Admin_VisaLetterText" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

    <a href="VisaLetter.aspx" class="btn btn-default">Go back to Visa Letter page</a>
    <asp:Button ID="ButtonSave" runat="server" Text="Save" CssClass="btn-primary" OnClick="ButtonSave_Click" />
     <br /><br />

   
    
    Update I-SWEEEP <b>event dates, Hotel Name and Address</b>. Do NOT delete sections with the box brackets <b>[country], [organization-name], [member-list]</b> <br /> <br />

    
       
    <asp:textbox runat="server" ID="txtletter" TextMode="MultiLine" Rows="10"  Height="600px" Width="900px" Font-Size="Small"></asp:textbox>
    <br />
    
     <asp:Label ID="Labelmsg" runat="server" ForeColor="Red"></asp:Label>
    
          
    
       

    <asp:AccessDataSource ID="AccessDataSource1" DataFile="~/App_Data/isweeep.mdb"  runat="server" 
        DeleteCommand="DELETE FROM [Docs] WHERE (([docid] = ?) OR ([docid] IS NULL AND ? IS NULL))" 
        InsertCommand="INSERT INTO [Docs] ([docid], [docname], [eventdate], [eventhotel], [letter]) VALUES (?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Docs]" 
        UpdateCommand="UPDATE [Docs] SET [docname] = ?, [eventdate] = ?, [eventhotel] = ?, [letter] = ? WHERE (([docid] = ?) OR ([docid] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="docid" Type="Int16" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="docid" Type="Int16" />
            <asp:Parameter Name="docname" Type="String" />
            <asp:Parameter Name="eventdate" Type="String" />
            <asp:Parameter Name="eventhotel" Type="String" />
            <asp:Parameter Name="letter" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="docname" Type="String" />
            <asp:Parameter Name="eventdate" Type="String" />
            <asp:Parameter Name="eventhotel" Type="String" />
            <asp:Parameter Name="letter" Type="String" />
            <asp:Parameter Name="docid" Type="Int16" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>

