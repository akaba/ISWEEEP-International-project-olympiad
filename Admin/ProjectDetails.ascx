<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectDetails.ascx.cs"
    Inherits="ProjectDetails" %>

<p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
        BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" CellPadding="4" Font-Names="Trebuchet MS" Font-Size="10pt" DataSourceID="AccessDataSource1"
        ForeColor="Black" Font-Bold="True" Width="600px" GridLines="Vertical" style="margin:0px auto">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#FFF7B2" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
        <Fields>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" SortExpression="pid">
            </asp:BoundField>
            <asp:BoundField DataField="ProjectCode" HeaderText="ProjectCode" SortExpression="ProjectCode">
            </asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>        
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
            </asp:BoundField>
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="ApplicationType" HeaderText="ApplicationType" SortExpression="ApplicationType" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
            <asp:TemplateField HeaderText="Contestants">
                <ItemTemplate>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="AccessDataSource2">
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <ItemTemplate>
                           <asp:HyperLink style="font-size:10pt" runat="server" ID="hy1" NavigateUrl='<%# "EditContestant.aspx?cid=" + (Eval("ContestantID")) %>' 
							HeaderText="Contestants" Target="_blank" Text='<%# (Eval("Name").ToString()) %>'>
                            </asp:HyperLink>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="GroupProject" HeaderText="GroupProject" SortExpression="GroupProject">
            </asp:CheckBoxField>
            <asp:CheckBoxField DataField="ElectricityRequired" HeaderText="ElectricityRequired"
                SortExpression="ElectricityRequired" />
            <asp:TemplateField HeaderText="Continuation">
                <ItemTemplate>
                    <asp:CheckBox ID="chk1" Enabled="false" runat="server" Checked='<%# Eval("Continuation") %>'>
                    </asp:CheckBox>
                    &nbsp;Form Submitted:
                    <asp:CheckBox ID="chk5" Enabled="false" runat="server" Checked='<%# Eval("ContinuationFormSubmitted").ToString()=="1" %>'>
                    </asp:CheckBox>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Abstract">
                <ItemTemplate>
                    <asp:Label ID="LabelAbstract" runat="server" Text='<%# GetAbstract(Eval("AbstractSubmitted").ToString(),Eval("pid").ToString() ) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Research Paper" SortExpression="ResearchPaper">
                <ItemTemplate>
                    <asp:Label ID="LabelRPaper" runat="server" Text='<%# link(Eval("ResearchPaper").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="RegionalName" HeaderText="RegionalName" SortExpression="RegionalName" />
            <asp:TemplateField HeaderText="Project Supervisor">
                <ItemTemplate>
                    <asp:Label ID="Labelsvname" runat="server" Text='<%# (Eval("SVName").ToString()) %>'></asp:Label>
                    <asp:Label ID="Labelsvlastname" runat="server" Text='<%# (Eval("SVLastName").ToString()) %>'></asp:Label>
                    &nbsp; /&nbsp; Email:
                    <asp:Label ID="Labelsvemail" runat="server" Text='<%# (Eval("SVemail").ToString()) %>'></asp:Label>
                    &nbsp; /&nbsp; ID:
                    <asp:Label ID="Labelpsvid" runat="server" Text='<%# (Eval("PSVID").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
			<asp:TemplateField HeaderText="Adult Supervisor">
                <ItemTemplate>
                    <asp:Label ID="LabelASV" runat="server" Text='<%# getASV(Eval("asvid").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Risk Data">
                <ItemTemplate>
                    <asp:Label ID="LabelRiskFormData" runat="server" Text='<%# getRiskFormData(Eval("RiskFormData"), Eval("RiskFormSubmitted"), Eval("pid") ) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reviews">
                <ItemTemplate>
                    <asp:Label ID="LabelReviews" runat="server" Text='<%# getReviews(Eval("Reviews"),Eval("pid") ) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <%-- <asp:HyperLinkField DataNavigateUrlFields="pid" DataNavigateUrlFormatString="projectreviews.aspx?pid={0}"
                HeaderText="Reviews" Target="_blank" Text="Reviews"></asp:HyperLinkField>--%>
        </Fields>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
</p>
<p>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [ProjectDetails] WHERE ([pid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT contestantID, firstname + ' ' + lastname as Name FROM [Contestants] WHERE ([pid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
</p>
