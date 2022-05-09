<%@ Page Title="Invited Projects" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ApplicationTypes.aspx.cs" Inherits="Admin_ApplicationTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
   
       <strong> Invited Projects:    &nbsp; </strong>
        
        Country:<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
            AppendDataBoundItems="true" DataSourceID="AccessDataSource2" DataValueField="Country"
            DataTextField="Country">
            <asp:ListItem Selected="True" Text="All" Value="-1"></asp:ListItem>
        </asp:DropDownList>
    &nbsp; ApplicationType:<asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true"
            AutoPostBack="True" DataSourceID="AccessDataSource3" DataValueField="ApplicationType"
            DataTextField="ApplicationType">
             <asp:ListItem Selected="True" Text="All" Value="-1"></asp:ListItem>
            
        </asp:DropDownList>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> 
		<a href="CodeAssignment.aspx">Create project code for invitation</a><br/>
   
        &nbsp;<asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            DataSourceID="AccessDataSource1" CellPadding="4" ForeColor="#333333" 
            GridLines="None" EnableModelValidation="True">
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        
            SelectCommand="SELECT Title, Country, RegionalName, Status, ApplicationType FROM [Projects] where (ApplicationType=? and Country=?)" 
            onselected="AccessDataSource1_Selected">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Type="String" Name="ApplicationType" />
                <asp:ControlParameter ControlID="DropDownList1" Type="String" Name="Country" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT distinct Country FROM [Projects] where ApplicationType<>'Individual'"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT distinct Applicationtype FROM [Projects] where ApplicationType<>'Individual'"></asp:AccessDataSource>
    
</asp:Content>

