<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QualifiedProjects.aspx.cs"
    Inherits="QualifiedProjects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Qualified Projects for I-SWEEEP <% =Settings.CurrentYear %></title>
</head>
<body>
    <h1 style="font-family: Cambria; font-size: 24pt; font-variant: small-caps">
        Qualified Projects for I-SWEEEP <% =Settings.CurrentYear %></h1>
    <form id="form1" runat="server">
    <div>
        <b>Country:</b>
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="AccessDataSource2" DataTextField="Country" 
            DataValueField="Country" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" 
            DataSourceID="AccessDataSource3" DataTextField="category" 
            DataValueField="category" AutoPostBack="True"  OnDataBound="DropDownList2_DataBound"
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="select distinct category from [QualifiedProjects]">
        </asp:AccessDataSource>
        <br />
        <br />
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#DEDFDE"
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="AccessDataSource1"
            ForeColor="Black" GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <AlternatingItemStyle BackColor="White" />
            <ItemStyle BackColor="snow" />
            <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <div style="line-height:20px;padding:5px; font-family: Cambria; font-size: 11pt;border-bottom:1px solid green">
                    <b>Title:</b> <b style="color: maroon">
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></b>
                    <br />
                    <b>Category:</b>                   
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    <b>Contestants:</b>
                    <asp:Label ID="CN1Label" runat="server" Text='<%# WriteContestants( ((System.Data.DataRowView)Container.DataItem)["CN1"].ToString(), ((System.Data.DataRowView)Container.DataItem)["CN2"].ToString(), ((System.Data.DataRowView)Container.DataItem)["CN3"].ToString() ) %>' />
                    <br />
                    <b>from </b>
                    <asp:Label ID="CountryLabel" runat="server" Text='<%# WritePlace(((System.Data.DataRowView)Container.DataItem)["Country"].ToString(),((System.Data.DataRowView)Container.DataItem)["State"].ToString(),((System.Data.DataRowView)Container.DataItem)["City"].ToString()) %>' />
                    <br />
                    
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [Title], [Category], [Country], [State],[City], [CN1], [CN2], [CN3] FROM [QualifiedProjects] order by category asc, country asc, state asc">
        </asp:AccessDataSource>
        <br />
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"            
            SelectCommand="SELECT distinct [Country] FROM [QualifiedProjects] order by country asc">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
