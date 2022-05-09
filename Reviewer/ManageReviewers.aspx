<%@ Page Title="" Language="C#" MasterPageFile="~/Reviewer/reviewer.master" AutoEventWireup="true" CodeFile="ManageReviewers.aspx.cs" Inherits="Reviewer_ManageReviewers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menu" Runat="Server">
    <a class="menu" href="newReviewer.aspx">New reviewer</a> 
    <a class="menu" href="manageReviewers.aspx">Manage Reviewers</a> 
    <br/>
    <a class="menu" href="SelectProjects.aspx">Select Projects</a> 
     <a class="menu" href="projects.aspx">Review Projects</a> 
     <a class="menu" href="Logout.aspx">Log out</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    <b>Manage Reviewers</b>
    
    <br />


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="reviewersDS" ForeColor="#333333" 
        GridLines="None" EnableModelValidation="True" PageSize="27">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:Button>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:Button>
                   
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete this reviewer?')"
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" Visible="False" />
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" Width="100px" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Passw" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" Width="80px" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Affiliate" SortExpression="Affiliate">
                <EditItemTemplate>
                    <asp:TextBox Width="80px" ID="TextBox3" runat="server" Text='<%# Bind("Affiliate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Affiliate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox Width="90px" ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Area" SortExpression="Area">
                <EditItemTemplate>
                    <asp:TextBox Width="80px" ID="TextBox5" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AssignedCountry" SortExpression="AssignedCountry">                
                <EditItemTemplate>
                    <asp:DropDownList Width="150px" ID="ddCountries" runat="server" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("AssignedCountry") %>' DataSourceID="countryList" 
                        DataTextField="country" DataValueField="country" class="chosen-select"
                        ondatabound="ddCountries_DataBound">
                        <asp:ListItem Value="" Text="Select one"></asp:ListItem>
                        </asp:DropDownList>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCountry" runat="server" Text='<%# Bind("AssignedCountry") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="AssignedState" SortExpression="AssignedState"> 
              
                <EditItemTemplate>
                    <asp:DropDownList Width="130px" ID="ddStates" runat="server" AppendDataBoundItems="true"
                        SelectedValue='<%# Bind("AssignedState") %>' DataSourceID="stateList" 
                        DataTextField="state" DataValueField="state" class="chosen-select">                      
                        <asp:ListItem Value="" Text="Select One"></asp:ListItem>                       
                        </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelState" runat="server" Text='<%# Bind("AssignedState") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="AssignedCategory" SortExpression="AssignedCategory">               
                <EditItemTemplate>
                    <asp:DropDownList ID="ddCategory" OnPreRender="renderCategory" 
                        SelectedValue='<%# Bind("AssignedCategory") %>' runat="server" oninit="ddCategory_Init">
                        
                        <asp:ListItem Value="">Select One</asp:ListItem>
                        <asp:ListItem>Engineering</asp:ListItem>
                        <asp:ListItem>Energy</asp:ListItem>
                        <asp:ListItem>Environment- Management & Pollution</asp:ListItem>
                        <asp:ListItem>Environment- Health & Disease Prevention</asp:ListItem>                    
                        </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelCategory" runat="server" Text='<%# Bind("AssignedCategory") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:CheckBoxField DataField="ReviewAdmin" HeaderText="Admin" 
                SortExpression="ReviewAdmin" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        
    </asp:GridView>
    <asp:AccessDataSource ID="reviewersDS" runat="server" 
        ConflictDetection="CompareAllValues" DataFile="~/App_Data/isweeep.mdb" 
        DeleteCommand="DELETE FROM [Reviewers] WHERE [ID] = ? AND (([Name] = ?) OR ([Name] IS NULL AND ? IS NULL)) AND (([Password] = ?) OR ([Password] IS NULL AND ? IS NULL)) AND (([Affiliate] = ?) OR ([Affiliate] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Area] = ?) OR ([Area] IS NULL AND ? IS NULL)) AND (([AssignedCountry] = ?) OR ([AssignedCountry] IS NULL AND ? IS NULL)) AND [ReviewAdmin] = ?" 
        InsertCommand="INSERT INTO [Reviewers] ([ID], [Name], [Password], [Affiliate], [Email], [Area], [AssignedCountry], [ReviewAdmin]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Reviewers] ORDER BY [Name]" 
        UpdateCommand="UPDATE [Reviewers] SET [Name] = ?, [Password] = ?, [Affiliate] = ?, [Email] = ?, [Area] = ?, [AssignedCountry] = ?, [AssignedState] = ?, [AssignedCategory] = ?, [ReviewAdmin] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Affiliate" Type="String" />
            <asp:Parameter Name="original_Affiliate" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Area" Type="String" />
            <asp:Parameter Name="original_Area" Type="String" />
            <asp:Parameter Name="original_AssignedCountry" Type="String" />
            <asp:Parameter Name="original_AssignedCountry" Type="String" />
            <asp:Parameter Name="original_ReviewAdmin" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Affiliate" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="AssignedCountry" Type="String" />
            <asp:Parameter Name="ReviewAdmin" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>           
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Affiliate" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Area" Type="String" />
            <asp:Parameter Name="AssignedCountry" Type="String" />
            <asp:Parameter Name="AssignedState" Type="String" />
            <asp:Parameter Name="AssignedCategory" Type="String" />
            <asp:Parameter Name="ReviewAdmin" Type="Boolean" /> 
            <asp:Parameter Name="original_ID" Type="Int32" />         
        </UpdateParameters>
    </asp:AccessDataSource>
    
    <asp:AccessDataSource ID="countryList" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [country] FROM [Countries]"></asp:AccessDataSource>

       <asp:AccessDataSource ID="stateList" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT DISTINCT [State] FROM [Projects] WHERE ([Country] = ?)">
           <SelectParameters>
               <asp:Parameter DefaultValue="UNITED STATES" Name="Country" Type="String" />
           </SelectParameters>
    </asp:AccessDataSource>

    <br />
    
</asp:Content>

