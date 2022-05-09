<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Judges.aspx.cs" Inherits="Admin_Judges" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <br />
    Number of Judges&nbsp; :<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
	Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList><br>
    <asp:GridView ID="GridView1" Font-Size="10pt" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="JudgeId" DataSourceID="AccessDataSource1" ForeColor="#333333" 
        GridLines="None" EnableModelValidation="True" >
        <PagerSettings Position="TopAndBottom" />
        <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <Columns>
            <asp:boundfield DataField="JudgeId" HeaderText="JudgeId" InsertVisible="False" 
                ReadOnly="True" SortExpression="JudgeId" Visible="False"></asp:boundfield>
            <asp:boundfield DataField="JudgeName" HeaderText="Name" 
                SortExpression="JudgeName"></asp:boundfield>
            <asp:boundfield DataField="JudgeLastName" HeaderText="last" 
                SortExpression="JudgeLastName"></asp:boundfield>
            <asp:boundfield DataField="JPhone" HeaderText="JPhone" SortExpression="JPhone">
            </asp:boundfield>
            <asp:boundfield DataField="JEmail" HeaderText="JEmail" SortExpression="JEmail">
            </asp:boundfield>
            <asp:boundfield DataField="CompanyName" HeaderText="Company" 
                SortExpression="CompanyName"></asp:boundfield>
            <asp:boundfield DataField="Position" HeaderText="Position" 
                SortExpression="Position"></asp:boundfield>
            <asp:boundfield DataField="Preference1" HeaderText="Preference1" 
                SortExpression="Preference1"></asp:boundfield>
            <asp:boundfield DataField="Preference2" HeaderText="Preference2" 
                SortExpression="Preference2"></asp:boundfield>
            <asp:boundfield DataField="Preference3" HeaderText="Preference3" 
                SortExpression="Preference3"></asp:boundfield>
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" 
            HorizontalAlign="Left" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [Judges]" 
        onselected="AccessDataSource1_Selected">
    </asp:AccessDataSource>
</asp:Content>

