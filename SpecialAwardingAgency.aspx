<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="SpecialAwardingAgency.aspx.cs" Inherits="SpecialAwardingAgency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cp1" runat="server">
<h3>I-SWEEEP SPECIAL AWARDING AGENCY REGISTRATION</h3>
          <p>Thank you for being interested in awarding at I-SWEEEP fair.</p>
            <p>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </p>
    <p>
        Please enter the following information:</p>
    <div>
    
        <table>
            <tr>
                <td>
                    Agency Name:</td>
                <td>
            <asp:TextBox ID="txtAgencyName" runat="server" Width="169px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtAgencyName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="style3">
                    
                    Brief Description of Agency:</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDescriptionofAgency" Display="Dynamic" 
                        ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2">
                    
            <asp:TextBox ID="txtDescriptionofAgency" runat="server" TextMode="MultiLine" Width="361px" Height="179px"></asp:TextBox></td>
                <td>
                    &nbsp;</td>
            </tr>
                        <tr>
                <td>
                    
                    Address of Agency: </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="165px"></asp:TextBox>
                            </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="txtAddress" Display="Dynamic" 
                        ErrorMessage="Required"></asp:RequiredFieldValidator></td>
                        </tr>
            <tr>
                <td>
                    
                    Awards Coordinator&#39;s </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name</td>
                <td>
                    <asp:TextBox ID="coordName" runat="server" Width="167px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="coordName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email Address:</td>
                <td>
                    <asp:TextBox ID="coordEmail" runat="server" Width="165px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="coordEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </td>
            </tr>
            <tr>
                <td>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone</td>
                <td>
                    <asp:TextBox ID="coordPhone" runat="server" Width="166px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="coordPhone" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fax:</td>
                <td>
                    <asp:TextBox ID="coordfax" runat="server" Width="165px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td>
                    Head Judge&#39;s:</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:</td>
                <td>
                    <asp:TextBox ID="hjName" runat="server" Width="171px"></asp:TextBox>
                        </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="hjName" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator></td>
            </tr>
			
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Email Address:</td>
                <td class="style2">
                    <asp:TextBox ID="hjEmail" runat="server" Width="169px"></asp:TextBox>
                        </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="hjEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
			
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone:</td>
                <td class="style2">
                    <asp:TextBox ID="hjPhone" runat="server" Width="169px"></asp:TextBox>
                        </td>
                <td class="style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="hjPhone" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
			
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fax:&nbsp;</td>
                <td class="style2">
                    <asp:TextBox ID="hjFax" runat="server" Width="168px"></asp:TextBox>
                </td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
			
            <tr>
                <td style="height: 21px" colspan="2">
                    Brief Description of Award:</td>
                <td style="height: 21px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 21px" colspan="2">
                    <asp:TextBox ID="txtAwardDesc" runat="server" TextMode="MultiLine" Height="210px" Width="365px"></asp:TextBox>
                </td>
                <td style="height: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="txtDescriptionofAgency" Display="Dynamic" 
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td style="height: 21px" colspan="3">
                    Check the division and categories that will be judged for an award:</td>
                    </tr>
                    <tr>
                <td>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                        DataSourceID="AccessDataSource1" DataTextField="Category" 
                        DataValueField="Category">
                    </asp:CheckBoxList>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                        DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [SpecialAwards]">
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/isweeep.mdb" 
                        SelectCommand="SELECT [Category] FROM [categories]"></asp:AccessDataSource>
                        </td>
                    </tr>
			
            <tr>
                <td style="height: 21px">
            <asp:Button ID="Button1" runat="server"  Text="Submit" Font-Bold="True" 
                        Font-Size="Medium" Width="167px" onclick="Button1_Click" /></td>
                <td style="height: 21px">
                    &nbsp;</td>
                <td style="height: 21px">
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>
