<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true"
    CodeFile="Contestants.aspx.cs" Inherits="Contestants" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
#ctl00_cp1_FormView1 {line-height:22px;}
</style>
</asp:Content>
<asp:content runat="server" contentplaceholderid="cp1">
    <b>CONTESTANT INFORMATION FORM<br />
    </b>
    <asp:label id="lblStatus" runat="server" forecolor="Red"></asp:label>
    <br />
    <asp:formview ondatabound="FormView1_DataBound" id="FormView1" runat="server" allowpaging="True"
        datakeynames="ContestantID" datasourceid="AccessDataSource1" onmodechanged="FormView1_ModeChanged">
        <edititemtemplate>
            <table class="style1">
                <tr style="display: none">
                    <td colspan="2">
                        <asp:Label runat="server" ID="ContestantIDLabel" Text='<%# Bind("ContestantID") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Firstname:
                    </td>
                    <td>
                        <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FirstnameTextBox"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Lastname:
                    </td>
                    <td>
                        <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastnameTextBox"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        MI:
                    </td>
                    <td>
                        <asp:TextBox ID="MITextBox" runat="server" Text='<%# Bind("MI") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        DOB:
                    </td>
                    <td>
                        <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DOBTextBox"
                            Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DOBTextBox"
                            Display="Dynamic" ErrorMessage="  Not valid (please use year/month/date format )"
                            ForeColor="Red" ValidationExpression="((19|20)[0-9][0-9])[/]([1-9]|0[1-9]|1[012])[/]([12][0-9]|3[01]|[1-9]|0[1-9])"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Gender:
                    </td>
                    <td>
                        <asp:DropDownList ID="GenderTextBox" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Grade:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddGrade" runat="server" SelectedValue='<%# Bind("grade") %>'>
                            <asp:ListItem Text="Select grade" Value=""></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddGrade"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                   
                    </td>
                </tr>
                <tr>
                    <td>
                        T-Shirt Size:
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("TShirtSize") %>'>
                            <asp:ListItem Text="Select Size" Value=""></asp:ListItem>
                            <asp:ListItem Value="Small">Small</asp:ListItem>
                            <asp:ListItem Value="Medium">Medium</asp:ListItem>
                            <asp:ListItem Value="Large">Large</asp:ListItem>
                            <asp:ListItem Value="X-Large">X-Large</asp:ListItem>
                            <asp:ListItem Value="XX-Large">XX-Large</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        School Name:
                    </td>
                    <td>
                        <asp:TextBox ID="SchoolNameTextBox" runat="server" Text='<%# Bind("SchoolName") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SchoolNameTextBox"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Citizenship:
                    </td>
                    <td>
                        <asp:DropDownList SelectedValue='<%# Bind("Citizenship") %>' class="chosen-select" ID="ddCitizen" runat="server"
                            Width="200px" DataSourceID="AccessDataSource2" DataTextField="Country" DataValueField="Country">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
                            SelectCommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        Street:
                    </td>
                    <td>
                        <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="StreetTextBox"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        City:
                    </td>
                    <td>
                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="CityTextBox"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        State:
                    </td>
                    <td>
                        <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Country:
                    </td>
                    <td>
                        <asp:DropDownList SelectedValue='<%# Bind("Country") %>' ID="DropDownList2" runat="server"
                            Width="150px" DataSourceID="AccessDataSource2" DataTextField="Country" DataValueField="Country">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Zip Code:
                    </td>
                    <td>
                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone:
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
               <tr>
                    <td>
                        Parent Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtParentName" runat="server" Text='<%# Bind("ParentName") %>' />*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtParentName"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        Parent Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtParentEmail" runat="server" Text='<%# Bind("ParentEmail") %>' />*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtParentEmail"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtParentEmail"
                            Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
                    </td>
                    <td>
                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="Cancel" />
                    </td>
                </tr>
            </table>
        </edititemtemplate>
        <itemtemplate>
            <table class="style1">
                <tr>
                    <td>
                        Full Name:
                    </td>
                    <td>
                        <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' />
                        <asp:Label ID="MILabel" runat="server" Text='<%# Bind("MI") %>' />
                        <asp:Label ID="LastnameLabel" runat="server" Text='<%# Bind("Lastname") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Date of birth:
                    </td>
                    <td>
                        <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Gender:
                    </td>
                    <td>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Grade:
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Grade") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        T-Shirt Size:
                    </td>
                    <td>
                        <asp:Label ID="T_ShirtSizeLabel" runat="server" Text='<%# Bind("[TShirtSize]") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        School
                    </td>
                    <td>
                        <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Bind("SchoolName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Citizenship:
                    </td>
                    <td>
                        <asp:Label ID="CitizenshipLabel" runat="server" Text='<%# Bind("Citizenship") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address:
                    </td>
                    <td>
                        <asp:Label ID="StreetLabel" runat="server" Text='<%# Bind("Street") %>' />
                        ,
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone:
                    </td>
                    <td>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                    </td>
                </tr>
                 <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
                 
                <tr>
                <td>
                   Parent's Name:</td>
                <td>
           <asp:Label ID="Label4" runat="server" Text='<%# Bind("ParentName") %>' />
                     <td>
                        </tr><tr>

                    <td>
                        Parent Email:
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ParentEmail") %>' />
                    </td>
                </tr>
                </tr>
            </table>
            <br />
            
            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit Contestant" />
            &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                OnClientClick="javascript:return confirm('Are you sure you want to delete this contestant?')"
                Text="Delete Contestant" />
            <br />
        </itemtemplate>
        <emptydatatemplate>
            There is no contestant added for this project.
        </emptydatatemplate>
        <pagertemplate>
        <br />
            <asp:LinkButton Enabled='<%#(FormView1.DataItemIndex != 0 ) %>' CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server"
                Style="color: black">&lt; Prev</asp:LinkButton>
            <span style="padding-left: 20px; padding-right: 20px; color: green">(Contestant
                <%= FormView1.DataItemIndex +1 %> of <%= FormView1.DataItemCount %>)</span>
            <asp:LinkButton Enabled='<%#(FormView1.DataItemIndex+1 != FormView1.DataItemCount ) %>' CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server"
                Style="color: black">Next &gt;</asp:LinkButton>
        </pagertemplate>
        <pagerstyle backcolor="" forecolor="Black" horizontalalign="Left" />
    </asp:formview>
    <br />
    <asp:button id="btnAdd" runat="server" onclick="btnAdd_Click" text="Add a new contestant"
        width="231px" backcolor="#AACCFF" bordercolor="Gray" borderstyle="Outset" forecolor="Black" />
    <br />
    <asp:label id="lblMessage" runat="server" font-bold="True" forecolor="Blue"></asp:label>
    <asp:accessdatasource id="AccessDataSource1" runat="server" datafile="~/App_Data/isweeep.mdb"
        deletecommand="DELETE FROM [Contestants] WHERE [ContestantID] = ?" 
        selectcommand="SELECT [ContestantID], [Firstname], [Lastname], [MI], [DOB], [Gender],[TShirtSize], [SchoolName], [Citizenship], [Street], [City], [State], [Country], [ZipCode], [Phone], [Email],[Grade],[ParentName],[ParentEmail] FROM [Contestants] WHERE ([pid] = ? and Observer=false) ORDER BY [ContestantID]"
        updatecommand="UPDATE [Contestants] SET [Firstname] = ?, [Lastname] = ?, [MI] = ?, [DOB] = ?, [Gender] = ?, [TShirtSize]=?,[SchoolName] = ?, [Citizenship] = ?, [Street] = ?, [City] = ?, [State] = ?, [Country] = ?, [ZipCode] = ?, [Phone] = ?,[Email]= ?, [Grade]=?,[ParentName]=?,[ParentEmail]=?  WHERE [ContestantID] = ?">
        <selectparameters>
            <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
        </selectparameters>
        <deleteparameters>
            <asp:Parameter Name="ContestantID" Type="Int32" />
        </deleteparameters>
        <updateparameters>
            <asp:Parameter Name="Firstname" Type="String" />
            <asp:Parameter Name="Lastname" Type="String" />
            <asp:Parameter Name="MI" Type="String" />
            <asp:Parameter Name="DOB" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="[TShirtSize]" Type="String" />
            <asp:Parameter Name="SchoolName" Type="String" />
            <asp:Parameter Name="Citizenship" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Grade" Type="Int32" />
            <asp:Parameter Name="ContestantID" Type="Int32" />
            <asp:Parameter Name="ParentName" Type="String" />
            <asp:Parameter Name="ParentEmail" Type="String" />
        </updateparameters>
    </asp:accessdatasource>
    
</asp:content>
