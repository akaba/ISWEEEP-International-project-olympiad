<%@ Page MasterPageFile="~/FinancialApp/financialApp.master" Language="C#" AutoEventWireup="true"
    CodeFile="FamilyInformation.aspx.cs" Inherits="FamilyInformation" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cp1">
    <b>Step 2 of 4: Family Information:</b>
    <p>
        Please enter the following information:</p>
    <div>
        <table>
            <tr>
                <td>
                    Father Name:
                </td>
                <td>
                    <asp:TextBox ID="txtFatherName" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFatherName"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Father Occupation:
                </td>
                <td>
                    <asp:TextBox ID="txtFO" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFO"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mother Name:
                </td>
                <td>
                    <asp:TextBox ID="txtMotherName" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMotherName"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Mother Occupation:
                </td>
                <td>
                    <asp:TextBox ID="txtMO" runat="server" Width="196px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMO"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Annual Family Income:
                </td>
                <td>
                    <asp:TextBox ID="txtIncome" runat="server" Width="120px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtIncome"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Expected travel expense<br />
                        to attend I-SWEEEP:</span>
                </td>
                <td>
                    <asp:TextBox ID="txtExpected" runat="server" Width="120px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtExpected"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    If<span> have any sponsor for your expenses,
                        what is the amount of contribution</span></td>
            </tr>
            <tr>
                <td>
                    <span> from the sponsor:</span></td>
                <td>
                    <span> <asp:TextBox ID="txtSponsored"
                            runat="server" Width="120px"></asp:TextBox>
                    </span>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Save" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [FamilyInfo] WHERE ([ContestantId] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="ContestantId" SessionField="FinanceCid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
