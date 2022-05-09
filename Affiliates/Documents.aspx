<%@ Page Title="" Language="C#" MasterPageFile="~/Affiliates/affiliates.master" AutoEventWireup="true" CodeFile="Documents.aspx.cs" Inherits="Affiliates_Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DSForms" EmptyDataText="There are no data records to display." 
        ForeColor="#333333" GridLines="None" AllowSorting="True" EnableModelValidation="True" CssClass="addform" CellPadding="6">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />                    
           <asp:TemplateField HeaderText="Document Name">
                <ItemTemplate>
                    <asp:Label ID="FormNameLabel" runat="server" Text='<%# GetLink(Eval("FormName"), Eval("File")) %>'></asp:Label>                      
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" SortExpression="UploadDate" />
        </Columns>       
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />     
    </asp:GridView>
    
                   
    <asp:AccessDataSource ID="DSForms" runat="server" DataFile="~/App_Data/isweeep.mdb"  SelectCommand="SELECT [ID], [FormName], [File], [UploadDate] FROM [AffiliateForms]" >
       </asp:AccessDataSource>

</asp:Content>

