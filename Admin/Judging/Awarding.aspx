<%@ Page Language="C#" MasterPageFile="~/Admin/Judging/judge.master" AutoEventWireup="true" CodeFile="Awarding.aspx.cs" Inherits="Admin_Judging_Awarding" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;Page size:<asp:DropDownList ID="DropDownList1" runat="server" 
            AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>
    &nbsp;Filter By Country:
        <asp:DropDownList ID="countryBox" runat="server" AutoPostBack="True" 
            DataSourceID="countries" DataTextField="country" DataValueField="country" 
            ondatabound="countryBox_DataBound" 
            onselectedindexchanged="countryBox_SelectedIndexChanged">
        </asp:DropDownList>
    
        &nbsp; <b>OR</b>
    
        Category:
        <asp:DropDownList ID="categoryList" runat="server" AutoPostBack="True" 
            DataSourceID="categoriesData" DataTextField="category" DataValueField="category" 
            ondatabound="categories_DataBound" 
            onselectedindexchanged="categories_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:GridView  ID="GridView1" runat="server" CellPadding="4" 
            DataSourceID="projectData" ForeColor="#333333" GridLines="None" 
            AllowSorting="True" AllowPaging="True" PageSize="100" 
            AutoGenerateColumns="False">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Booth" HeaderText="Booth" SortExpression="Booth" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="cat" HeaderText="cat" ReadOnly="True" 
                    SortExpression="cat" />
                <asp:BoundField DataField="JCount" HeaderText="JCount" 
                    SortExpression="JCount" />
                <asp:BoundField DataField="Judged" HeaderText="Judged" 
                    SortExpression="Judged" />
                <asp:BoundField DataField="AVScore" HeaderText="AVScore" 
                    SortExpression="AVScore" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:AccessDataSource ID="projectData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM JudgingResults" onselected="projectData_Selected">

        
        </asp:AccessDataSource>
            <br />
           <asp:AccessDataSource ID="countries" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="select distinct country from projects where status='Qualified';">
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="statesDB" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="select distinct state from projects where country=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="countryBox" Name="?" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:AccessDataSource>  
        <asp:AccessDataSource ID="categoriesData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="select * from categories;">
        </asp:AccessDataSource>
    </p>
</asp:Content>

