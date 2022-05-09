<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AffiliateFroms.aspx.cs" Inherits="Admin_AffiliateFroms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <asp:Label ID="LabelGrid" runat="server" ForeColor="Red" BackColor="White" ></asp:Label>
    <asp:GridView ID="GridView1" runat="server" OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DSForms" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" AllowSorting="True" EnableModelValidation="True" CssClass="addform" CellPadding="6" Width="800px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                   <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                   <asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                   <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="javascript:return confirm('Are you sure you want to delete this file?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />                    
            <asp:TemplateField HeaderText="Document Name">
                <EditItemTemplate>
                    <asp:TextBox ID="FormName" runat="server" Text='<%# Bind("FormName") %>' Width="400"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="FormNameLabel" runat="server" Text='<%# GetLink(Eval("FormName"), Eval("File")) %>'></asp:Label>                      
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                            <EditItemTemplate>
                               <asp:FileUpload ID="FileUpload1" runat="server" />                                               
                            </EditItemTemplate>
                            <ItemTemplate>
                               <asp:Label ID="lblFileUpLoad" runat="server"></asp:Label>
                            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="File" HeaderText="File" SortExpression="File" Visible="False" />
            <asp:BoundField DataField="UploadDate" HeaderText="Upload Date" SortExpression="UploadDate" ReadOnly="True" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" ReadOnly="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />     
    </asp:GridView>
    
                    <table class="addform">
                         <tr>
                            <th colspan="2" style="text-align: left">Add new document</th>
                             
                       </tr>

                       <tr>
                         <td>Name</td>
                        <td>
                            <asp:TextBox ID="TxtFormName" runat="server" Width="400px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>File</td>
                         <td>
                            <asp:FileUpload ID="FileUpload2"  runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr>
                         <td>


                        </td>
                        <td>
                            <asp:Button ID="BtnAddFile" class="btn btn-default" runat="server" OnClick="BtnAddFile_Click" Text="Upload File" />
                            <asp:Button ID="BtnCancel" class="btn btn-default" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
                            <asp:Label ID="LabelAddFile" runat="server" ForeColor="Yellow"></asp:Label>
                        </td>
                    </tr>
                </table>

    <asp:AccessDataSource ID="DSForms" runat="server" DataFile="~/App_Data/isweeep.mdb"  SelectCommand="SELECT * FROM [AffiliateForms]" 
        UpdateCommand="UPDATE AffiliateForms SET FormName = ?, File = ?, UploadDate = ?, Author = ? WHERE (ID = ?)" 
        DeleteCommand="DELETE FROM AffiliateForms WHERE (ID = ?)" >
        <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>                        
                        <asp:Parameter Name="?" />
                        <asp:Parameter Name="?" />
                        <asp:Parameter Name="?" />
                        <asp:Parameter Name="?" /> 
                        <asp:Parameter Name="?" />                       
        </UpdateParameters>
       </asp:AccessDataSource>

</asp:Content>

