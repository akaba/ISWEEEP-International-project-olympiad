<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/Judging/judge.master"
    AutoEventWireup="true" CodeFile="AssignJudges.aspx.cs" EnableEventValidation="false"
    Inherits="Admin_Judging_AssignJudges" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 900px;
        }
        .style2
        {
            width: 542px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" 
        onasyncpostbackerror="ScriptManager1_AsyncPostBackError">
    </asp:ScriptManager>
    <div style="background-color: black; color: White; font-size: 14pt; border: 2px solid gray;
        text-align: center;">
        Judge Assignments:</div>
    <asp:UpdatePanel  ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <b>Select category first:</b>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="categories"
                DataTextField="Category" DataValueField="Category" OnDataBound="DropDownList2_DataBound"
                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <cc1:Accordion Width="900px" ID="Accordion1" RequireOpenedPane="false" runat="server">
                <ContentTemplate>
                </ContentTemplate>
                <Panes>
                    <cc1:AccordionPane runat="server" ID="acp1">
                        <Header>
                            <div style="cursor: pointer; border: 1px solid black; margin: 2px; background-color: #aaccff;
                                font: bold; color: black">
                                Projects</div>
                        </Header>
                        <Content>
                            <b>Select project or projects to assign judges:<br />
                            </b>
                            <div id="wrapper1" runat="server" style="">
                                <asp:ListBox ID="ListBox1" runat="server" BackColor="#FFFFFF" DataSourceID="projects"
                                    DataTextField="Title" DataValueField="BoothNumber" SelectionMode="Multiple" Width="900px"
                                    Font-Size="9pt" OnDataBound="ListBox1_DataBound"></asp:ListBox>
                            </div>
                        </Content>
                    </cc1:AccordionPane>
                    <cc1:AccordionPane runat="server" ID="acp2">
                        <Header>
                            <div style="cursor: pointer; border: 1px solid black; margin: 2px; background-color: #aaccff;
                                font: bold; color: Black">
                                Judges</div>
                        </Header>
                        <Content>
                            <b>Assign a new judge: </b>
                            Page Size:<asp:DropDownList ID="PageList" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="PageList1_SelectedIndexChanged">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>40</asp:ListItem>
                                <asp:ListItem>100</asp:ListItem>
                                <asp:ListItem>1000</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;
                            <asp:CheckBox AutoPostBack="true" ID="CheckBox1" Checked="True" Text="Show only judges assigned to this category"
                                runat="server" /><br />
                            <asp:GridView Width="900" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="JudgeId" DataSourceID="judges"
                                BackColor="White" BorderColor="#CC9966" OnPageIndexChanging="PageChange"
                                BorderStyle="None" BorderWidth="1px" Font-Size="9pt" OnRowCommand="ListOrAssignProjects">
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <Columns>
                                    <asp:ButtonField  Text="List" CommandName="ListProjects"  ButtonType="Button" HeaderText="Prj" />
                                    <asp:ButtonField HeaderText="Assign" ButtonType="Button" CommandName="AssignJudge" Text="Assign" />
                                    <asp:BoundField DataField="JudgeId" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                                        SortExpression="JudgeId" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
				                    <asp:BoundField DataField="AssignedTo" HeaderText="AssignedTo" SortExpression="AssignedTo" />					
                                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                                    <asp:BoundField DataField="Preference1" HeaderText="Pref1" SortExpression="Preference1" />
                                    <asp:BoundField DataField="Preference2" HeaderText="Pref2" SortExpression="Preference2" />
                                    <asp:BoundField DataField="Preference3" HeaderText="Pref3" SortExpression="Preference3" />
                                    <asp:BoundField DataField="JPhone" HeaderText="JPhone" SortExpression="JPhone" />
                                    <asp:BoundField DataField="projectCount" HeaderText="projectCount" SortExpression="projectCount" />
                                    
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Left" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            </asp:GridView><br />
                            
                            
                        </Content>
                    </cc1:AccordionPane>
                </Panes>
            </cc1:Accordion>
            
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            
            <br />
            Judge #: <asp:Label ID="label2" runat="server" Text=""></asp:Label><br />
            <asp:gridview id="JudgeProjectList" DataSourceID="projectsForJudge" 
                                
                                 runat="server"
                                 cellpadding="4" font-size="9pt"
                                 headerstyle-backcolor="darkslategray"
                                 headerstyle-forecolor="khaki"
                                 rowstyle-backcolor="ivory"
                                 rowstyle-verticalalign="top" AutoGenerateColumns="False" 
                ForeColor="#333333" GridLines="None" >

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" VerticalAlign="Top" />
                <Columns>
                    <asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" 
                        SortExpression="title" />
                    <asp:BoundField DataField="Name" HeaderText="Judge" ReadOnly="True" 
                        SortExpression="name" />
                    <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>

            <table class="style1">
                <tr valign="top">
                    <td style="vertical-align: top" class="style2">
                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add to List Below" />
                        <asp:Button ID="btnRemove" runat="server" OnClick="Button3_Click" 
                            Text="Remove Selected Projects" />
                        <asp:Button ID="btnClear" runat="server" OnClick="Button4_Click" 
                            Text="Clear List" />
                        <br />
                        <b>Selected projects:</b><br />
                        <asp:ListBox ID="ListBox2" runat="server" Height="179px" SelectionMode="Multiple"
                            Width="540px" Font-Size="9pt"></asp:ListBox>
                        <br />
                    </td>
                    <td>
                        <asp:Button ID="btnAssigned" runat="server" OnClick="Button1_Click" 
                            Text="List judges already assigned for the selected project" 
                            Width="320px" /><br />

                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataKeyNames="assignmentId" DataSourceID="judgesForproject" 
                            ForeColor="#333333" GridLines="None" onrowdeleted="GridView2_RowDeleted" 
                            OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="620">
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="Remove" 
                                    ShowDeleteButton="True" />
                                <asp:BoundField DataField="title" HeaderText="title" ReadOnly="True" 
                                    SortExpression="title" />
                                <asp:BoundField DataField="Name" HeaderText="Judge" ReadOnly="True" 
                                    SortExpression="Name" />
                                <asp:BoundField DataField="JudgeId" HeaderText="JudgeId" 
                                    SortExpression="JudgeId" />
                                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
                                <asp:BoundField DataField="category" HeaderText="category" ReadOnly="True" 
                                    SortExpression="category" />
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <EmptyDataTemplate>
                                No judges for this project yet
                            </EmptyDataTemplate>
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr valign="top">
                    <td rowspan="3" style="text-align: left" valign="top">
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>&nbsp;</td>
                    <td>
                        
                    </td>
                </tr>
                
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <br />
    <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="10" AssociatedUpdatePanelID="UpdatePanel1"
        runat="server" Visible="True">
        <ProgressTemplate>
            <div id="loading" style="position: absolute; border: 2px solid yellow; color: Black;
                font-weight: bold; z-index: 300; top: 419px; left: 502px; background-color: #aaccff;
                height: 34px; width: 99px;">
                Loading...
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <%--<cc1:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
        HorizontalSide="Right" VerticalSide="Top" HorizontalOffset="0"
     TargetControlID="UpdateProgress1">
    </cc1:AlwaysVisibleControlExtender>--%>
    
    <asp:AccessDataSource ID="projects" runat="server" SelectCommand="SELECT * FROM [Judging_Projects] WHERE ([category] = ?) order by BoothNumber asc"
        DataFile="~/App_Data/isweeep.mdb">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="category" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="judges" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT JudgeId, Name, [AssignedTo], [Position], Preference1, Preference2, Preference3, JPhone, ProjectCount FROM AvaliableJudges where JudgeId=0">
        
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="categories" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT [Category] FROM [categories]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AssignmentData" runat="server" DataFile="~/App_Data/isweeep.mdb"
        DeleteCommand="DELETE FROM [JudgeAssignments] WHERE [AssignmentId] = ?" InsertCommand="INSERT INTO [JudgeAssignments] ([AssignmentId], [JudgeId], [BoothNumber], [Score]) VALUES (?, ?, ?, ?)"
        SelectCommand="SELECT * FROM [JudgeAssignments]" UpdateCommand="UPDATE [JudgeAssignments] SET [JudgeId] = ?, [BoothNumber] = ?, [Score] = ? WHERE [AssignmentId] = ?">
        <DeleteParameters>
            <asp:Parameter Name="AssignmentId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="JudgeId" Type="Int32" />
            <asp:Parameter Name="BoothNumber" Type="String" />
            <asp:Parameter Name="Score" Type="Int32" />
            <asp:Parameter Name="AssignmentId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="AssignmentId" Type="Int32" />
            <asp:Parameter Name="JudgeId" Type="Int32" />
            <asp:Parameter Name="BoothNumber" Type="String" />
            <asp:Parameter Name="Score" Type="Int32" />
        </InsertParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="judgesForproject" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [JudgingAssignmentsQuery] WHERE ([title] = ?)" DeleteCommand="delete from judgeassignments where assignmentId=?">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox2" Name="title" PropertyName="SelectedItem.Text"
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="assignmentId" Type="Int32" />
        </DeleteParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="projectsForJudge" runat="server" DataFile="~/App_Data/isweeep.mdb"
        FilterExpression="JudgeId='{0}'" SelectCommand="SELECT * FROM [JudgingAssignmentsQuery]">
        <FilterParameters>
            <asp:ControlParameter ControlID="label2" PropertyName="Text" />
        </FilterParameters>
    </asp:AccessDataSource>
</asp:Content>
