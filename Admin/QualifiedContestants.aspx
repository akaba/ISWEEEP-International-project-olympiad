<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QualifiedContestants.aspx.cs" Inherits="Admin_QualifiedContestants" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contestants</title>
    <style type="text/css">
    a:hover{color:Red}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>
        <b>Contestants whose projects were Qualified:
        </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            PageSize="25" Font-Size="10pt" EnableModelValidation="True">
            <PagerSettings PageButtonCount="30" 
                Position="TopAndBottom" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                
                <asp:HyperLinkField  DataNavigateUrlFields="ContestantId" 
                    DataNavigateUrlFormatString="Contestantdetails.aspx?cid={0}" 
                    DataTextField="Contestant"  SortExpression="Contestant" 
                    HeaderText="Contestant" Target="_blank" ItemStyle-Font-Underline="False" ItemStyle-ForeColor="#003366">
                    <ItemStyle Font-Underline="False" />
                </asp:HyperLinkField>
                <asp:BoundField DataField="DOB" HeaderText="DOB" 
                    SortExpression="DOB" />
                <asp:BoundField DataField="Gender" HeaderText="G" SortExpression="Gender" 
                    ReadOnly="True" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="State" HeaderText="State" 
                    SortExpression="State" />

                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:HyperLinkField  DataNavigateUrlFields="pid" 
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}"  Text="Project" 
                    DataTextField="Pid" SortExpression="pid" HeaderText="pid" Target="_blank" >
                </asp:HyperLinkField>
               <asp:BoundField DataField="title" HeaderText="title" 
                    SortExpression="title" />
                <asp:BoundField DataField="CContact" HeaderText="CContact" 
                    SortExpression="CContact" />
                <asp:HyperLinkField  DataNavigateUrlFields="ASVID" 
                DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}"  Text="Project" 
                    DataTextField="ASupervisor" SortExpression="ASupervisor" HeaderText="ASupervisor" Target="_blank" >
                </asp:HyperLinkField>
                <asp:BoundField DataField="SVG" HeaderText="SVG" 
                    SortExpression="SVG" />
                    
                <asp:BoundField DataField="ASVContact" HeaderText="ASVContact" 
                    SortExpression="ASVContact" />
                
                <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" 
                    SortExpression="SchoolName" />
                
                
            </Columns>
            <PagerStyle BackColor="#2461BF"  HorizontalAlign="Center" ForeColor="White" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [___Contestants Query]"></asp:AccessDataSource>
    </p>
    </div>
    </form>
</body>
</html>
