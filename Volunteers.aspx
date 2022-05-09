<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="Volunteers.aspx.cs" Inherits="Volunteer" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Volunteer Registration</title>
    <style type="text/css">
        
        .style1
        {
            width: 122px;
        }
        .style2
        {
            height: 21px;
        }
        .style3
        {
            height: 21px;
            width: 234px;
        }
        .style4
        {
            height: 21px;
            width: 232px;
        }
        .style5
        {
            height: 21px;
            width: 227px;
        }
        .style6
        {
            height: 21px;
            width: 224px;
        }
        .style7
        {
            height: 21px;
            width: 223px;
        }
        .style8
        {
            height: 21px;
            width: 222px;
        }
        .style9
        {
            height: 21px;
            width: 221px;
        }
        .style10
        {
            height: 21px;
            width: 96px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="cp1" runat="server">
<h3>I-SWEEEP Volunteer Registration</h3>
     <p>
            Thank you for being interested in volunteering at I-SWEEEP fair.<br />
            <br />
			
			<asp:label id="lblMessage" runat="server" forecolor="Red" backcolor="yellow"></asp:label>
            Please enter the following information:</p>
        <table>
            <tr>
                <td class="style1">
                    First name:
                </td>
                <td class="style4" colspan="2">
                    <asp:textbox id="txtFirstName" runat="server" width="167px">
                    </asp:textbox>
                </td>
                <td>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="txtFirstName"
                        display="Dynamic" errormessage="Required">
                    </asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Last name:
                </td>
                <td class="style5" colspan="2">
                    <asp:textbox id="txtLastName" runat="server" width="167px">
                    </asp:textbox>
                </td>
                <td class="style3">
                    <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" controltovalidate="txtLastName"
                        display="Dynamic" errormessage="Required">
                    </asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Phone Number:
                </td>
                <td class="style4" colspan="2">
                    <asp:textbox id="txtPhone" runat="server" width="167px">
                    </asp:textbox>
                </td>
                <td>
                    <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" controltovalidate="txtPhone"
                        display="Dynamic" errormessage="Required">
                    </asp:requiredfieldvalidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Email Address:
                </td>
                <td class="style6" colspan="2">
                    <asp:textbox id="txtEmail" runat="server" width="167px">
                    </asp:textbox>
                </td>
                <td class="style2">
                    <asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" controltovalidate="txtEmail"
                        display="Dynamic" errormessage="Required">
                    </asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" controltovalidate="txtEmail"
                        display="Dynamic" errormessage="Invalid email adress" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:regularexpressionvalidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Confirm Email Address:
                </td>
                <td class="style9" colspan="2">
                    <asp:textbox id="txtEmail2" runat="server" width="167px">
                    </asp:textbox>
                </td>
                <td class="style8">
                    <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" controltovalidate="txtEmail2"
                        display="Dynamic" errormessage="Required">
                    </asp:requiredfieldvalidator>
                    <asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" controltovalidate="txtEmail2"
                        display="Dynamic" errormessage="Invalid email adress" validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:regularexpressionvalidator>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    Campus name and/or<br />
&nbsp;referance person:
                </td>
                <td class="style2">
                    <asp:textbox id="txtCampus" width="167px" runat="server">
                    </asp:textbox>
                </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtCampus" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <b>I am willing to volunteer during the following days:</b>
					
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <asp:checkboxlist id="CheckBoxList1" width="700px" runat="server">
                        <asp:listitem style='color: #aa2222'>May 8, 2015, 8:30 AM - 1:00 PM, Public Day</asp:listitem>               
                      
                    </asp:checkboxlist>
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="4">
                    <asp:validationsummary id="ValidationSummary1" runat="server" displaymode="SingleParagraph"
                        forecolor="#E3EAD9" />
                </td>
            </tr>
            <tr>
                <td class="style10">
					 <asp:button id="Button1"  runat="server" onclick="Button1_Click" text="Submit" />
                </td>
                <td class="style7" colspan="2">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
        <asp:accessdatasource id="AccessDataSource1" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT * FROM [Volunteers] WHERE ([VolunteerId] = ?)">
            <selectparameters>
                            <asp:parameter DefaultValue="0" Name="VolunteerId" Type="String" />
                        </selectparameters>
        </asp:accessdatasource>
</asp:Content>
