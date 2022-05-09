<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Abstracts.aspx.cs" Inherits="Admin_Abstracts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Abstract</title>
    <style type="text/css">
        body
        {
            background-color: #B0FF8C;
            font-family: Cambria, Segoe Print;
        }
        b
        {
            color: #e06a3b;
        }
       
        .style3
        {
            font-size: 16pt;
        }
    </style>
        <link href='../admin.css' rel='stylesheet' type='text/css' />
</head>
<body style="text-align:center;margin:0px auto;padding:10px;">
 <div style="width:800px;text-align:left;margin:0px auto;border:6px #00ff00;border-style:groove;padding:18px;background-color:#fff">

   
    

    <form id="form1" runat="server">
        <asp:Label ID="Labelmsg" runat="server" ForeColor="Red" Text=""></asp:Label>

          <asp:Button ID="ButtonEdit" runat="server" class="btn-primary" Text="Edit Abstract" OnClick="ButtonEdit_Click" Visible="False" />
          <asp:Button ID="ButtonSave" runat="server" class="btn-primary" Text="Save Abstract" OnClick="ButtonSave_Click" Visible="False" />

    <h3 class="style2">
        Project Abstract</h3>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [AbstractsByProjects] WHERE ([pid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT [Firstname], [Lastname], [State], [Country] FROM [Contestants] WHERE ([pid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    
    <b>Contestant(s):</b>
   
    <asp:DataList ID="DataList2" runat="server" DataSourceID="AccessDataSource2">
        <ItemTemplate>
            &nbsp; &nbsp;
            <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Eval("Firstname") %>' />
            &nbsp;<asp:Label ID="LastnameLabel" runat="server" Text='<%# Eval("Lastname") %>' />
        </ItemTemplate>
    </asp:DataList>
    
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="AccessDataSource1">
            <ItemTemplate>
               
                    <b>Country: </b>
                    <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                    &nbsp;&nbsp;&nbsp; <b>State: </b>
                    <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                    <br />
                    <br />
                    <h3 style="text-align: left; color: #000000; background-color: ; text-transform: uppercase">
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
                    </h3>
                    <b>Division: </b>
                    <asp:Label ID="DivisionLabel" runat="server" Text='<%# Eval("Division") %>' />
                    &nbsp;&nbsp;&nbsp; <b>Category: </b>
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    <br />
                    <b>Abstract: </b>
                    <asp:Label ID="AbstractLabel" runat="server" Text='<%# Eval("Abstract") %>' />
                    <br />
                
            </ItemTemplate>
        </asp:DataList>
   
        <asp:textbox runat="server" ID="txtAbstract" TextMode="MultiLine" Rows="10"  Height="600px" Width="800px" Font-Size="Small" Visible="False"></asp:textbox>
    </form>
    </div>
    <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/isweeep.mdb"></asp:AccessDataSource>
</body>
</html>
