<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="FinancialApplications.aspx.cs" Inherits="Admin_FinancialApplications" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <b>Financial Aid Applicants<br />
    </b>Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList><br>
    <asp:GridView ID="GridView1" Font-Size="10pt" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource1"  DataKeyNames="ID"
        EnableModelValidation="True" onrowupdating="GridView1_RowUpdating" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            
            <asp:boundfield ReadOnly="true" DataField="ID" HeaderText="ID" 
                SortExpression="ID" Visible="false"></asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="ContestantId" HeaderText="C_Id" 
                SortExpression="ContestantId" Visible="False"></asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="Firstname" HeaderText="FirstName" 
                SortExpression="Firstname"></asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="Lastname" HeaderText="Lastname" 
                SortExpression="Lastname"></asp:boundfield>
            <asp:boundfield  ReadOnly="true" DataField="Income" HeaderText="Income" SortExpression="Income">
            </asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="FatherOccupation" HeaderText="FatherOccup." 
                SortExpression="FatherOccupation"></asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="MotherOccupation" HeaderText="MotherOccup." 
                SortExpression="MotherOccupation"></asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="SchoolName" HeaderText="School" 
                SortExpression="SchoolName">
            </asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="Country" HeaderText="Country" 
                SortExpression="Country"></asp:boundfield>
            <asp:boundfield  ReadOnly="true" DataField="City" HeaderText="City" SortExpression="City">
            </asp:boundfield>
            <asp:boundfield ReadOnly="true"  DataField="pid" HeaderText="pid" SortExpression="pid" 
                Visible="False"></asp:boundfield>
            <asp:hyperlinkfield DataNavigateUrlFields="pid" HeaderText="Prj"
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}" Text="project">
            </asp:hyperlinkfield>
            <asp:hyperlinkfield DataNavigateUrlFields="contestantid" 
                DataNavigateUrlFormatString="financeprojects.aspx?cid={0}" HeaderText="History" 
                Text="History"></asp:hyperlinkfield>
                
            <asp:TemplateField HeaderText="status" SortExpression="status">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                        <asp:listitem>Submitted</asp:listitem>
                        <asp:listitem>Awarded</asp:listitem>
                        <asp:listitem>Not Awarded</asp:listitem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AmountAwarded" SortExpression="AmountAwarded">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" Width="40px" runat="server" Text='<%# Bind("AmountAwarded") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("AmountAwarded") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"  DataFile="~/App_Data/isweeep.mdb" 
        UpdateCommand="UPDATE _financialApplicationQuery SET Status = ?, AmountAwarded = ? WHERE (ID = ?)"
        SelectCommand="SELECT * FROM [_financialApplicationQuery]">
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="AmountAwarded" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>

