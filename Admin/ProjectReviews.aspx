<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectReviews.aspx.cs" Inherits="ProjectReviews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <p>
        <b>Reviews for Project:
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </b></p>
    <p>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="AccessDataSource1" 
            CellPadding="4" ForeColor="#333333">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <b>Name:</b>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <b>Score:</b>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Score") %>' />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <b>Status:</b>
                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                <br /><b>Comments:</b>
                <asp:Label ID="CommentsLabel" runat="server" Text='<%# Eval("Comments") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [Name], [Score], [Comments], [Status] FROM [ProjectReviews] WHERE ([ProjectID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProjectID" QueryStringField="pid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
    </div>
    </form>
</body>
</html>
