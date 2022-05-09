<%@ Page MasterPageFile="~/FinancialApp/financialApp.master" Language="C#" AutoEventWireup="true" CodeFile="ResearchPlan.aspx.cs" Inherits="Finance_RP" %>


<asp:Content ID="Contentee1" runat="server" ContentPlaceHolderID="head">
<script language="javascript" type="text/javascript">
    function ValidateCheckbox(source, args) {
        args.IsValid = document.getElementById('<%= CheckBox1.ClientID %>').checked;
    } 
</script> 
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cp1">

        
        <b>Step 4 of 4: Project Research Paper:<br />
        </b><br />
        <asp:Panel ID="uploadpanel" runat=server>
Please, upload your project research paper. It must be less than 20 MB.
        <br />
        You have to upload a PDF file or Word (.doc) document.<br />
        If you need help on how to write a research paper, click <a target="_blank" href='http://www.isweeep.org/rules-aamp-guidelines/item/27'>here</a>.
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        </asp:Panel>
            <asp:Label ID="Label1" runat="server" ForeColor="Blue"></asp:Label>
<br /><br>
Please accept the following aggreement and click on submit button to finalize your application:
<br><asp:CheckBox ID="CheckBox1" runat="server" />
&nbsp;I have examined all the information I submitted so far and I certify that to the best of my knowledge and belief, they are a full, true and accurate statement of the facts.
        <br />
        <br />
        
        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
            Text="Submit" Font-Bold="True" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>


            <br />


            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="Please check the checkbox to finalize your application" 
                ClientValidationFunction="ValidateCheckbox"></asp:CustomValidator>


        <br />
        <asp:Button ID="btnLogout" runat="server" onclick="btnLogout_Click" 
            Text="Logout" />


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT ResearchPaper FROM [Projects] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="FinancePid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>


</asp:Content>