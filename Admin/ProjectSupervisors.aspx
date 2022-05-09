<%@ Page MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ProjectSupervisors.aspx.cs" Inherits="Admin_ProjectSupervisors" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">


   <strong>Supervisors and Projects,  </strong> Page Size:  

        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList><br>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="supervisorprojects" AllowSorting="True" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:boundfield DataField="Supervisor" HeaderText="Supervisor" ReadOnly="True" 
                SortExpression="Supervisor"></asp:boundfield>
            <asp:boundfield DataField="Title" HeaderText="Title" SortExpression="Title">
            </asp:boundfield>
            <asp:boundfield DataField="Status" HeaderText="Status" 
                SortExpression="Status"></asp:boundfield>
            <asp:boundfield DataField="Country" HeaderText="Country" 
                SortExpression="Country"></asp:boundfield>
	<asp:boundfield DataField="State" HeaderText="State" 
                SortExpression="State"></asp:boundfield>
	    <asp:HyperLinkField DataNavigateUrlFields="pid" 
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}" Text="Project" />
            
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="supervisorProjectCount" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [supervisor], [Proje sayisi] AS Proje_sayisi FROM [_supervisorProjeSayisi]">
    </asp:AccessDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="supervisorProjectCount" AllowSorting="True" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:boundfield DataField="supervisor" HeaderText="supervisor" 
                SortExpression="supervisor"></asp:boundfield>
            <asp:boundfield DataField="Proje_sayisi" HeaderText="Number Of projects" 
                SortExpression="Proje_sayisi"></asp:boundfield>
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
    </asp:GridView>
    <br />
    <asp:AccessDataSource ID="supervisorprojects" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT * FROM [_SupervisorsAndTheirProjects]">
    </asp:AccessDataSource>
    <br />


</asp:Content>

