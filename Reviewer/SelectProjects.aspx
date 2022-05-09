<%@ Page Title="" Language="C#" MasterPageFile="~/Reviewer/reviewer.master" AutoEventWireup="true" CodeFile="SelectProjects.aspx.cs" Inherits="Reviewer_SelectProjectst" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
     <a class="menu" href="SelectProjects.aspx">Select Projects</a> 
     <a class="menu" href="projects.aspx">Review Projects</a> 
     <a class="menu" href="Logout.aspx">Log out</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">

Below are the projects waiting for reviews. Please select the ones you would like to review:<br />
When you are done, click <a href="Projects.aspx">here</a> to review the selected projects.
    <br />
    Number of Projects in a page:<asp:DropDownList ID="DropDownList1" 
        runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem Selected="True">10</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
        <asp:ListItem>200</asp:ListItem>
    </asp:DropDownList>
	<br>
&nbsp;<asp:Label ID="labMessage" runat="server" Text="" ForeColor ="Red"></asp:Label>
    <asp:GridView ID="gridProjects" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="Pid" DataSourceID="DsProjects" EnableModelValidation="True" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="gridProjects_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button OnClientClick="return confirm('Once you select a project for review, you have to review it. Are you sure?')" ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
               <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# new DataGrabber().toTitleCase(Eval("Title").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="500px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                
             <asp:HyperLinkField DataNavigateUrlFields="pid" DataNavigateUrlFormatString="~/admin/abstracts.aspx?id={0}"
                    HeaderText="Abstract" Target="_blank" Text="Abstract"></asp:HyperLinkField>
            <asp:TemplateField HeaderText="Research paper" InsertVisible="False">
                <ItemTemplate>
                   <asp:Label ID="Label1" runat="server" Text='<%# link(Eval("ResearchPaper").ToString()) %>'></asp:Label>                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" />
            <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#a8d368" Font-Bold="True" ForeColor="black" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>

    <asp:AccessDataSource ID="DsProjects" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT * FROM [ProjectsForReview]" 
        onselecting="DsProjects_Selecting">
        
    </asp:AccessDataSource>


</asp:Content>

