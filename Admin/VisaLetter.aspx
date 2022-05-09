<%@ Page Title="Visa Letter" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="VisaLetter.aspx.cs" Inherits="Admin_VisaLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
     <p>
    <b>Travel Groups:</b>
   
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="chosen-select" 
            DataSourceID="AdultSVData" DataTextField="ASV" DataValueField="asvid" 
            ondatabound="DropDownList1_DataBound">
        </asp:DropDownList> <a href="VisaLetterText.aspx" class="btn btn-default">Edit Letter Text</a>
        <asp:AccessDataSource ID="AdultSVData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="Select asvid, asvname+' '+asvlastname as ASV from adultsupervisors where asvid in (select asvid from projects where status='Qualified') order by asvname+' '+asvlastname ">
        </asp:AccessDataSource>
    </b>
    <p>
        <asp:Label EnableViewState="false" ID="Label1" runat="server"></asp:Label>
    </p>
</asp:Content>

