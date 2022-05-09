<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"  CodeFile="SetStatus.aspx.cs" Inherits="Admin_QuallifyInvited" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">
    <p>
        Set Status for In review Project:</p>
    <p>
    Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList><br>
        <asp:GridView OnRowUpdated="StatusUpdated" ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            CellPadding="4" DataKeyNames="pid" DataSourceID="AccessDataSource1" ForeColor="#333333"
            GridLines="None" AllowPaging="True" PageSize="15" EnableModelValidation="True">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:BoundField ReadOnly="true" DataField="pid" HeaderText="pid" InsertVisible="False"
                     SortExpression="pid" />
                <asp:BoundField ReadOnly="true" DataField="Code" HeaderText="Code" SortExpression="Code" />
                <asp:BoundField ReadOnly="true" DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField ReadOnly="true" DataField="country" HeaderText="country" SortExpression="country" />
                <asp:BoundField ReadOnly="true" DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField ReadOnly="true" DataField="ApplicationType" HeaderText="ApplicationType"
                    SortExpression="ApplicationType" />
                <asp:TemplateField HeaderText="status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Dr1" runat="server" SelectedValue='<%# Bind("status") %>'>
                            <asp:ListItem>In review</asp:ListItem>
                            <asp:ListItem>Qualified</asp:ListItem>
                            <asp:ListItem>Not Qualified</asp:ListItem>
                            <asp:ListItem>Not Coming</asp:ListItem>
                            <asp:ListItem>Waiting List</asp:ListItem>
                            <asp:ListItem>Saved</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="select pid, projectCode as Code, title,country, state,ApplicationType, status from projects where   status=&quot;In Review&quot;"
            UpdateCommand="update projects set status=? where pid=?">
            <UpdateParameters>
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="pid" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </p>
</asp:Content>
