<%@ Page MasterPageFile="~/FinancialApp/financialApp.master" Language="C#" AutoEventWireup="true" CodeFile="PastProjects.aspx.cs" Inherits="FinancialApp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cp1">
        <b>Step 3 of 4: Science Fair History
            <br />
        </b>
        <br />
        List the science fair organizations that you attended before I-SWEEEP.<br />
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True"  CellPadding="4" DataKeyNames="id"
            DataSourceID="AccessDataSource1"   ForeColor="Black">
            <PagerSettings NextPageText="Next" PreviousPageText="Previous" />
            <EditItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            Project Name:</td>
                        <td>
                            <asp:TextBox ID="pNameTextBox" runat="server" Height="20px" MaxLength="250" 
                                Text='<%# Bind("pName") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="pNameTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Science Fair Name:</td>
                        <td>
                            <asp:TextBox ID="pSciencefairTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pSciencefair") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="pSciencefairTextBox" Display="Dynamic" 
                                ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year:</td>
                        <td>
                            <asp:TextBox ID="pYearTextBox" runat="server" Height="20px" MaxLength="20" 
                                Text='<%# Bind("pYear") %>' Width="79px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="pYearTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Location:&nbsp;</td>
                        <td>
                            <asp:TextBox ID="pLocationTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pLocation") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="pLocationTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Award:</td>
                        <td>
                            <asp:TextBox ID="pAwardTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pAward") %>' Width="400px" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" ForeColor="orange" CausesValidation="True"
                    CommandName="Update" Text="Update" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" ForeColor="orange" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            Project Name:</td>
                        <td>
                            <asp:TextBox ID="pNameTextBox" runat="server" Height="20px" MaxLength="250" 
                                Text='<%# Bind("pName") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="pNameTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Science Fair Name:</td>
                        <td>
                            <asp:TextBox ID="pSciencefairTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pSciencefair") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="pSciencefairTextBox" Display="Dynamic" 
                                ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Year:</td>
                        <td>
                            <asp:TextBox ID="pYearTextBox" runat="server" Height="20px" MaxLength="20" 
                                Text='<%# Bind("pYear") %>' Width="79px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="pYearTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Location:&nbsp;</td>
                        <td>
                            <asp:TextBox ID="pLocationTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pLocation") %>' Width="400px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="pLocationTextBox" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Award:</td>
                        <td>
                            <asp:TextBox ID="pAwardTextBox" runat="server" MaxLength="250" 
                                Text='<%# Bind("pAward") %>' Width="400px" />
                        </td>
                    </tr>
                </table>
                <br />
                
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert project Information" ForeColor="Orange" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel" ForeColor="Orange" />
                </b>
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            <b>Project Name:</b>
                        </td>
                        <td>
                            <asp:Label ID="pNameLabel" runat="server" Text='<%# Bind("pName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Science Fair Name:</b>
                        </td>
                        <td>
                            <asp:Label ID="pSciencefairLabel" runat="server" Text='<%# Bind("pSciencefair") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Year:</b>&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="pYearLabel" runat="server" Text='<%# Bind("pYear") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Location:</b>
                        </td>
                        <td>
                            <asp:Label ID="pLocationLabel" runat="server" Text='<%# Bind("pLocation") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Award:</b>
                        </td>
                        <td>
                            <asp:Label ID="pAwardLabel" runat="server" Text='<%# Bind("pAward") %>' />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit this Project" Font-Bold="True" />
                &nbsp;<br />
                <asp:LinkButton ID="DeleteButton" Font-Bold="true" runat="server" CausesValidation="False"
                    CommandName="Delete" Text="Delete this project" />
                &nbsp;<br />
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Font-Bold="true" Text="Add new project Information" />
            </ItemTemplate>
            <PagerStyle BackColor="white"  ForeColor="Black" HorizontalAlign="Left" />
            <PagerTemplate>
                <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server"
                    Style="color: black">&lt;&lt; First</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server"
                    Style="color: black">&lt; Prev</asp:LinkButton>
                <span style="padding-left: 20px; padding-right: 20px; color: red">[Project
                    <%= FormView1.DataItemIndex +1 %>
                    of
                    <%= FormView1.PageCount  %>]</span>
                <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server"
                    Style="color: black">Next &gt;</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server"
                    Style="color: black">Last &gt;&gt;</asp:LinkButton>
            </PagerTemplate>
            <EmptyDataTemplate>
                <asp:LinkButton ID="NewButton" BackColor="#aaccff" runat="server" CausesValidation="False" CommandName="New"
                    Font-Bold="true" Text="Add new project Information" />
            </EmptyDataTemplate>
            <HeaderStyle Font-Bold="True" ForeColor="Black" />
            <HeaderTemplate>
                
            </HeaderTemplate>
            <EditRowStyle Font-Bold="True" />
        </asp:FormView>
        <p>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
                DeleteCommand="DELETE FROM [Financial_Projects] WHERE [id] = ?" InsertCommand="INSERT INTO [Financial_Projects] ( [contestantId], [pName], [pSciencefair], [pYear], [pLocation], [pAward]) VALUES ( ?, ?, ?, ?, ?, ?)"
                SelectCommand="SELECT * FROM [Financial_Projects] WHERE ([contestantId] = ?)"
                UpdateCommand="UPDATE [Financial_Projects] SET  [pName] = ?, [pSciencefair] = ?, [pYear] = ?, [pLocation] = ?, [pAward] = ? WHERE [id] = ?">
                <SelectParameters>
                    <asp:SessionParameter Name="contestantId" SessionField="FinanceCid" Type="Int32" DefaultValue="0" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pName" Type="String" />
                    <asp:Parameter Name="pSciencefair" Type="String" />
                    <asp:Parameter Name="pYear" Type="String" />
                    <asp:Parameter Name="pLocation" Type="String" />
                    <asp:Parameter Name="pAward" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="contestantId" SessionField="FinanceCid" Type="Int32" />
                    <asp:Parameter Name="pName" Type="String" />
                    <asp:Parameter Name="pSciencefair" Type="String" />
                    <asp:Parameter Name="pYear" Type="String" />
                    <asp:Parameter Name="pLocation" Type="String" />
                    <asp:Parameter Name="pAward" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
        </p>
        <p>
            When you finish editing your science fair history, click <a href="ResearchPlan.aspx">
                here</a> to proceed to last step.</p>

</asp:Content>