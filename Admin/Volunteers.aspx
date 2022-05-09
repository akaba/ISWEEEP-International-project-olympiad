<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
    CodeFile="Volunteers.aspx.cs" Inherits="Admin_Volunteers" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content3" contentplaceholderid="cp1" runat="Server">
    <br />
    Number of Volunteers&nbsp; :
<asp:label id="Label1" runat="server" text="Label"></asp:label>
Page Size:
        <asp:dropdownlist id="DropDownList1" runat="server" autopostback="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:listitem>10</asp:listitem>
            <asp:listitem>40</asp:listitem>
            <asp:listitem>100</asp:listitem>
            <asp:listitem>1000</asp:listitem>
        </asp:dropdownlist>
<br>
<asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" cellpadding="4"
    datasourceid="AccessDataSource1" allowpaging="True" allowsorting="True" font-size="10pt"
     forecolor="#333333" gridlines="None" EnableModelValidation="True">
    <pagersettings position="TopAndBottom" />
    <EditRowStyle BackColor="#2461BF" />
    <footerstyle backcolor="#507CD1" forecolor="White" font-bold="True" />
    <rowstyle backcolor="#EFF3FB" />
    <columns>
		<asp:boundfield DataField="VolunteerId" HeaderText="Id" 
                SortExpression="VolunteerId"></asp:boundfield>
            <asp:boundfield DataField="Volunteername" HeaderText="Volunteername" 
                SortExpression="Volunteername"></asp:boundfield>
            <asp:boundfield DataField="VolunteerEmail" HeaderText="VolunteerEmail" 
                SortExpression="VolunteerEmail"></asp:boundfield>
            <asp:boundfield DataField="Phone" HeaderText="Phone" SortExpression="Phone">
            </asp:boundfield>
            <asp:boundfield DataField="campus" HeaderText="campus" SortExpression="campus">
            </asp:boundfield>
            <asp:TemplateField HeaderText="VolunteeringTimes" 
                SortExpression="VolunteeringTimes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("VolunteeringTimes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("VolunteeringTimes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    <pagerstyle forecolor="White" horizontalalign="Center" backcolor="#2461BF" />
    <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
    <headerstyle horizontalalign="Left" backcolor="#507CD1" font-bold="True" forecolor="White" />
    <alternatingrowstyle backcolor="White" />
</asp:gridview>
    <asp:accessdatasource id="AccessDataSource1" runat="server" datafile="~/App_Data/isweeep.mdb"
        selectcommand="SELECT VolunteerId, [Volunteername], [VolunteerEmail], [Phone], [VolunteeringTimes], [campus] FROM [Volunteers]"
        onselected="AccessDataSource1_Selected"></asp:accessdatasource>
</asp:content>
