<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="FinancialOrganization.aspx.cs" Inherits="FinancialApp_FinancialOrganization" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cp1">
            <b>FINANCIAL AID APPLICATION FOR ORGANIZATIONS<br />
            </b>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/isweeep.mdb" 
                DeleteCommand="DELETE FROM [Financial_Organization] WHERE (([ASVID] = ?) OR ([ASVID] IS NULL AND ? IS NULL))" 
                InsertCommand="INSERT INTO [Financial_Organization] ([ASVID], [OrganizationName], [ContactName], [ContactEmail], [OrganizationAddress], [Proposal], [TravelExpenses]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT * FROM [Financial_Organization]" 
                UpdateCommand="UPDATE [Financial_Organization] SET [OrganizationName] = ?, [ContactName] = ?, [ContactEmail] = ?, [OrganizationAddress] = ?, [Proposal] = ?, [TravelExpenses] = ? WHERE (([ASVID] = ?) OR ([ASVID] IS NULL AND ? IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="ASVID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OrganizationName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactEmail" Type="String" />
                    <asp:Parameter Name="OrganizationAddress" Type="String" />
                    <asp:Parameter Name="Proposal" Type="String" />
                    <asp:Parameter Name="TravelExpenses" Type="String" />
                    <asp:Parameter Name="ASVID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ASVID" Type="Int32" DefaultValue="1" />
                    <asp:Parameter Name="OrganizationName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactEmail" Type="String" />
                    <asp:Parameter Name="OrganizationAddress" Type="String" />
                    <asp:Parameter Name="Proposal" Type="String" />
                    <asp:Parameter Name="TravelExpenses" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
            <br />
            Please fill out the following form to apply for financial aid:
            
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ASVID" 
                DataSourceID="AccessDataSource1" DefaultMode="Insert">
                <EditItemTemplate>
                    ASVID:
                    <asp:Label ID="ASVIDLabel1" runat="server" Text='<%# Eval("ASVID") %>' />
                    <br />
                    OrganizationName:
                    <asp:TextBox ID="OrganizationNameTextBox" runat="server" 
                        Text='<%# Bind("OrganizationName") %>' />
                    <br />
                    ContactName:
                    <asp:TextBox ID="ContactNameTextBox" runat="server" 
                        Text='<%# Bind("ContactName") %>' />
                    <br />
                    ContactEmail:
                    <asp:TextBox ID="ContactEmailTextBox" runat="server" 
                        Text='<%# Bind("ContactEmail") %>' />
                    <br />
                    OrganizationAddress:
                    <asp:TextBox ID="OrganizationAddressTextBox" runat="server" 
                        Text='<%# Bind("OrganizationAddress") %>' />
                    <br />
                    Proposal:
                    <asp:TextBox ID="ProposalTextBox" runat="server" 
                        Text='<%# Bind("Proposal") %>' />
                    <br />
                    TravelExpenses:
                    <asp:TextBox ID="TravelExpensesTextBox" runat="server" 
                        Text='<%# Bind("TravelExpenses") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Organization Name:<br />
                    <asp:TextBox ID="OrganizationNameTextBox" runat="server" 
                        Height="21px" Text='<%# Bind("OrganizationName") %>' Width="464px" />
&nbsp;<br />
                    Contact Name:
                    <asp:TextBox ID="ContactNameTextBox" runat="server"
                        Text='<%# Bind("ContactName") %>' Width="189px" />
                    <br />
                    Contact Email:
                    <asp:TextBox ID="ContactEmailTextBox" runat="server" 
                        Text='<%# Bind("ContactEmail") %>' Width="190px" />
                    <br />
                    Organization Address:<br />
                    <asp:TextBox ID="OrganizationAddressTextBox" runat="server" Height="54px" 
                        Text='<%# Bind("OrganizationAddress") %>' Width="301px" 
                        TextMode="MultiLine" />
                    <br />
                    <br />
                    Proposal:<br />
                    <asp:TextBox ID="ProposalTextBox" runat="server" Height="172px" 
                        Text='<%# Bind("Proposal") %>' Width="471px" TextMode="MultiLine" />
                    <br />
                    <br />
                    Travel Expenses:<asp:TextBox ID="TravelExpensesTextBox" runat="server" 
                        Height="21px" Text='<%# Bind("TravelExpenses") %>' Width="75px" />
                    &nbsp;US dollars<br />
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Save" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ASVID:
                    <asp:Label ID="ASVIDLabel" runat="server" Text='<%# Eval("ASVID") %>' />
                    <br />
                    OrganizationName:
                    <asp:Label ID="OrganizationNameLabel" runat="server" 
                        Text='<%# Bind("OrganizationName") %>' />
                    <br />
                    ContactName:
                    <asp:Label ID="ContactNameLabel" runat="server" 
                        Text='<%# Bind("ContactName") %>' />
                    <br />
                    ContactEmail:
                    <asp:Label ID="ContactEmailLabel" runat="server" 
                        Text='<%# Bind("ContactEmail") %>' />
                    <br />
                    OrganizationAddress:
                    <asp:Label ID="OrganizationAddressLabel" runat="server" 
                        Text='<%# Bind("OrganizationAddress") %>' />
                    <br />
                    Proposal:
                    <asp:Label ID="ProposalLabel" runat="server" Text='<%# Bind("Proposal") %>' />
                    <br />
                    TravelExpenses:
                    <asp:Label ID="TravelExpensesLabel" runat="server" 
                        Text='<%# Bind("TravelExpenses") %>' />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        
</asp:Content>