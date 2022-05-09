<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
    CodeFile="Reviews.aspx.cs" Inherits="Admin_Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">  
    <p>

       
       

        Reviewer:<asp:DropDownList ID="DropDownList1" runat="server" class="chosen-select" AutoPostBack="True"
            AppendDataBoundItems="true" DataSourceID="AccessDataSource2" DataValueField="Id"
            DataTextField="Name" Width="180px">
            <asp:ListItem Selected="True" Text="All" Value="-1"></asp:ListItem>
        </asp:DropDownList>
        &nbsp; Project:<asp:DropDownList ID="DropDownList2" runat="server" class="chosen-select" AppendDataBoundItems="true"
            AutoPostBack="True" DataSourceID="AccessDataSource3" DataValueField="ProjectId"
            DataTextField="ProjectId" Width="80px"
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
            <asp:ListItem Selected="True" Text="All" Value="-1"></asp:ListItem>
        </asp:DropDownList>
         <a href='http://www.harmonytx.org/isweeep/reviewer/login.aspx'>ASSIGN REVIEWERS</a>

        <asp:Panel style="display:inline" ID="Panel1" Visible="false" runat="server">
            &nbsp; Change status as:<asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem Selected="True" Text="Select Status" Value="-1"></asp:ListItem>
                <asp:ListItem>Qualified</asp:ListItem>
                <asp:ListItem>Not Qualified</asp:ListItem>
                <asp:ListItem>Waiting List</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Text="Change Status" 
                OnClientClick="javascript:return confirm('Are you sure?')" 
                onclick="Button1_Click" />
            &nbsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>

            
        </asp:Panel>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="AccessDataSource1"
            ForeColor="#333333" GridLines="None" EnableModelValidation="True">
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                
<asp:TemplateField  HeaderText="Comments" SortExpression="Comments">
                    <ItemTemplate>
                        <asp:TextBox width="400" height="150" ID="text1" runat="server" textmode="multiline" Text='<%# (Eval("Comments").ToString()) %>'></asp:textbox>
                    </ItemTemplate>
</asp:TemplateField>
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Division" HeaderText="Division" SortExpression="Division" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT Reviewers.Name, Reviews.Score, Reviews.Comments, 
            Reviews.Status, Projects.Title,
             Projects.Division, Projects.Category 
             FROM ((Reviewers INNER JOIN Reviews ON Reviewers.ID = Reviews.ReviewerID) 
             INNER JOIN Projects ON Reviews.ProjectID = Projects.pid) 
             WHERE (reviewers.ID=?) and ( Reviews.ProjectID=?) ">
            <SelectParameters>
                <asp:ControlParameter DefaultValue="-1" ControlID="DropdownList1" Type="Int32" Name="ID" />
                <asp:ControlParameter DefaultValue="-1" ControlID="DropdownList2" Type="Int32" Name="ProjectID" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT Reviewers.Name, Reviewers.ID from Reviewers"></asp:AccessDataSource>
    </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT Reviews.ProjectID
FROM Projects left JOIN Reviews ON Projects.pid = Reviews.ProjectID
WHERE (((Projects.Status)='In Review'))
ORDER BY Reviews.ProjectID;">
        </asp:AccessDataSource>
    </p>
</asp:Content>
