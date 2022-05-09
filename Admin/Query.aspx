<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Query.aspx.cs" Inherits="Admin_Query" Title="Queries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">      

<asp:Panel ID="Panel1" runat="server" >
        <asp:DropDownList ID="DropDownList1" runat="server" class="chosen-select"  DataSourceID="AccessDataSource1"
            DataTextField="name" DataValueField="id" 
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Export to Excel" CssClass="btn-primary" />
        &nbsp;&nbsp;
        <asp:Label ForeColor="Blue" ID="records" runat="server"></asp:Label>
         <a target="_blank" href="EmailLists.aspx"  class="btn btn-default" >Email Lists</a> 
           <a target="_blank" href="FinishedTravels.aspx"  class="btn btn-default">Finished Travels</a>
           <a target="_blank" href="ApplicationTypes.aspx"  class="btn btn-default">Invited Projects</a>    
        <br />
        
        <br />
    </asp:Panel>
    <asp:GridView class="grid" ID="GridView1" runat="server" 
        AutoGenerateColumns="False" EnableViewState="False" OnSorting="GridView1_Sorting" 
        ondatabound="GridView1_DataBound" CellPadding="4" 
        EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [Query] order by name"></asp:AccessDataSource>
</asp:Content>
