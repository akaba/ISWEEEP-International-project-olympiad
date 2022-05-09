<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="EditJudges.aspx.cs" Inherits="Admin_Judging_EditJudges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

<asp:AccessDataSource SelectCommand="Select * from Judges" DataFile="~/App_Data/isweeep.mdb"  ID="AccessDataSource1" runat="server">


</asp:AccessDataSource>

</asp:Content>

