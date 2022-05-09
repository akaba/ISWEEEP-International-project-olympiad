<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="VisitorContestants.aspx.cs" Inherits="Admin_VisitorContestants" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        Contestants whose projects were Qualified:<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            PageSize="25">
            <PagerSettings Mode="NumericFirstLast" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="Firstname" HeaderText="Firstname" 
                    SortExpression="Firstname" />
                <asp:BoundField DataField="Lastname" HeaderText="Lastname" 
                    SortExpression="Lastname" />
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:HyperLinkField DataNavigateUrlFields="pid" 
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}"  Text="Project" 
                    DataTextField="Title" HeaderText="Project" >
            
                    <ItemStyle Width="300px" />
                </asp:HyperLinkField>
            
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" 
                    SortExpression="SchoolName" />
                <asp:BoundField DataField="ASVName" HeaderText="ASVName" 
                    SortExpression="ASVName" />
                <asp:BoundField DataField="ASVLastName" HeaderText="ASVLastName" 
                    SortExpression="ASVLastName" />
                <asp:BoundField DataField="ASVPhone" HeaderText="ASVPhone" 
                    SortExpression="ASVPhone" />
                <asp:BoundField DataField="ASVemail" HeaderText="ASVemail" 
                    SortExpression="ASVemail" />
                <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" 
                    SortExpression="pid" />
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [___Contestants Query]"></asp:AccessDataSource>
    </p>
</asp:Content>

