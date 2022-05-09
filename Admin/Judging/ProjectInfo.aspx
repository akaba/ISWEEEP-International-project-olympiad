<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="ProjectInfo.aspx.cs" Inherits="Admin_Judging_ProjectInfo" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        <b>Project Judging Information:</b><br />
        Search Project By:<br />
        Booth Number:<asp:TextBox ID="txtBooth" runat="server" Width="113px"></asp:TextBox>
&nbsp;or
        Pid:<asp:TextBox ID="txtPid" runat="server" Width="54px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp; or&nbsp; <br />
        Name:&nbsp;
        <asp:TextBox ID="txtPName" runat="server" Width="305px"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Find Project" />
        <br />
        <br />
        Project:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="BoothNumber" 
            DataSourceID="projectData" ForeColor="#333333" GridLines="None" 
            ondatabound="GridView1_DataBound">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                 <asp:BoundField DataField="BoothNumber" HeaderText="Booth#" 
                    SortExpression="BoothNumber" />
               <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Division" HeaderText="Division" 
                    SortExpression="Division" />
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
            <EmptyDataTemplate>No Results Found</EmptyDataTemplate>
        </asp:GridView>
        <br />
        Judges:<br />
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" DataSourceID="judgingData" 
        DataKeyNames="AssignmentId"  AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" >
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="AssignmentId" HeaderText="AssignmentId" 
                    InsertVisible="False" SortExpression="AssignmentId" ReadOnly="true" />
                <asp:BoundField DataField="JudgeId" HeaderText="JudgeId" 
                    SortExpression="JudgeId" ReadOnly="true" />
                <asp:BoundField DataField="BoothNumber" HeaderText="Booth" 
                    SortExpression="BoothNumber" ReadOnly="true" />
                <asp:BoundField DataField="Score" HeaderText="Score" 
                    SortExpression="Score" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                No Judges for the selected project
            </EmptyDataTemplate>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="projectData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [pid], [ProjectCode], [Title], [Division], [Category], [BoothNumber] FROM [Projects] WHERE (([Status] = 'Qualified') and ( ([pid] = ?) or ([BoothNumber] = ?) or ([Title] LIKE '%' + ? + '%') ))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtPid" DefaultValue="-1" Name="pid" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtBooth" DefaultValue="-1" Name="BoothNumber" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPName"  Name="Title" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="judgingData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [JudgeAssignments] WHERE ([BoothNumber] = ?)" 
            DeleteCommand="DELETE FROM [JudgeAssignments] WHERE [AssignmentId] = ?"             
            UpdateCommand="UPDATE [JudgeAssignments] SET [Score] = ? WHERE [AssignmentId] = ?"  >
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="BoothNumber" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Score" Type="Int32" />
                <asp:Parameter Name="AssignmentId" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="AssignmentId" Type="Int32" />
            </DeleteParameters>
            
        </asp:AccessDataSource>
    </p>
</asp:Content>

