<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true" CodeFile="Observer.aspx.cs" Inherits="PersonalInfo" %>

<%@ Register Src="~/DaySelector.ascx" TagName="DaySelector" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function checkDOB(oSrc, args) {
            var days = document.getElementById("DaySelector1_ddDay");
            var months = document.getElementById("DaySelector1_ddMonth");
            var years = document.getElementById("DaySelector1_ddYear");
            if (days.value == "0" || months.value=="0" || years.value=="0") {
                args.IsValid = false;
                //alert("please select day");
            }
        }
        function changeCountry() {
            var citizendd = document.getElementById("<% =ddCitizen.ClientID %>");
            var countrydd = document.getElementById("<% =ddCountry.ClientID %>");
            //if (countrydd.value == "Select Country") 
            {
                countrydd.selectedIndex = citizendd.selectedIndex;
                countrydd.title = "Changed automatically...Make sure this is correct";
                countrydd.style.backgroundColor = "yellow";
            }
            
        }
    </script>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">
   
        <b>OBSERVER STUDENT INFORMATION</b><br />
        This page is for team projects. If there are 3 contestants for the project,
        the 3rd member can be registered here. However, cost of attendance must be paid
        to I-SWEEEP upon arrival.
        <asp:AccessDataSource ID="ProjectsForASV" runat="server"
            DataFile="~/App_Data/isweeep.mdb" SelectCommand="Select pid, projectCode&amp;&quot; -  &quot;&amp;title as project from projects where asvid=? and groupProject=true">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="?" SessionField="asvid" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <asp:Label ID="Message2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        Please, enter the following information:<br />
        Which project does this student belong to?<br />
        &nbsp;Project:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ProjectsForASV"
            DataTextField="project" DataValueField="pid" OnDataBound="DropDownList1_DataBound">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DropDownList1"
            Display="Dynamic" ErrorMessage="Please specify the project this student belongs to?"
            InitialValue="Select project"></asp:RequiredFieldValidator>
        <br />
        <table>
            <tr>
                <td>
                    First name:
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>*
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Middle Initial:
                </td>
                <td>
                    <asp:TextBox ID="txtMName" runat="server" Width="20px"></asp:TextBox>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Last name:
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>*
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 28px">
                    Date of Birth:
                </td>
                <td style="height: 28px">
                    <uc1:DaySelector ID="DaySelector1" runat="server"  />
                    <span style="color: #000000">*</span>
                </td>
                <td style="height: 28px">
                </td>
            </tr>
            <tr>
                <td>
                    Gender:
                </td>
                <td>
                    <asp:DropDownList ID="ddGender" runat="server">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:DropDownList>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddGender"
                        Display="Dynamic" ErrorMessage="Required" InitialValue="Select"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    T-Shirt Size
                </td>
                <td>
                    <asp:DropDownList ID="ddTshirt" runat="server">
                        <asp:ListItem>Select One</asp:ListItem>
                        <asp:ListItem>Small</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                        <asp:ListItem>X-Large</asp:ListItem>
                        <asp:ListItem>XX-Large</asp:ListItem>
                    </asp:DropDownList>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddTshirt"
                        ErrorMessage="Required" InitialValue="Select One"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Citizenship:
                </td>
                <td>
                    <asp:DropDownList onchange="javascript:changeCountry()" AppendDataBoundItems="true"
                        ID="ddCitizen" runat="server" Width="171px" DataSourceID="AccessDataSource2"
                        DataTextField="Country" DataValueField="Country">
                        <asp:ListItem Text="Select Country" Value="Select Country"></asp:ListItem>
                        <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
                        SelectCommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:AccessDataSource>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddCitizen"
                        Display="Dynamic" ErrorMessage="Required" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    School Name:
                </td>
                <td>
                    <asp:TextBox ID="txtSchool" runat="server" Width="245px"></asp:TextBox>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtSchool"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    Please enter your address information below:
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; Street
                </td>
                <td>
                    <asp:TextBox ID="txtStreet" runat="server" Width="243px"></asp:TextBox>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtStreet"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; City
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Width="172px"></asp:TextBox>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCity"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; State
                </td>
                <td>
                    <asp:DropDownList ID="ddState" runat="server">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                        <asp:ListItem Value="CA">California</asp:ListItem>
                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                        <asp:ListItem Value="NY">New York</asp:ListItem>
                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; Country
                </td>
                <td>
                    <asp:DropDownList AppendDataBoundItems="true" ID="ddCountry" runat="server" Width="171px"
                        DataSourceID="AccessDataSource2" DataTextField="Country" DataValueField="Country">
                        <asp:ListItem Text="Select Country" Value="Select Country"></asp:ListItem>
                        <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                    </asp:DropDownList>
                    *
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddCountry"
                        Display="Dynamic" ErrorMessage="Required" InitialValue="Select Country"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; Zip Code
                </td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="171px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Width="171px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save"  />
                </td>
                <td style="height: 21px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
        <span style="color: #000000"></span>
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [Contestants] WHERE ([asvid] = ?) and observer=true">
            <SelectParameters>
                <asp:SessionParameter Name="asvid" SessionField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
        <script>            setVisibility();</script>
   </asp:Content>
