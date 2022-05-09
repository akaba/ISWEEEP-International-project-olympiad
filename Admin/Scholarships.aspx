<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
    CodeFile="Scholarships.aspx.cs" Inherits="Admin_Scholarships" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">
    <p>
        Set Scholarship status:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pid" DataSourceID="AccessDataSource1"
            ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:BoundField ReadOnly="true" DataField="projectCode" HeaderText="Code" SortExpression="projectCode" />
                <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True"
                    SortExpression="pid" />
                <asp:BoundField ReadOnly="true" DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField ReadOnly="true" DataField="state" HeaderText="state" SortExpression="state" />
                <asp:TemplateField HeaderText="scholarship" SortExpression="scholarship">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Dr1" runat="server" SelectedValue='<%# Bind("scholarship") %>'>
                        <asp:ListItem Value="" Text=""></asp:ListItem><asp:ListItem>Awarded</asp:ListItem><asp:ListItem>Not Awarded</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("scholarship") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="Select projectCode, pid, title, state, scholarship from projects where country=&quot;UNITED STATES&quot; AND applicationType=&quot;Recommended&quot; and status=&quot;Qualified&quot;"
            UpdateCommand="Update projects set scholarship=? where pid=?">
            <UpdateParameters>
                <asp:Parameter Name="Scholarship" Type="String" />
                <asp:Parameter Name="pid" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </p>
</asp:Content>
