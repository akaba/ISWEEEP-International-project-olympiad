<%@ Page Title="" Language="C#" MasterPageFile="~/contestants/contestant.master" AutoEventWireup="true" CodeFile="ContinuationForm.aspx.cs" Inherits="ContinuationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       b{color:Blue;font-weight:bold;}
       .baslik{text-transform:uppercase;font-weight:bold}
       .style1 td{padding:6px;border-bottom:1px dashed white;border-left:1px dashed white}
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
   <span class="baslik"> CONTINUATION FORM</span> <br />
    <br />
    List the new components of your current work and the differences from previous year:

<asp:FormView 
        ID="FormView1"  runat="server" DataKeyNames="pid" 
        DataSourceID="AccessDataSource1" ondatabound="FormView1_DataBound">
        <EditItemTemplate>
            <br>
( Please save this page at least in every 15 minutes while editing to avoid loosing information due to session timeout. )
<br>
             <table class="style1">
               <tr>
                    <td>
                     <asp:Label Visible="false" ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' />
                
                        <b>Current Title:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="CurrentTitleTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ToolTip="You can  edit current title only from Project Information page" Enabled="false" BackColor="LightYellow" ID="CurrentTitleTextBox" runat="server" Rows="2" 
                            Text='<%# Bind("CurrentTitle") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                    <td>
                        <b>Previous Title:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="PreviousTitleTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousTitleTextBox" runat="server" Rows="2" 
                            Text='<%# Bind("PreviousTitle") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                    
                </tr>
                <tr>
                    <td>
                        <b>Current Main Theme:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" ControlToValidate="CurrentMainThemeTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentMainThemeTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentMainTheme") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                    <td>
                        <b>Previous Main Theme:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                            runat="server" ControlToValidate="PreviousMainThemeTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousMainThemeTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousMainTheme") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                </tr>
                <tr>
                    <td>
                        <b>Current Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="CurrentObjectivesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentObjectivesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentObjectives") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                    
                    <td>
                        <b>Previous Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ControlToValidate="PreviousObjectivesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousObjectivesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousObjectives") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                </tr>
                <tr>
                    <td>
                        <b>Current Variables:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                            runat="server" ControlToValidate="CurrentVariablesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentVariablesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentVariables") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                    <td>
                        <b>Previous Variables:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" 
                            runat="server" ControlToValidate="PreviousVariablesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousVariablesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousVariables") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                </tr>
                <tr>
                    <td>
                        <b>Additional Changes:<br />
                        <asp:TextBox ID="AdditionalChangesTextBox" runat="server" Height="163px" 
                            Rows="4" Text='<%# Bind("AdditionalChanges") %>' TextMode="MultiLine" 
                            Width="250px" />
                        </b></td>
                    <td>
                        
                        &nbsp;</td>
                   
                </tr>
                <tr>
                <td colspan="2">
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
                &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </td>
                </tr>
            </table>
            
        </EditItemTemplate>
        <InsertItemTemplate>
            
            <br>
