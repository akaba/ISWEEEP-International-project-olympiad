<%@ Page Title="" Language="C#" MasterPageFile="~/Contestants/contestant.master" AutoEventWireup="true" CodeFile="ProjectStatus.aspx.cs" Inherits="Contestants_ProjectStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        <b style='font-size:11pt;color:black'>Project Status:</b>
        <asp:Label ID="lblProjectStatus" runat="server" Text="Project Status:"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblScholarshipstatus" visible="false" runat="server" Text="Scholarship Status"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblFstatus" runat="server" Text="Financial Application Status" 
            Visible="False"></asp:Label>
    </p>
    
</asp:Content>

