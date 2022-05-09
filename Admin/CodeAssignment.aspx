<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="CodeAssignment.aspx.cs" Inherits="Admin_CodeAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="Server">
        <table class="Codewindow">
            <tr>
                <td colspan="2"><strong>Assign Code to Invite new Projects:</strong></td>               
            </tr> 
            <tr>
                <td>
                    Country:
                </td>
                <td>
                    <asp:DropDownList ID="ddCountries" class="chosen-select"  runat="server" DataSourceID="Countries" DataTextField="Country"
                        DataValueField="Country" AutoPostBack="True" 
                        ondatabound="ddCountries_DataBound" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Science Fair Name:</td>
                    <td> <asp:DropDownList ID="ddScFairs" class="chosen-select"  runat="server" DataSourceID="ScienceFairsData"
                        Style="margin-top: 0px" DataTextField="ORGANIZATION" DataValueField="ID" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>            
            <tr>
                <td>
                    Number of Codes:
                </td>
                <td>
                    <div class="input-group">
                    <asp:TextBox ID="txtNum" runat="server" Width="39px"></asp:TextBox>
                        <asp:requiredfieldvalidator runat="server" ControlToValidate="txtNum" errormessage="*Required" ForeColor="Yellow"></asp:requiredfieldvalidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtNum" ErrorMessage="Not a valid number" 
                        ValidationExpression="[1-9][0-9]*"></asp:RegularExpressionValidator>
                        </div>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate" class="btn btn-default" onclick="btnGenerate_Click" />
                </td>
                <td>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:AccessDataSource DataFile="~/App_Data/isweeep.mdb" SelectCommand="Select distinct country from AllScienceFairs"
            ID="Countries" runat="server"></asp:AccessDataSource>
        <asp:AccessDataSource DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT ID, ORGANIZATION, CITY, Country, shortName FROM AllScienceFairs WHERE (Country = ?) ORDER BY ORGANIZATION"
            ID="ScienceFairsData" runat="server">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddCountries" Name="Country" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:AccessDataSource>
    
        <br />
       
    
</asp:Content>
