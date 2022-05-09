<%@ Page MasterPageFile="~/AdultSV/adultSV.master" MaintainScrollPositionOnPostback="true" Language="C#" AutoEventWireup="true" CodeFile="AdultSupervisorInfo.aspx.cs" Inherits="AdultSupervisor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Adult Supervisor Information Page</title>
    <script type="text/javascript">
        function changeCountry() {
            var citizendd = document.getElementById("ctl00_cp1_ddCitizen");
            var countrydd = document.getElementById("ctl00_cp1_ddCountry");
            {
                countrydd.selectedIndex = citizendd.selectedIndex;
                countrydd.title = "Changed automatically...Make sure this is correct";
                countrydd.style.backgroundColor = "yellow";
            }
            setVisibility();

        }
        function setVisibility(){
            var citizendd = document.getElementById("ctl00_cp1_ddCitizen");            
            var tr1 = document.getElementById("Pass1");
            var tr2 = document.getElementById("Pass2");
            if (citizendd.value == "UNITED STATES") {
                tr1.style.display = "none";
                tr2.style.display = "none";
            }
            else {
                tr1.style.display = "";
                tr2.style.display = "";
            }
        
        }
    </script>
<style type="text/css">
        .style1
        {
            height: 19px;
        }
        .style2
        {
            height: 26px;
        }
    </style>
</asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">
   
<b>Adult Supervisor Information</b>
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br />
        <table>
            <tr>
                <td>
                    First name:</td>
                <td class="style7">
            <asp:TextBox ID="txtFirstName" runat="server" Width="169px"></asp:TextBox>*</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
            Last name:</td>
                <td class="style7">
            <asp:TextBox ID="txtLastName" runat="server" Width="167px"></asp:TextBox>*</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
        Gender:</td>
                <td class="style7">
        <asp:DropDownList ID="ddGender" runat="server" Width="100px">
            <asp:ListItem Selected="True">Select</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
        </asp:DropDownList>*
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddGender" Display="Dynamic" ErrorMessage="Required" InitialValue="Select"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td>
                    T-Shirt Size:</td>
                <td>
                    <asp:DropDownList ID="ddTshirt" runat="server" Width="100px">
                        <asp:ListItem>Select One</asp:ListItem>
                        <asp:ListItem>Small</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                        <asp:ListItem>X-Large</asp:ListItem>
                        <asp:ListItem>XX-Large</asp:ListItem>
                    </asp:DropDownList>*
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddTshirt" ErrorMessage="Required" InitialValue="Select One"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    
                    Citizenship:</td>
                <td class="style8">
                <asp:DropDownList onchange="javascript:changeCountry()" AppendDataBoundItems="true" ID="ddCitizen" runat="server" Width="171px"
                        DataSourceID="AccessDataSource2" DataTextField="Country" DataValueField="Country">
                        <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                        <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                    </asp:DropDownList>*
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddCitizen" Display="Dynamic" ErrorMessage="Required" InitialValue=""></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="3">
                     
                    &nbsp;</td>
            </tr> 

             <tr id="Visa1">
                <td>USA VISA<br/>(uncheck if NOT required):</td><td  colspan="2">
                    <asp:CheckBox ID="VisaCheckBox" AutoPostBack="true" OnCheckedChanged="ToggleDone" runat="server"  /><asp:Label ID="LabelVisa" runat="server" Text=""  ForeColor="Red" ></asp:Label>
                </td>
            </tr>

            <tr id="Pass1">
                <td>Passport Number:</td><td  colspan="2">
                <asp:TextBox ID="txtPassportNo" runat="server" Width="168px"></asp:TextBox>
                    <asp:Label ID="lbtxtPassportNo" runat="server" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="txtPassportNo" ></asp:RequiredFieldValidator>
            </td>
            </tr>
             <tr id="Pass2">
                <td>Passport Expiration Date:</td><td  colspan="2">
                <asp:TextBox ID="txtPassportExpDate" runat="server" CssClass="popupDatepicker" ></asp:TextBox>
                    <asp:Label ID="lbtxtPassportExp" runat="server" Text="*"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtPassportExpDate" ></asp:RequiredFieldValidator>

           </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br/><br/>
                     
                    Please enter address information below:</td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; Street</td>
                <td class="style7">
                    <asp:TextBox ID="txtStreet" runat="server" Width="170px"></asp:TextBox>*
                        </td>
                <td>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtStreet" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
                    <tr>
                         
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; City</td>
                <td class="style7">
                    <asp:TextBox ID="txtCity" runat="server" Width="172px"></asp:TextBox>*
                        </td>
                <td>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
                        
                    </tr>
                    <tr>
                         
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; State</td>
                <td class="style7">
                    <asp:TextBox ID="txtState" runat="server" Width="172px"></asp:TextBox>
                        </td>
                <td>
                    &nbsp;</td>
                        
                    </tr>
                    <tr>
                         
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; Country</td>
                <td>
                     
        <asp:DropDownList ID="ddCountry" AppendDataBoundItems="true" runat="server" Width="171px" DataSourceID="AccessDataSource2" DataTextField="Country" DataValueField="Country">
            <asp:ListItem Value="" Selected="True">Select Country</asp:ListItem>
            <asp:ListItem Value="UNITED STATES">UNITED STATES</asp:ListItem>
        </asp:DropDownList>*</td>
                <td>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
                        SelectCommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:AccessDataSource> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="ddCountry" Display="Dynamic" ErrorMessage="Required" 
                        InitialValue="Select Country"></asp:RequiredFieldValidator></td>
                        
                    </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp; ZipCode</td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Phone Number:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Width="171px"></asp:TextBox>*
                        </td>
                <td>
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
			
            <tr>
                <td>
                    Fax Number:</td>
                <td>
                    <asp:TextBox ID="txtFax" runat="server" Width="169px"></asp:TextBox>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td class="style2">
                    Email Address:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="169px"></asp:TextBox>*
                        </td>
                <td class="style2">
                     
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
			
            <tr>
                <td style="height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" /></td>
                <td>
                    &nbsp;</td>
                <td style="height: 21px">
                </td>
            </tr>
                <tr>
                    <td>
            
                    </td>
                </tr>
        </table>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [AdultSupervisors] WHERE ([ASVID] = ?)">
            <SelectParameters>
                <asp:sessionparameter Name="ASVID" SessionField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <script>            setVisibility();</script>
    </asp:Content>
