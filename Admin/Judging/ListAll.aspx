<%@ Page Language="C#" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="ListAll.aspx.cs" Inherits="Admin_Judging_ListAll" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>
        All Judging Assignments:<br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:BoundField DataField="BoothNumber" HeaderText="BoothNumber" 
                    SortExpression="BoothNumber" />
                <asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" 
                    SortExpression="title" />
                <asp:BoundField DataField="Name" HeaderText="Judge" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="JudgeId" HeaderText="JudgeId" 
                    SortExpression="JudgeId" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                <asp:BoundField DataField="category" HeaderText="category" ReadOnly="True" 
                    SortExpression="category" />
                <asp:BoundField DataField="AssignmentId" HeaderText="AssignmentId" 
                    InsertVisible="False" SortExpression="AssignmentId" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            DeleteCommand="delete from JudgeAssignments where assignmentId=?" 
            SelectCommand="SELECT * FROM [JudgingAssignmentsQuery]" 
            UpdateCommand="update JudgeAssignments set score=? where assignmentId=?">
            
            <UpdateParameters>
                <asp:Parameter Name="assignmentId" Type="Int32" />
                <asp:Parameter Name="Score" Type="Int32" />
            
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="assignmentId" Type="Int32" />
            </DeleteParameters>
            
        </asp:AccessDataSource>
    </p>
</asp:Content>