( Please save this page at least in every 15 minutes while editing to avoid loosing information due to session timeout. )
<br>
            <asp:TextBox Visible="false" ID="pidTextBox" runat="server" Text='<%# Bind("pid") %>' />
            
            
             <asp:Label ID="pidLabel1" runat="server" Text='<%# Eval("pid") %>' 
                Visible="false" />
            
            
             <table class="style1">
                <tr>
                    <td>
           
                        <b>Current Title:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="CurrentTitleTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox BackColor="LightYellow" ID="CurrentTitleTextBox" runat="server" Rows="2" 
                            Text='<%# Bind("CurrentTitle") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                    <td>
                        <b>Previous Title:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="PreviousTitleTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousTitleTextBox" runat="server" Rows="2" 
                            Text='<%# Bind("PreviousTitle") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                    
                </tr>
                <tr>
                    <td>
                        <b>Current Main Theme:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                            runat="server" ControlToValidate="CurrentMainThemeTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentMainThemeTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentMainTheme") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                    <td>
                        <b>Previous Main Theme:<asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                            runat="server" ControlToValidate="PreviousMainThemeTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousMainThemeTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousMainTheme") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                </tr>
                <tr>
                    <td>
                        <b>Current Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="CurrentObjectivesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentObjectivesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentObjectives") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                    
                    <td>
                        <b>Previous Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ControlToValidate="PreviousObjectivesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousObjectivesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousObjectives") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                </tr>
                <tr>
                    <td>
                        <b>Current Variables:<asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                            runat="server" ControlToValidate="CurrentVariablesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="CurrentVariablesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("CurrentVariables") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                   
                    <td>
                        <b>Previous Variables:<asp:RequiredFieldValidator ID="RequiredFieldValidator8" 
                            runat="server" ControlToValidate="PreviousVariablesTextBox" Display="Dynamic" 
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="PreviousVariablesTextBox" runat="server" Rows="4" 
                            Text='<%# Bind("PreviousVariables") %>' TextMode="MultiLine" Width="300" />
                        </b></td>
                  
                </tr>
                <tr>
                    <td>
                        <b>Additional Changes:<br />
                        <asp:TextBox ID="AdditionalChangesTextBox" runat="server" Height="163px" 
                            Rows="4" Text='<%# Bind("AdditionalChanges") %>' TextMode="MultiLine" 
                            Width="250px" />
                        </b></td>
                    <td>
                        
                        &nbsp;</td>
                   
                </tr>
                 <tr>
                    <td colspan="3">
                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Save Continuation Form" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
         
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        <b>Current Title:</b></td>
                    <td>
                        
                        <b>Previous Title:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CurrentTitleLabel" runat="server" 
                            Text='<%# Bind("CurrentTitle") %>' />
                    </td>
                    <td>
                       
                        <asp:Label ID="PreviousTitleLabel" runat="server" 
                            Text='<%# Bind("PreviousTitle") %>' />
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Current Main Theme:</b></td>
                    <td>
                        <b>Previous Main Theme:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CurrentMainThemeLabel" runat="server" 
                            Text='<%# Bind("CurrentMainTheme") %>' />
                    </td>
                    <td>
                        
                        <asp:Label ID="PreviousMainThemeLabel" runat="server" 
                            Text='<%# Bind("PreviousMainTheme") %>' />
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Current Objectives:</b></td>
                    <td>
                        
                        <b>Previous Objectives:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CurrentObjectivesLabel" runat="server" 
                            Text='<%# Bind("CurrentObjectives") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PreviousObjectivesLabel" runat="server" 
                            Text='<%# Bind("PreviousObjectives") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Current Variables:</b></td>
                    <td>
                        <b>Previous Variables:</b></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="CurrentVariablesLabel" runat="server" 
                            Text='<%# Bind("CurrentVariables") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PreviousVariablesLabel" runat="server" 
                            Text='<%# Bind("PreviousVariables") %>' />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <b>Additional Changes:</b></td>
                    <td valign="top">
                        
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Label ID="AdditionalChangesLabel" runat="server" 
                            Text='<%# Bind("AdditionalChanges") %>' />
                    </td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit Continuation Form" />
                    </td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
        <EmptyDataTemplate>
            Click to create the continuation form:
            <asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Create Continuation Form" />
        </EmptyDataTemplate>
    </asp:FormView>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br/>
    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        InsertCommand="INSERT INTO ContinuationForms(CurrentTitle, PreviousTitle, CurrentMainTheme, PreviousMainTheme, CurrentObjectives, PreviousObjectives, CurrentVariables, PreviousVariables, AdditionalChanges, pid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT DISTINCT * FROM [ContinuationForms] WHERE ([pid] = ?)" 
        
        UpdateCommand="UPDATE ContinuationForms SET CurrentTitle = ?, PreviousTitle = ?, CurrentMainTheme = ?, PreviousMainTheme = ?, CurrentObjectives = ?, PreviousObjectives = ?, CurrentVariables = ?, PreviousVariables = ?, AdditionalChanges = ? WHERE (pid = ?)" 
        onselected="AccessDataSource1_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="CurrentTitle" Type="String" />
            <asp:Parameter Name="PreviousTitle" Type="String" />
            <asp:Parameter Name="CurrentMainTheme" Type="String" />
            <asp:Parameter Name="PreviousMainTheme" Type="String" />
            <asp:Parameter Name="CurrentObjectives" Type="String" />
            <asp:Parameter Name="PreviousObjectives" Type="String" />
            <asp:Parameter Name="CurrentVariables" Type="String" />
            <asp:Parameter Name="PreviousVariables" Type="String" />
            <asp:Parameter Name="AdditionalChanges" Type="String" />
            <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
                
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CurrentTitle" Type="String" />
            <asp:Parameter Name="PreviousTitle" Type="String" />
            <asp:Parameter Name="CurrentMainTheme" Type="String" />
            <asp:Parameter Name="PreviousMainTheme" Type="String" />
            <asp:Parameter Name="CurrentObjectives" Type="String" />
            <asp:Parameter Name="PreviousObjectives" Type="String" />
            <asp:Parameter Name="CurrentVariables" Type="String" />
            <asp:Parameter Name="PreviousVariables" Type="String" />
            <asp:Parameter Name="AdditionalChanges" Type="String" />
            <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />           
        </UpdateParameters>
    </asp:AccessDataSource>
    <br />
   
&nbsp;
</asp:Content>

