<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="LoginAS.aspx.cs" Inherits="Admin_LoginAS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

         <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>


           <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"></asp:AccessDataSource>
   

</asp:Content>

