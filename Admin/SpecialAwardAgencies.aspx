<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="SpecialAwardAgencies.aspx.cs" Inherits="Admin_SpecialAwardAgencies" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="AgencyId" 
        DataSourceID="AccessDataSource1">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <columns>
            <asp:boundfield DataField="AgencyId" HeaderText="AgencyId" 
                InsertVisible="False" ReadOnly="True" SortExpression="AgencyId">
            </asp:boundfield>
            <asp:boundfield DataField="AgencyName" HeaderText="AgencyName" 
                SortExpression="AgencyName"></asp:boundfield>
            <asp:boundfield DataField="AgencyDescription" HeaderText="AgencyDescription" 
                SortExpression="AgencyDescription"></asp:boundfield>
            <asp:boundfield DataField="AgencyAddress" HeaderText="AgencyAddress" 
                SortExpression="AgencyAddress"></asp:boundfield>
            <asp:boundfield DataField="CoordinatorName" HeaderText="CoordinatorName" 
                SortExpression="CoordinatorName"></asp:boundfield>
            <asp:boundfield DataField="CPhone" HeaderText="CPhone" SortExpression="CPhone">
            </asp:boundfield>
            <asp:boundfield DataField="CEmail" HeaderText="CEmail" SortExpression="CEmail">
            </asp:boundfield>
            <asp:boundfield DataField="CFAX" HeaderText="CFAX" SortExpression="CFAX">
            </asp:boundfield>
            <asp:boundfield DataField="HeadJudgeName" HeaderText="HeadJudgeName" 
                SortExpression="HeadJudgeName"></asp:boundfield>
            <asp:boundfield DataField="HJPhone" HeaderText="HJPhone" 
                SortExpression="HJPhone"></asp:boundfield>
            <asp:boundfield DataField="HJEmail" HeaderText="HJEmail" 
                SortExpression="HJEmail"></asp:boundfield>
            <asp:boundfield DataField="HJFAX" HeaderText="HJFAX" SortExpression="HJFAX">
            </asp:boundfield>
            <asp:boundfield DataField="AwardDescription" HeaderText="AwardDescription" 
                SortExpression="AwardDescription"></asp:boundfield>
            <asp:boundfield DataField="AwardGivenIn" HeaderText="AwardGivenIn" 
                SortExpression="AwardGivenIn"></asp:boundfield>
        </columns>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [SpecialAwards]">
    </asp:AccessDataSource>
</asp:Content>

