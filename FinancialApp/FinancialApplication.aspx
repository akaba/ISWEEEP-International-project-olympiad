<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="FinancialApplication.aspx.cs"
    Inherits="FinancialApplication" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cp1">
    <b>FINANCIAL AID APPLICATION<br />
    </b>
    <br />
    We have limited budget for financial aid. It is awarded on a first come, first served
    basis. When decision is made, the following factors will be considered;
    <br />
    &nbsp;&nbsp;&nbsp; 1. Family income.
    <br />
    &nbsp;&nbsp;&nbsp; 2. Previous efforts and achievements in science fairs.
    <br />
    &nbsp;&nbsp;&nbsp; 3. Depth and value of current research project.
    <br />
    <span class="style1">Important Information:</span> Please make sure that you have
    your research paper ready <span class="style2">before</span> you start financial
    application since you need to submit it at the last step. If you already submitted
    your research plan when you registered your project, then you do not have to submit
    it again. You have to upload your research paper as a PDF file or Word (.doc) document.<br />
    If you need help on how to write a research paper, click <a target="_blank" href='http://www.isweeep.org/rules-aamp-guidelines/item/27'>
        here</a>.
    <br />
    <b>Step 1 of 4:</b><br />
    Please enter the following information to start application:<br />
    <table>
        <tr>
            <td>
                Contestant&#39;s First Name
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Contestant&#39;s Last Name
            </td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Project Code
            </td>
            <td>
                <asp:TextBox ID="txtCode" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCode"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT [Firstname], [Lastname], [ProjectCode], [ContestantID], [pid] FROM [Finance_Login] WHERE (([Firstname] = ?) AND ([Lastname] = ?) AND ([ProjectCode] = ?))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFirstName" Name="Firstname" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtLastName" Name="Lastname" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtCode" Name="ProjectCode" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>
