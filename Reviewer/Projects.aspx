<%@ Page Title="" Language="C#" MasterPageFile="~/Reviewer/reviewer.master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Reviewer_Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
     <a class="menu" href="SelectProjects.aspx">Select Projects</a> 
     <a class="menu" href="projects.aspx">Review Projects</a> 
     <a class="menu" href="Logout.aspx">Log out</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <p style="font-size:10pt">
        <b>Projects</b>:<br />
        Dear <%=Session["ReviewerName"] %>;<br />
        Below are the projects assigned for you to review.
        Please click on a project to see the details.<br />
        Please use the following Excel worksheet for review:
        <a href="PreEliminationCriteria.xlsx" target="_blank">
        Pre-Elimination Criteria</a>
    </p>
    <p>
        <asp:Label runat="server" id="title"></asp:Label>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID"  DataSourceID="AccessDataSource1"
             style="padding:10px" 
            onitemupdated="FormView1_ItemUpdated"  >
            <EditItemTemplate>
                <span style="display:none">
                    ID:<asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                </span>
                <b>Score:</b>
                <asp:TextBox ID="ScoreTextBox" runat="server" 
                    Text='<%# Bind("Score") %>' Width="54px" /><span style="font-size:9pt">[0-50]</span>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ErrorMessage="Score should be between 0-50" ControlToValidate="ScoreTextBox" MaximumValue="50" MinimumValue="0" 
                Display="Dynamic" Type="Integer" ValidationGroup="EditRev"></asp:RangeValidator>    
                <br />
                <b>Comments:</b><br />
                <asp:TextBox ID="CommentsTextBox" runat="server" Height="100px"  Rows="10"
                    Text='<%# Bind("Comments") %>' TextMode="MultiLine" Width="600px" />
                <br />
                Please set the status of the review:
                <asp:DropDownList runat="server" ID="ddStatus" SelectedValue='<%# Bind("Status") %>'>                    
                    <asp:ListItem Value="Not Started"></asp:ListItem>
                    <asp:ListItem Value="In Review"></asp:ListItem>
                    <asp:ListItem Value="Completed"></asp:ListItem>
                </asp:DropDownList>
                
                <br /><br />
                <asp:Button ID="UpdateButton" style="background-color:#00C0FF" runat="server" CausesValidation="True" ValidationGroup="EditRev"
                    CommandName="Update" Text="Update" OnClientClick="if(ctl00_cp1_FormView1_ddStatus.value=='Completed') return confirm('You will not be able to edit this project anymore, Are you sure you want o mark the review as completed?');" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" /> <br /> <br />
            </EditItemTemplate>
            
            
            <ItemTemplate>
                <b>Your Score:</b>
                <asp:Label ID="ScoreLabel" runat="server" Text='<%# Bind("Score") %>' />
                <br />
                <b>Comments:</b>
                <asp:Label ID="CommentsLabel" runat="server" Text='<%# Bind("Comments") %>' />
                <br />
                <b>Status:</b>
                <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                <br /> <br />
                <asp:Button ID="EditButton" style="background-color:#00C0FF" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit Your Review" /> <br /> <br />
                &nbsp;&nbsp;
            </ItemTemplate>
        </asp:FormView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            DeleteCommand="DELETE FROM [Reviews] WHERE [ID] = ?" 
            SelectCommand="SELECT * FROM [Reviews] WHERE (([ReviewerID] = ?) AND ([ProjectID] = ?) )" 
            UpdateCommand="UPDATE [Reviews] SET [Score] = ?, [Comments] = ?, Status=? WHERE [ID] = ?">
            <SelectParameters>
                <asp:SessionParameter Name="ReviewerID" SessionField="Reviewer" Type="Int32" />
                <asp:ControlParameter ControlID="GridView1" Name="ProjectID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Score" Type="Int32" />
                <asp:Parameter Name="Comments" Type="String" />
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            
        </asp:AccessDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pid" 
            DataSourceID="projectDatasource" GridLines="Horizontal" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" 
            BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
            onrowdatabound="GridView1_RowDataBound">
            <RowStyle BackColor="White" ForeColor="#333333" />
            <Columns>
                <asp:CommandField SortExpression="Status" HeaderText="Review"  SelectText="Review" ButtonType="Button" ShowSelectButton="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                
                 <asp:TemplateField HeaderText="Paper" >
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# link(Eval("ResearchPaper").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="pid" DataNavigateUrlFormatString="~/admin/abstracts.aspx?id={0}"
                    HeaderText="Abstract" Target="_blank" Text="Abstract"></asp:HyperLinkField>
                <asp:TemplateField HeaderText="Place" >
                    <ItemTemplate>
                        <asp:Label ID="Place" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                        <asp:Label ID="State" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
				<asp:BoundField DataField="score" HeaderText="Sc" 
                    SortExpression="score" />
				<asp:BoundField DataField="Status" HeaderText="Review-Status" SortExpression="Status"  
                     />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#a8d368" Font-Bold="True"  ForeColor="black" />
        </asp:GridView>
        <asp:AccessDataSource ID="projectDatasource" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="Select pid, Title, ResearchPaper, Country, State, reviews.status, reviews.score from reviews inner join projects on reviews.projectID = projects.pid where reviews.status <> 'Completed' and  reviews.reviewerID=?">
            <SelectParameters>
                <asp:SessionParameter Name="reviewerID" Type="Int32" SessionField="Reviewer" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
</asp:Content>

