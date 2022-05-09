<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true" CodeFile="AddObserver.aspx.cs" Inherits="AdultSV_AddObserver" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../DaySelector.ascx" TagName="DaySelector" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Observer Students</title>

    <script type="text/javascript">
        
    </script>

    <style type="text/css">
      
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">
        <b>3rd Member Contestant Registration <br />
        </b>This page is for team projects. If there are 3 contestants for the project,
        the 3rd member can be registered here. However, cost of attendance must be paid
        to I-SWEEEP upon arrival.<asp:accessdatasource id="ProjectsForASV" runat="server"
            datafile="~/App_Data/isweeep.mdb" selectcommand="Select pid, projectCode as project from projects where asvid=? and groupProject=true">
            <selectparameters>
                    <asp:SessionParameter DefaultValue="0" Name="asvid" SessionField="asvid" />
                </selectparameters>
        </asp:accessdatasource>
        <br />
        <asp:formview id="FormView1" runat="server" allowpaging="True" datakeynames="ContestantID"
            datasourceid="guestData" oniteminserted="FormView1_ItemInserted" 
            onitemupdated="FormView1_ItemUpdated">
            <edititemtemplate>
                    
                    Please, enter the following information:<br />
                    <table class="style1">
                        <tr>
                       
                            <caption>
                                Which project does this student belong to?<br />
                                Project:<asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="ProjectsForASV" DataTextField="project" DataValueField="pid" 
                                    selectedvalue='<%# Bind("pid") %>'>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                    ControlToValidate="DropDownList1" Display="Dynamic" 
                                    ErrorMessage="Please specify the project this student belongs to?" 
                                    InitialValue="Select project"></asp:RequiredFieldValidator>
                                <br />
                                <td>
                                    First Name:</td>
                                <td>
                                    <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                        Text='<%# Bind("FirstName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                        ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                </td>
                            </caption>
                        </tr>
                        <tr>
                            <td>
                                Last Name:</td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" 
                                    Text='<%# Bind("LastName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator342" runat="server" 
                                    ControlToValidate="LastNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                MI:</td>
                            <td>
                                <asp:TextBox ID="MITextBox" maxlength="1" runat="server" 
                                    Text='<%# Bind("MI") %>' />
                            </td>
                        </tr>
                        <tr>
                    <td>
                        DOB:
                        </td>
                        <td>
                            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                            <asp:RequiredFieldValidator ID="dobvalidator1" runat="server" ControlToValidate="DOBTextBox"
                                Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DOBTextBox"
                                Display="Dynamic" ErrorMessage="  Not valid (please use year/month/date format )"
                                ForeColor="Red" ValidationExpression="((19|20)[0-9][0-9])[/]([1-9]|0[1-9]|1[012])[/]([12][0-9]|3[01]|[1-9]|0[1-9])"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                        <tr>
                            <td>
                                Gender:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Gender") %>' ID="ddGender" runat="server" Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="ddGender" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                Citizenship:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("CitizenShip") %>' AppendDataBoundItems="true" ID="ddCountries" runat="server" DataSourceID="countriesData" 
                                     DataTextField="Country" DataValueField="Country">
                                    <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="ddCountries" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                School name:</td>
                            <td>
                                <asp:TextBox ID="SchoolNameTextbox" runat="server" 
                                    Text='<%# Bind("SchoolName") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" 
                                    ControlToValidate="SchoolNameTextbox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr><td colspan="2">Address Information</td></tr>
                        <tr>
                            <td>
                                Street:</td>
                            <td>
                                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="StreetTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:</td>
                            <td>
                                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="CityTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State:</td>
                            <td>
                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Country:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Country") %>' ID="ddCountry" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="countriesData" DataTextField="Country" DataValueField="Country" >
                                    <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                                    <asp:ListItem Value="UNITED STATES">UNITED STATES</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="ddCountry" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Zip Code:</td>
                            <td>
                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone:</td>
                            <td>
                                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:</td>
                            <td>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidatoremail" runat="server" ControlToValidate="EmailTextBox"
                                    Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                T-Shirt size:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("TShirtSize") %>' ID="ddTshirt" runat="server" Width="100px">
                                    <asp:ListItem>Select One</asp:ListItem>
                                    <asp:ListItem>Small</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>Large</asp:ListItem>
                                    <asp:ListItem>X-Large</asp:ListItem>
                                    <asp:ListItem>XX-Large</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="ddTshirt" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select One" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                Passport No:</td>
                            <td>
                                <asp:TextBox ID="PassportNoTextBox" runat="server" 
                                    Text='<%# Bind("PassportNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport<br />
                                Expiration Date:</td>
                            <td>
                                <asp:TextBox ID="PassportExpDateTextBox" runat="server" 
                                    Text='<%# Bind("PassportExpDate") %>' />
                            </td>
                        </tr>
						<tr>
                            <td>
                                Parent's Email</td>
                            <td>
                                <asp:TextBox ID="PaarentEmailTextBox" runat="server" 
                                    Text='<%# Bind("ParentEmail") %>' />
                            </td>
                        </tr>
                        
                    </table>
                    &nbsp;<br />
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" ValidationGroup="Insert"
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </edititemtemplate>
            <insertitemtemplate>
                    <table class="style1">
                        <tr>
                        <td colspan="2">
                        Which project does this student belong to?
                        
                        </td>
                        </tr>
                        <tr>
                        <td>Project:</td>
                        <td><asp:DropDownList selectedvalue='<%# Bind("pid") %>' ID="DropDownListPID" runat="server" 
                            DataSourceID="ProjectsForASV" DataTextField="project" DataValueField="pid" 
                            >
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                            ControlToValidate="DropDownListPID" Display="Dynamic" 
                            ErrorMessage="Please specify the project this student belongs to?" 
                            InitialValue="Select project"></asp:RequiredFieldValidator>
                         <br />
                         </td>   
                         <tr>
                             <td>
                                 First Name:</td>
                             <td>
                                 <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                     Text='<%# Bind("FirstName") %>' />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                     ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                     ValidationGroup="Insert"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name:</td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" 
                                    Text='<%# Bind("LastName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2as" runat="server" 
                                    ControlToValidate="LastNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                MI:</td>
                            <td>
                                <asp:TextBox ID="MITextBox" runat="server" maxlength="1" 
                                    Text='<%# Bind("MI") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                DOB:(yyyy/mm/dd)
                            </td>
                            <td>
                                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                                <asp:RequiredFieldValidator ID="dobvalidator2" runat="server" 
                                    ControlToValidate="DOBTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ForeColor="Red" ValidationGroup="insert"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="DOBTextBox" Display="Dynamic" 
                                    ErrorMessage="  Not valid (please use year/month/date format )" ForeColor="Red" 
                                    ValidationExpression="((19|20)[0-9][0-9])[/]([1-9]|0[1-9]|1[012])[/]([12][0-9]|3[01]|[1-9]|0[1-9])"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender:</td>
                            <td>
                                <asp:DropDownList ID="ddGender" runat="server" 
                                    SelectedValue='<%# Bind("Gender") %>' Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="ddGender" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Citizenship:</td>
                            <td>
                                <asp:DropDownList ID="ddCountries" runat="server" AppendDataBoundItems="true" 
                                    DataSourceID="countriesData" DataTextField="Country" DataValueField="Country" 
                                    SelectedValue='<%# Bind("CitizenShip") %>'>
                                    <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="ddCountries" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                School name:</td>
                            <td>
                                <asp:TextBox ID="SchoolNameTextbox" runat="server" 
                                    Text='<%# Bind("SchoolName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2er" runat="server" 
                                    ControlToValidate="SchoolNameTextbox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                Address Information</td>
                        </tr>
                        <tr>
                            <td>
                                Street:</td>
                            <td>
                                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="StreetTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:</td>
                            <td>
                                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="CityTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State:</td>
                            <td>
                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Country:</td>
                            <td>
                                <asp:DropDownList ID="ddCountry" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="countriesData" DataTextField="Country" DataValueField="Country" 
                                    SelectedValue='<%# Bind("Country") %>'>
                                    <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                                    <asp:ListItem Value="UNITED STATES">UNITED STATES</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="ddCountry" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Zip Code:</td>
                            <td>
                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone:</td>
                            <td>
                                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:</td>
                            <td>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatoremail" 
                                    runat="server" ControlToValidate="EmailTextBox" Display="Dynamic" 
                                    ErrorMessage="Invalid email address" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                T-Shirt size:</td>
                            <td>
                                <asp:DropDownList ID="ddTshirt" runat="server" 
                                    SelectedValue='<%# Bind("TShirtSize") %>' Width="100px">
                                    <asp:ListItem>Select One</asp:ListItem>
                                    <asp:ListItem>Small</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>Large</asp:ListItem>
                                    <asp:ListItem>X-Large</asp:ListItem>
                                    <asp:ListItem>XX-Large</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="ddTshirt" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select One" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport No:</td>
                            <td>
                                <asp:TextBox ID="PassportNoTextBox" runat="server" 
                                    Text='<%# Bind("PassportNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport<br />
                                Expiration Date:</td>
                            <td>
                                <asp:TextBox ID="PassportExpDateTextBox" runat="server" 
                                    Text='<%# Bind("PassportExpDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Parent's Email</td>
                            <td>
                                <asp:TextBox ID="PaarentEmailTextBox" runat="server" 
                                    Text='<%# Bind("ParentEmail") %>' />
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PaarentEmailTextBox"
                            Display="Dynamic" ErrorMessage="Required" Font-Size="Small" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="PaarentEmailTextBox"
                            Display="Dynamic" ErrorMessage="Invalid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Font-Size="Small" ValidationGroup="Insert"></asp:RegularExpressionValidator>
                              
                              
                            </td>
                        </tr>
                    </table>
                    
                    <br />
                    
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="Insert" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </insertitemtemplate>
            <itemtemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <b>First Name:</b></td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Last Name:</b></td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>MI:</b></td>
                            <td>
                                <asp:Label ID="MILabel" runat="server" Text='<%# Bind("MI") %>' />
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <b>Gender:</b></td>
                            <td>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Citizenship:</b></td>
                            <td>
                                <asp:Label ID="CitizenshipLabel" runat="server" 
                                    Text='<%# Bind("Citizenship") %>' />
                            </td>
                        </tr>
                        <tr><td colspan="2">Address Information:</td></tr>
                         <tr>
                            <td>
                                <b>Street:</b></td>
                            <td>
                                <asp:Label ID="StreetLabel" runat="server" Text='<%# Bind("Street") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>City:</b></td>
                            <td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>State:</b></td>
                            <td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Country:</b></td>
                            <td>
                                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Zip Code:</b></td>
                            <td>
                                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Phone:</b></td>
                            <td>
                                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Email:</b></td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>T-Shirt Size:</b></td>
                            <td>
                                <asp:Label ID="TShirtSizeLabel" runat="server" 
                                    Text='<%# Bind("TShirtSize") %>' />
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <b>Passport Number</b></td>
                            <td>
                                <asp:Label ID="PassportNumberLabel" runat="server" 
                                    Text='<%# Bind("PassportNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Passport<br />
                                Expiration Date</b></td>
                            <td>
                                <asp:Label ID="PassportExpDateLabel" runat="server" 
                                    Text='<%# Bind("PassportExpDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Parent's Email</td>
                            <td>
                                <asp:Label ID="PaarentEmailLabel" runat="server" 
                                    Text='<%# Bind("ParentEmail") %>' />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton CommandName="New" Text="Add New Observer Student" runat="server" ID="AddButton"/>
                    <br />
                    <asp:LinkButton CommandName="Edit" Text="Edit This Student" runat="server" ID="EditButton"/>
                    
                    <br />
                    <asp:LinkButton CommandName="Delete" Text="Delete This Student" runat="server" ID="DeleteButton"/>
                    <br />
                    
                </itemtemplate>
            <pagertemplate>
                <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server"
                    Style="color: black">&lt;&lt; First</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server"
                    Style="color: black">&lt; Prev</asp:LinkButton>
                <span style="padding-left: 20px; padding-right: 20px; color: red">[Record
                    <%= FormView1.DataItemIndex +1 %>
                    of
                    <%= FormView1.PageCount  %>]</span>
                <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server"
                    Style="color: black">Next &gt;</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server"
                    Style="color: black">Last &gt;&gt;</asp:LinkButton>
            </pagertemplate>
            <emptydatatemplate>
               <br />
                     <asp:Button ID="NewButton" runat="server" 
                         CausesValidation="False" CommandName="New"
                    Font-Bold="true" Text=" Add an observer student" />
                </emptydatatemplate>
            <pagersettings nextpagetext="Next" previouspagetext="Previous" />
            <pagerstyle backcolor="white" forecolor="Black" horizontalalign="Left" />
            <headerstyle font-bold="True" forecolor="#0066FF" />
            <headertemplate>
                Add / edit additional observer student(s):
            </headertemplate>
            <editrowstyle font-bold="True" />
        </asp:formview>
        <br />
        <asp:label id="lblMessage" runat="server" font-bold="True" forecolor="Red"></asp:label>
        <asp:accessdatasource id="guestData" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT ContestantID,
            Firstname, Lastname, MI, DOB, Gender,Citizenship, SchoolName, Street, City, State, Country, ZipCode,   
            Phone, Email, TShirtSize, PassportNumber, PassportExpDate,ParentEmail, pid  FROM Contestants 
            WHERE (Observer = true) AND (isComingWith = ?)" deletecommand="DELETE FROM [contestants] WHERE [contestantID] = ?"
            insertcommand="INSERT INTO Contestants( pid, Firstname, Lastname, MI, DOB,  Gender,  Citizenship,SchoolName, 
            Street, City, State, Country, ZipCode, Phone, Email, TShirtSize, PassportNumber, PassportExpDate, ParentEmail,
            isComingWith,  Observer) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, true)" updatecommand="UPDATE Contestants SET pid=? ,Firstname = ?, Lastname = ?, MI = ?, DOB = ?, Gender = ?, 
             Citizenship = ?, SchoolName = ?, Street = ?, City = ?, State = ?, Country = ?, ZipCode = ?,
             Phone = ?,Email = ?,  TShirtSize = ?, PassportNumber = ?, PassportExpDate = ?  , ParentEmail=?
             WHERE (ContestantID = ?)" onupdated="guestData_Updated">
            <selectparameters>
                <asp:sessionparameter Name="isComingWith" SessionField="asvid" Type="Int32" />
            </selectparameters>
            <deleteparameters>
                <asp:Parameter Name="ContestantID" Type="Int32" />
            </deleteparameters>
            <updateparameters>
                <asp:parameter name="pid" type="int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="MI" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Citizenship" Type="String" />
                <asp:Parameter Name="SchoolName" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TShirtSize" Type="String" />
                <asp:Parameter Name="PassportNumber" Type="String" />
                <asp:Parameter Name="PassportExpDate" Type="String" />
                <asp:Parameter Name="ParentEmail" Type="String" />
                <asp:Parameter Name="ContestantID" Type="Int32" />
                
            </updateparameters>
            <insertparameters>
                <asp:Parameter Name="pid" Type="Int32" /> 
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="MI" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="Citizenship" Type="String" />
                <asp:Parameter Name="SchoolName" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="TShirtSize" Type="String" />
                <asp:Parameter Name="PassportNumber" Type="String" />
                <asp:Parameter Name="PassportExpDate" Type="String" />
                <asp:Parameter Name="ParentEmail" Type="String" />
                               
                <asp:SessionParameter Name="iscomingwith" Type="Int32" SessionField="asvid"  />
                
                
            </insertparameters>
        </asp:accessdatasource>
        <br />
        <asp:accessdatasource id="countriesData" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:accessdatasource>
     </asp:Content>
