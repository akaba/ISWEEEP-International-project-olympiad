<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="EditProjectSupervisor.aspx.cs" Inherits="Admin_EditProjectSupervisor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

    <strong> Project Supervisor:  </strong>

     
    <br />  <br />

         <asp:AccessDataSource ID="projectsvlist" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT SVID, SVName +' ' + SVLastName as sup FROM ProjectSupervisors"></asp:AccessDataSource>

    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="500px" EnableModelValidation="True" DataSourceID="ProjectSV" AutoGenerateRows="False" CellPadding="4" DataKeyNames="SVID" 
        OnItemUpdated="DetailsView1ItemUpdated" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />        
        <FieldHeaderStyle BackColor="#E9ECF1" ForeColor="Black" Font-Bold="True" /> 
        <Fields>
                   <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-default" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="SVID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="SVID" />
            <asp:BoundField DataField="SVName" HeaderText="Name" SortExpression="SVName" />
            <asp:BoundField DataField="SVLastName" HeaderText="LastName" SortExpression="SVLastName" />
            <asp:TemplateField HeaderText="Email" SortExpression="SVemail">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("SVemail") %>' Width="250"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                 
                       </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SVemail") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SVemail") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>



    <asp:AccessDataSource ID="ProjectSV" runat="server" DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT [SVID], [SVName], [SVLastName], [SVemail] FROM [ProjectSupervisors] WHERE ([SVID] = ?)" 
        UpdateCommand="UPDATE [ProjectSupervisors] SET [SVName] = ?, [SVLastName] = ?, [SVemail] = ? WHERE [SVID] = ?">
        <SelectParameters>
            <asp:QueryStringParameter Name="SVID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SVName" Type="String" />
            <asp:Parameter Name="SVLastName" Type="String" />
            <asp:Parameter Name="SVemail" Type="String" />
            <asp:QueryStringParameter Name="SVID" QueryStringField="id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>


       

</asp:Content>

