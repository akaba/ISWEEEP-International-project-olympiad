<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QualifiedProjects.aspx.cs"
    Inherits="QualifiedProjects" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Qualified Projects for I-SWEEEP <% =Settings.CurrentYear %></title>
    <script type="text/javascript">
    String.prototype.toTitleCase = function() {
        return this.replace(/([\w&`'‘’"“.@:\/\{\(\[<>_]+-? *)/g, function(match, p1, index, title) {
            if (index > 0 && title.charAt(index - 2) !== ":" &&
            	match.search(/^(a(nd?|s|t)?|b(ut|y)|en|for|i[fn]|o[fnr]|t(he|o)|out|from|vs?\.?|via)[ \-]/i) > -1)
                return match.toLowerCase();
            if (title.substring(index - 1, index + 1).search(/['"_{(\[]/) > -1)
                return match.charAt(0) + match.charAt(1).toUpperCase() + match.substr(2);
            if (match.substr(1).search(/[A-Z]+|&|[\w]+[._][\w]+/) > -1 || 
            	title.substring(index - 1, index + 1).search(/[\])}]/) > -1)
                return match;
            return match.charAt(0).toUpperCase() + match.substr(1);
        });
    };
</script>
</head>
<body>
    <h1 style="font-family: Cambria; font-size: 24pt; font-variant: small-caps">
        Qualified Projects for I-SWEEEP <% =Settings.CurrentYear %></h1>
    <form id="form1" runat="server">
    <div>
        <b>Country:</b>
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
            AutoPostBack="True" DataSourceID="AccessDataSource2" DataTextField="Country" 
            DataValueField="Country" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:DataList EnableViewState="false" ID="DataList1" runat="server" BackColor="White" BorderColor="#DEDFDE"
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="AccessDataSource1"
            ForeColor="Black" GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <AlternatingItemStyle BackColor="White" />
            <ItemStyle BackColor="snow" />
            <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <div style="line-height:20px;padding:5px; font-family: Cambria; font-size: 11pt;border-bottom:1px solid green">
                    <b>Title:</b> <b style="color: maroon">
                        <asp:Label ID="TitleLabel" class="titleText" runat="server" Text='<%# WriteProject( ((System.Data.DataRowView)Container.DataItem)["Title"].ToString() ) %>' /></b>
                    <br />
                    <b>Category:</b>
                    <asp:Label ID="DivisionLabel" runat="server" Text='<%# Eval("Division") %>' />
                    /
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    <b>Country:</b>
                    <asp:Label ID="CountryLabel" runat="server" Text='<%# WritePlace( ((System.Data.DataRowView)Container.DataItem)["Country"].ToString() , ((System.Data.DataRowView)Container.DataItem)["State"].ToString() )  %>' />
                    <br />
                    <b>Contestants:</b>
                    <asp:Label ID="CN1Label" runat="server" Text='<%# WriteContestants( ((System.Data.DataRowView)Container.DataItem)["CN1"].ToString(), ((System.Data.DataRowView)Container.DataItem)["CN2"].ToString() ) %>' />
                  
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [Title], [Division], [Category], [Country], [State], [CN1], [CN2], [CN3] FROM [QualifiedProjects] order by country asc, state asc">
        </asp:AccessDataSource>
        <br />
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
            
            SelectCommand="SELECT distinct [Country] FROM [QualifiedProjects] order by country asc">
        </asp:AccessDataSource>
    </div>
    </form>
</body>
<script type="text/javascript">
    /*var spans = document.getElementsByTagName('span');
    for(var i=0; i< spans.length;++i)
    {
        if (spans[i].className == 'titleText')
            spans[i].innerHTML = spans[i].innerHTML.toTitleCase();
    }*/
</script>
</html>
