<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FinishedTravels.aspx.cs" Inherits="Admin_Finished_Traves" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Finished Travels Details </title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Travels with Details:
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Export" />
&nbsp;<asp:RadioButtonList ID="doBtnListExportOptions" runat="server" 
            RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>Current page</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:GridView PageSize=25 ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:HyperLinkField  DataNavigateUrlFields="ASVID" 
                DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}" Text="Details" Target="_blank" HeaderText="Details" SortExpression="asvid" />
                <asp:BoundField DataField="ASupervisor" HeaderText="ASupervisor" 
                    ReadOnly="True" SortExpression="ASupervisor" />
                <asp:BoundField DataField="ASVContact" HeaderText="ASVContact" ReadOnly="True" 
                    SortExpression="ASVContact" />
                <asp:BoundField DataField="ASVCitizenship" HeaderText="Ulke" 
                    SortExpression="ASVCitizenship" />
                <asp:BoundField DataField="gender" HeaderText="gender" 
                    SortExpression="gender" />
                <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" 
                    SortExpression="ArrivalDate" />
                <asp:BoundField DataField="ArrivalTime" HeaderText="ArrivalTime" 
                    SortExpression="ArrivalTime" />
                <asp:BoundField DataField="ArrivalOrigin" HeaderText="ArrivalOrigin" 
                    SortExpression="ArrivalOrigin" />
                <asp:BoundField DataField="ArrivalDestination" HeaderText="ArrivalDestination" 
                    SortExpression="ArrivalDestination" />
                <asp:BoundField DataField="ArrivalAirline" HeaderText="ArrivalAirline" 
                    SortExpression="ArrivalAirline" />
                <asp:BoundField DataField="ArrivalFlightNo" HeaderText="ArrivalFlightNo" 
                    SortExpression="ArrivalFlightNo" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [FinishedTravels]"></asp:AccessDataSource>
    
    </div>
    </form>
</body>
</html>
