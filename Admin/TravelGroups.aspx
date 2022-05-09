<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="TravelGroups.aspx.cs" Inherits="Admin_TravelGroups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        <b style="font-size: 12pt">Travel Groups:</b></p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="AdultSVData" DataTextField="ASV" DataValueField="asvid" 
            ondatabound="DropDownList1_DataBound">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AdultSVData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="Select asvid, asvname+' '+asvlastname as ASV from adultsupervisors where asvid in (select asvid from projects where status='Qualified') order by asvname+' '+asvlastname ">
        </asp:AccessDataSource>
    </p>
    <p>
        <asp:Label EnableViewState="false" ID="Label1" runat="server"></asp:Label>
    </p>
</asp:Content>

