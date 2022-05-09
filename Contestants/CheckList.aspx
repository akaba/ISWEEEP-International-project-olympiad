<%@ Page Title="" Language="C#" MasterPageFile="~/contestants/contestant.master" AutoEventWireup="true" CodeFile="CheckList.aspx.cs" Inherits="ProjectStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
#tbl tr td,#tbl thead th  {text-align:left;padding:10px;border:1px solid silver}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <b>
        PROJECT CHECKLIST:
    </b><br />
    

<br />
   
<asp:Label ID="Label1" runat="server"></asp:Label>
<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
    DataFile="~/App_Data/isweeep.mdb" 
    SelectCommand="SELECT * FROM [SubmitProject] WHERE ([pid] = ?)">
    <SelectParameters>
        <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server"  DataFile="~/App_Data/isweeep.mdb" 
    SelectCommand="SELECT * FROM [Contestants] WHERE ([pid] = ?)">
         <SelectParameters>
        <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
    </SelectParameters>

    </asp:AccessDataSource>
<br />
    

</asp:Content>

