<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ContestantDetails.aspx.cs" Inherits="Admin_ContestantDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
   
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="412px" 
        AutoGenerateRows="False" CellPadding="4" DataSourceID="AccessDataSource1" 
        ForeColor="#333333" GridLines="None" DataKeyNames="ContestantID" EnableModelValidation="true">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-default" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ContestantID / pid" InsertVisible="False" SortExpression="ContestantID">
                <ItemTemplate>
                    <asp:Label ID="Label1" ReadOnly="True" runat="server" Text='<%# Eval("ContestantID") %>'></asp:Label> /
                     <asp:Label ID="Label2" ReadOnly="True" runat="server" Text='<%# Eval("pid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           
              
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="MI" HeaderText="MI" 
                SortExpression="MI" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" 
                SortExpression="Lastname" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" 
                SortExpression="Gender" />
            <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email" />
            <asp:TemplateField HeaderText="DOB" SortExpression="DOB">
                <EditItemTemplate>
                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Display="Dynamic" ErrorMessage="Required" ControlToValidate="DOBTextBox"></asp:RequiredFieldValidator>
                        
                </EditItemTemplate>              
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName" />
            <asp:CheckBoxField DataField="VisaRequired" HeaderText="VisaRequired" SortExpression="VisaRequired" />
            <asp:BoundField DataField="PassportNumber" HeaderText="PassportNumber" SortExpression="PassportNumber" />
            <asp:BoundField DataField="PassportExpDate" HeaderText="PassportExpDate" 
                SortExpression="PassportExpDate" />
            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" 
                SortExpression="Citizenship" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="isComingWith" HeaderText="Adult Supervisor" SortExpression="isComingWith" ReadOnly="true" />

            <asp:CheckBoxField DataField="CodeofConduct" HeaderText="CodeofConduct" SortExpression="CodeofConduct" />
            <asp:CheckBoxField DataField="MediaRelease" HeaderText="MediaRelease" SortExpression="MediaRelease" />
            <asp:CheckBoxField DataField="RiskForm" HeaderText="RiskForm" SortExpression="RiskForm" />
            <asp:CheckBoxField DataField="W9" HeaderText="W9" SortExpression="W9" />
            <asp:BoundField DataField="TShirtSize" HeaderText="TShirtSize" SortExpression="TShirtSize" />
            <asp:CheckBoxField DataField="observer" HeaderText="observer" SortExpression="observer" />
            <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
            <asp:BoundField DataField="ParentName" HeaderText="ParentName" SortExpression="ParentName" />
            <asp:BoundField DataField="ParentEmail" HeaderText="ParentEmail" SortExpression="ParentEmail" />
            
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>

        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [Contestants] WHERE ([ContestantID] = ?)"      
          UpdateCommand="UPDATE [Contestants] SET [Firstname] = ?, [MI] = ?, [Lastname] = ?, [Gender] = ?, [Email] = ?, [DOB] = ?, [SchoolName] = ?, [VisaRequired] = ?, [PassportNumber] = ?, [PassportExpDate] = ?, [Citizenship] = ?, [Street] = ?, [City] = ?, [State] = ?, [Country] = ?, [ZipCode] = ?, [Phone] = ?, [isComingWith] = ?, [CodeofConduct] = ?, [MediaRelease] = ?, [RiskForm] = ?, [W9] = ?, [TShirtSize] = ?, [observer] = ?, [Grade] = ?, [ParentName] = ?, [ParentEmail] = ? WHERE [ContestantID] = ?">
            <SelectParameters>
             <asp:QueryStringParameter DefaultValue="0" Name="ContestantID" QueryStringField="cid" Type="Int32" />                
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ContestantID" Type="Int32" />
            </DeleteParameters>            
            <UpdateParameters>               
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="MI" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="SchoolName" Type="String" />
                <asp:Parameter Name="VisaRequired" Type="Boolean" />
                <asp:Parameter Name="PassportNumber" Type="String" />
                <asp:Parameter Name="PassportExpDate" Type="String" />
                <asp:Parameter Name="Citizenship" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="isComingWith" Type="Int32" />
                <asp:Parameter Name="CodeofConduct" Type="Boolean" />
                <asp:Parameter Name="MediaRelease" Type="Boolean" />
                <asp:Parameter Name="RiskForm" Type="Boolean" />
                <asp:Parameter Name="W9" Type="Boolean" />
                <asp:Parameter Name="TShirtSize" Type="String" />
                <asp:Parameter Name="observer" Type="Boolean" />
                <asp:Parameter Name="Grade" Type="Int32" />
                <asp:Parameter Name="ParentName" Type="String" />
                <asp:Parameter Name="ParentEmail" Type="String" />               
                <asp:QueryStringParameter Name="ContestantID" QueryStringField="cid" Type="Int32" />                    
            </UpdateParameters>
    </asp:AccessDataSource>

</asp:Content>

