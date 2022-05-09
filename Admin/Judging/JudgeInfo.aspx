<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="JudgeInfo.aspx.cs" Inherits="Admin_Judging_JudgeInfo" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        Judge Management:<br />
        <br />
        JudgeId:
        <asp:TextBox ID="txtJudgeId" runat="server"></asp:TextBox>
&nbsp;or Judge Name:
        <asp:TextBox ID="txtJudgeName" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Find" Height="26px" 
            onclick="Button1_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="JudgeId" DataSourceID="judgeData" 
            ForeColor="#333333" GridLines="None" ondatabound="GridView1_DataBound">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="JudgeId" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="JudgeId" />
                <asp:BoundField DataField="JudgeName" HeaderText="Name" 
                    SortExpression="JudgeName" />
                <asp:BoundField DataField="JudgeLastName" HeaderText="LastN" 
                    SortExpression="JudgeLastName" />
                <asp:BoundField DataField="JPhone" HeaderText="JPhone" 
                    SortExpression="JPhone" />
                <asp:BoundField DataField="CompanyName" HeaderText="Company" 
                    SortExpression="CompanyName" />
                <asp:BoundField DataField="Position" HeaderText="Position" 
                    SortExpression="Position" />
                <asp:BoundField DataField="Preference1" HeaderText="Preference1" 
                    SortExpression="Preference1" />
                <asp:BoundField DataField="Preference2" HeaderText="Preference2" 
                    SortExpression="Preference2" />
                <asp:BoundField DataField="Preference3" HeaderText="Preference3" 
                    SortExpression="Preference3" />
                <asp:BoundField DataField="status" HeaderText="status" 
                    SortExpression="status" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyNames="AssignmentId" DataSourceID="AccessDataSource1">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="AssignmentId" HeaderText="AssignmentId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="AssignmentId" />
                <asp:BoundField DataField="JudgeId" HeaderText="JudgeId" 
                    SortExpression="JudgeId" ReadOnly="true" />
                <asp:BoundField DataField="BoothNumber" ReadOnly="true" HeaderText="Booth" SortExpression="Booth" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="judgeData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [JudgeId], [JudgeName], [JudgeLastName], [JPhone], [CompanyName], [Position], [Preference1], [Preference2], [Preference3], [status] FROM [Judges] WHERE (([JudgeId] = ?) OR ([JudgeName] LIKE '%' + ? + '%'))" 
            UpdateCommand="UPDATE [Judges] SET [JudgeName] = ?, [JudgeLastName] = ?, [JPhone] = ?, [CompanyName] = ?, [Position] = ?, [Preference1] = ?, [Preference2] = ?, [Preference3] = ?, [status] = ? WHERE [JudgeId] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtJudgeId" DefaultValue="0" Name="JudgeId" PropertyName="Text" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="txtJudgeName" Name="JudgeName"  DefaultValue="0"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="JudgeName" Type="String" />
                <asp:Parameter Name="JudgeLastName" Type="String" />
                <asp:Parameter Name="JPhone" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="Position" Type="String" />
                <asp:Parameter Name="Preference1" Type="String" />
                <asp:Parameter Name="Preference2" Type="String" />
                <asp:Parameter Name="Preference3" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="JudgeId" Type="Int32" />
            </UpdateParameters>
            
        </asp:AccessDataSource>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:Button ID="Button2" runat="server" Font-Size="Small" 
            Text="Delete All Project Assignments for this Judge" Width="277px" 
            onclick="Button2_Click" Visible="False" />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            DeleteCommand="DELETE FROM [JudgeAssignments] WHERE [AssignmentId] = ?" 
            SelectCommand="SELECT * FROM [JudgeAssignments] WHERE ([JudgeId] = ?)" 
            UpdateCommand="UPDATE [JudgeAssignments] SET [Score] = ? WHERE [AssignmentId] = ?">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="JudgeId" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="AssignmentId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Score" Type="Int32" />
                <asp:Parameter Name="AssignmentId" Type="Int32" />
            </UpdateParameters>
           
        </asp:AccessDataSource>
    </p>
</asp:Content>

