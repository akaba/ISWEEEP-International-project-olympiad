<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true" CodeFile="FormStatuses.aspx.cs" Inherits="FormStatuses" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <style>table.dltable td,table.dltable th {padding:5px;border-left:1px solid #a8d36a} table.dltable{border:1px solid #a8d36a}</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="cp1">
        <asp:Label ID="lblRMForm" runat="server" Font-Bold="True" 
            ForeColor="Black"></asp:Label>
        <br />
        <br />
 
        <b><% if (Session["ProjectStatus"].ToString() == "Qualified") Response.Write("Contestant Forms:");%></b><br />
        <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" CellPadding="4" 
            DataSourceID="DSParentForms" ForeColor="#333333" GridLines="Both">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Contestant" SortExpression="firstname">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstname") %>'></asp:Label> <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Code of Conduct Form" 
                    SortExpression="codeOfConduct">
                    <ItemTemplate> <asp:Label ID="codeOfConductLabel" runat="server" Text='<%# Eval("codeOfConduct").ToString() == "True" ?"Submitted":"Your parent needs to submit this form" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Media Release Form" 
                    SortExpression="MediaRelease">
                    <ItemTemplate>
                        <asp:Label ID="MediaReleaseLabel" runat="server" Text='<%# Eval("MediaRelease").ToString() == "True" ?"Submitted":"Your parent needs to submit this form" %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="W9 Form" SortExpression="W9">
                    <ItemTemplate>
                       <asp:Label ID="W9Label" runat="server" Text='<%# Eval("W9").ToString() == "True" ?"Submitted":"Not Submitted" %>' />
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            
        </asp:GridView>

        <asp:AccessDataSource ID="DSParentForms" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="Select firstname, lastname, codeOfConduct, MediaRelease, W9 from contestants where pid = ?">
            <SelectParameters>
                 <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
        <br />
       
   </asp:Content>