<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true" CodeFile="Submitproject.aspx.cs" Inherits="Submitproject" %>


<asp:Content runat="server" ContentPlaceHolderID="cp1">

<b>SUBMIT PROJECT</b>
            
            <asp:Panel ID="Panel1" runat="server">
                <p>
                    If you finished editing your project information, click the button below to 
        finalize your project registration.</p>
                <p>
                    Your project will be reviewed by the organization committee and you will be notified about your qualification to participate in 
                    I-SWEEEP.</p>
                <p>
                    <b>After you click on &quot;submit project&quot; button below, you will <span style="text-decoration:underline;font-style:italic">not be able to make </span>any changes 
in your project information.</b></p>
            </asp:Panel>
            <p>
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </p>
                <p>
                    <asp:Label ID="lblInfo" runat="server"></asp:Label>
                </p>
    
    
        <asp:Button ID="btnFinish" runat="server" Font-Bold="True" 
            onclick="btnFinish_Click" Text="Submit Project" />
                <br />
        <br />
        
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [Firstname], [Lastname], [SchoolName] FROM [projectContestants] WHERE ([pid] = ? )">
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [SubmitProject] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server"  DataFile="~/App_Data/isweeep.mdb" 
    SelectCommand="SELECT * FROM [Contestants] WHERE ([pid] = ?)">
         <SelectParameters>
        <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
    </SelectParameters>

    </asp:AccessDataSource>
    
</asp:Content>