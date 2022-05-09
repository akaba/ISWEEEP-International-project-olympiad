<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckIn.aspx.cs" Inherits="Admin_CheckIn" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Check IN</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:scriptmanager id="ScriptManager1" runat="server">
            <services>
     <asp:ServiceReference Path="SearchAutoComplete.asmx" />
     </services>
        </asp:scriptmanager>
        Contestant Name:<asp:textbox id="txtContestant" runat="server" width="309px"></asp:textbox>
        <asp:button id="Button1" runat="server" text="Find" onclick="Button1_Click" />
        <br />
        <cc1:AutoCompleteExtender TargetControlID="txtProject" ServicePath="SearchAutoComplete.asmx"
            ServiceMethod="GetCompletionList" EnableCaching="true" CompletionListCssClass="complete"
            MinimumPrefixLength="3" ID="AutoCompleteExtender1" runat="server" CompletionListHighlightedItemCssClass="bold"
            CompletionListItemCssClass="listitem" Enabled="True" CompletionInterval="500"
            CompletionSetCount="12">
        </cc1:AutoCompleteExtender>
        Project Title:<asp:textbox id="txtProject" runat="server" width="344px"></asp:textbox>
        <asp:button id="Button2" runat="server" text="GO" />
        <asp:button id="Button3" runat="server" onclick="Button3_Click" text="Clear" />
        <br />
        <asp:label id="Label1" runat="server"></asp:label>
        <br />
        <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" cellpadding="4"
            datakeynames="ContestantID" datasourceid="AccessDataSource1" forecolor="#333333"
            gridlines="None" EnableModelValidation="True">
            <rowstyle backcolor="#EFF3FB" />
            <columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:HyperLinkField headertext="Cid" DataNavigateUrlFields="ContestantID" DataTextField="ContestantID"
                DataNavigateUrlFormatString="Contestantdetails.aspx?cid={0}" Target="_blank"  />
                 <asp:HyperLinkField DataNavigateUrlFields="pid" DataTextField="pid" headertext="pid" 
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}" Target="_blank"  />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country"  ReadOnly="True" />
                <asp:HyperLinkField  DataNavigateUrlFields="isComingWith" 
                DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}" 
                    DataTextField="isComingWith" SortExpression="isComingWith" HeaderText="ASV" Target="_blank" >
                </asp:HyperLinkField> <asp:CheckBoxField DataField="RiskForm" HeaderText="RiskForm" 
                    SortExpression="RiskForm" />
                <asp:CheckBoxField DataField="MediaRelease" HeaderText="MediaRls" 
                    SortExpression="MediaRelease" />
                <asp:CheckBoxField DataField="CodeofConduct" HeaderText="C.of.Cond." 
                    SortExpression="CodeofConduct" />
                <asp:CheckBoxField DataField="W9" HeaderText="W9" SortExpression="W9" />
            </columns>
            <EditRowStyle BackColor="#2461BF" />
            <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#2461BF" forecolor="White" horizontalalign="Center" />
            <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
            <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="White" />
        </asp:gridview>
        <br />
        <asp:gridview id="GridView2" runat="server" autogeneratecolumns="False" cellpadding="4"
            datakeynames="ContestantID" datasourceid="AccessDataSource2" forecolor="#333333"
            gridlines="None" EnableModelValidation="True">
            <rowstyle backcolor="#EFF3FB" />
            <columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ContestantID" HeaderText="C-ID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ContestantID" />
                 <asp:HyperLinkField DataNavigateUrlFields="pid" DataTextField="pid"
                DataNavigateUrlFormatString="projectinformation.aspx?id={0}" Target="_blank"  />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                    SortExpression="Name" />
                <asp:BoundField DataField="Country" HeaderText="Country" 
                    SortExpression="Country"  ReadOnly="True" />
                <asp:HyperLinkField  DataNavigateUrlFields="isComingWith" 
                DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}" 
                    DataTextField="isComingWith" SortExpression="isComingWith" HeaderText="ASV" Target="_blank" >
                </asp:HyperLinkField> <asp:CheckBoxField DataField="RiskForm" HeaderText="RiskForm" 
                    SortExpression="RiskForm" />
                <asp:CheckBoxField DataField="MediaRelease" HeaderText="MediaRelease" 
                    SortExpression="MediaRelease" />
                <asp:CheckBoxField DataField="CodeofConduct" HeaderText="CodeofConduct" 
                    SortExpression="CodeofConduct" />
                <asp:CheckBoxField DataField="W9" HeaderText="W9" SortExpression="W9" />
            </columns>
            <EditRowStyle BackColor="#2461BF" />
            <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#2461BF" forecolor="White" horizontalalign="Center" />
            <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
            <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="White" />
        </asp:gridview>
        <br />
        <br />
        <asp:accessdatasource id="AccessDataSource2" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [ContestantID], [pid], [Firstname]+' '+[Lastname] as Name, [Country], [W9], [isComingWith], [RiskForm], [MediaRelease], [CodeofConduct] FROM [Contestants] WHERE (pid in (select pid from projects where title LIKE '%' + ? + '%') )"
            updatecommand="UPDATE [Contestants] SET [W9] = ?, [RiskForm] = ?, [MediaRelease] = ?, [CodeofConduct] = ? WHERE [ContestantID] = ?">
            <selectparameters>
                <asp:ControlParameter ControlID="txtproject" Name="Title"  PropertyName="Text" Type="String" />                   
            </selectparameters>
            <updateparameters>
                <asp:Parameter Name="W9" Type="Boolean" />
                <asp:Parameter Name="RiskForm" Type="Boolean" />
                <asp:Parameter Name="MediaRelease" Type="Boolean" />
                <asp:Parameter Name="CodeofConduct" Type="Boolean" />
                <asp:Parameter Name="ContestantID" Type="Int32" />
            </updateparameters>
        </asp:accessdatasource>
        <br />
        <asp:accessdatasource id="AccessDataSource1" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [ContestantID], [pid], [Firstname]+' '+[Lastname] as Name, [Country], [W9], [isComingWith], [RiskForm], [MediaRelease], [CodeofConduct] FROM [Contestants] WHERE ([Firstname]+' '+lastname LIKE '%' + ? + '%')"
            updatecommand="UPDATE [Contestants] SET [W9] = ?, [RiskForm] = ?, [MediaRelease] = ?, [CodeofConduct] = ? WHERE [ContestantID] = ?">
            <selectparameters>
                <asp:ControlParameter ControlID="txtContestant" Name="Firstname" 
                    PropertyName="Text" Type="String" />
            </selectparameters>
            <updateparameters>
                <asp:Parameter Name="W9" Type="Boolean" />
                <asp:Parameter Name="RiskForm" Type="Boolean" />
                <asp:Parameter Name="MediaRelease" Type="Boolean" />
                <asp:Parameter Name="CodeofConduct" Type="Boolean" />
                <asp:Parameter Name="ContestantID" Type="Int32" />
            </updateparameters>
        </asp:accessdatasource>
        <br />
        <%-- <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
            DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
            AutoGenerateColumns="False" DataKeyNames="ContestantID" 
            ondatabound="GridView1_DataBound">
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" ReadOnly="true"/>
                <asp:BoundField DataField="Name" HeaderText="Name" 
                    SortExpression="Name"  ReadOnly="true"/>
                <asp:BoundField DataField="Gender" HeaderText="Gender" ReadOnly="true"
                    SortExpression="Gender" />
                <asp:BoundField DataField="ContestantID" HeaderText="ContestantID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="ContestantID" />
                <asp:BoundField DataField="Country" HeaderText="Country" ReadOnly="true"
                    SortExpression="Country" />
                <asp:BoundField DataField="ASV" HeaderText="ASV" SortExpression="ASV" ReadOnly="true" />
                <asp:CheckBoxField DataField="CodeofConduct" HeaderText="CodeofConduct" 
                    SortExpression="CodeofConduct" />
                <asp:CheckBoxField DataField="MediaRelease" HeaderText="MediaRelease" 
                    SortExpression="MediaRelease" />
                <asp:CheckBoxField DataField="RiskForm" HeaderText="RiskForm" 
                    SortExpression="RiskForm" />
                <asp:CheckBoxField DataField="W9" HeaderText="W9" SortExpression="W9" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            
            SelectCommand="SELECT [pid], [Firstname]+' '+  [Lastname]as Name , [Gender], [ContestantID], [Country], [isComingWith] as ASV, [CodeofConduct], [MediaRelease], [RiskForm], [W9] FROM [Contestants] WHERE( (FirstName+' '+LastName like '%' + ? + '%') OR (  pid in(Select pid from projects where projects.title like '%' + ? + '%')  )  )" 
            onselected="AccessDataSource1_Selected" 
            UpdateCommand="UPDATE Contestants SET CodeofConduct =?, MediaRelease =?, RiskForm =?, W9 =? where contestantId=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtContestant" Type="String" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtProject" Type="String" PropertyName="Text" />
                
                
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CodeofConduct" Type="Boolean" />
                <asp:Parameter Name="MediaRelease" Type="Boolean" />
                <asp:Parameter Name="RiskForm" Type="Boolean" />
                <asp:Parameter Name="W9" Type="Boolean" />
                
            </UpdateParameters>
        </asp:AccessDataSource>
    --%>
    </div>
    </form>
    <style type="text/css">
        .complete
        {
            z-index: 400;
            background-color: Black;
            color: white;
            width: 725px !important;
            margin-left: 0px !important;
            cursor: pointer;
        }
        .bold
        {
            font-weight: bold;
            width: auto !important;
            margin-left: 0px !important;
            margin-top: 10px;
            z-index: 400;
        }
        .listitem
        {
            color: #aaccff;
            z-index: 400;
            margin-top: 10px;
        }
    </style>
</body>
</html>
