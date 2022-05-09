<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="FinanceProjects.aspx.cs" Inherits="Admin_FinanceProjects" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataSourceID="AccessDataSource1">
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <columns>
            <asp:boundfield DataField="pName" HeaderText="pName" SortExpression="pName">
            </asp:boundfield>
            <asp:boundfield DataField="pSciencefair" HeaderText="pSciencefair" 
                SortExpression="pSciencefair"></asp:boundfield>
            <asp:boundfield DataField="pYear" HeaderText="pYear" SortExpression="pYear">
            </asp:boundfield>
            <asp:boundfield DataField="pAward" HeaderText="pAward" SortExpression="pAward">
            </asp:boundfield>
        </columns>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [pName], [pSciencefair], [pYear], [pAward] FROM [_FinancialApplicationYapanlar] WHERE ([ContestantID] = ?)">
        <SelectParameters>
            <asp:querystringparameter Name="ContestantID" QueryStringField="cid" 
                Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

