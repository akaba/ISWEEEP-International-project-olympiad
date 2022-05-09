<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Admin_Search" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    Search Results for <b><% =Request.QueryString["s"] %></b>:
    <asp:ScriptManager ID="ScriptManager1" runat="server">
     <Services>
     <asp:ServiceReference Path="SearchAutoComplete.asmx" />
     </Services>
     </asp:ScriptManager>
    
    <asp:AccessDataSource ID="AccessDataSource1"
        runat="server" DataFile="~/App_Data/isweeep.mdb" 
    
        SelectCommand="SELECT [pid], [Title], [Division], [Category], [Status], [Country], [State] FROM [Projects] WHERE (  [Title] LIKE '%' + ? + '%' or ProjectCode  LIKE '%' + ? + '%'    )">
    <SelectParameters>
        <asp:QueryStringParameter Name="Title" QueryStringField="s" Type="String" />
        <asp:QueryStringParameter Name="ProjectCode" QueryStringField="s" Type="String" />
    </SelectParameters>
</asp:AccessDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="pid" DataSourceID="AccessDataSource1" 
        ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="pid" 
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}" Text="Details" />
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" 
                ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Division" HeaderText="Division" 
                SortExpression="Division" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
        </Columns>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
<br />

<style type="text/css">
        
        .complete
        {
            z-index: 400;
            background-color: Black;
            color: white;
            width: 725px !important;
            margin-left:0px !important;
            cursor:pointer;
            
        }
        .bold
        {
            font-weight: bold;width: auto !important;
            margin-left:0px !important;
            margin-top:10px;z-index: 400;
        }
        .listitem
        {
            color: #aaccff;z-index: 400;
            margin-top:10px;
        }
    </style>
    <br />


    New Search:<br />
    <asp:TextBox ID="TextBox1" runat="server" Width="725px"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
    <cc1:AutoCompleteExtender TargetControlID="TextBox1" ServicePath="SearchAutoComplete.asmx"
        ServiceMethod="GetCompletionList" EnableCaching="true" CompletionListCssClass="complete"
        MinimumPrefixLength="3" ID="AutoCompleteExtender1" runat="server" CompletionListHighlightedItemCssClass="bold"
        CompletionListItemCssClass="listitem" Enabled="True" 
        CompletionInterval="500" CompletionSetCount="12">
    </cc1:AutoCompleteExtender>
    <br />


</asp:Content>

