<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true" CodeFile="AbstractSubmission.aspx.cs"
    Inherits="AbstractSubmission" %>

<asp:content ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-small;
        }
        .style2
        {
            font-size: x-small;
        }
    </style>
    <script type="text/javascript">
        function check() {
           
            var tb = document.getElementById("<%=txtAbstract.ClientID%>");
            var len = tb.value.length;
            var howlong = document.getElementById("HowLong");
            howlong.innerHTML = len;
            if (len > 2000) {
                return false;
            }
        }
        function ValidateChecked(oSrc, args) {
            if (document.all["<%=CheckBox1.ClientID%>"].checked == false) {
                //alert("Aggreement to be checked.");
                args.IsValid = false;
                return false;
            }
        }
        
    </script>
</asp:content>
<asp:Content ContentPlaceHolderID="cp1" runat="server">    
<b>ABSTRACT SUBMISSION FORM<br />
        </b>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        <br />
        If you need help, please click on &quot;<a target="_blank" href="http://isweeep.org/wp-content/uploads/2015/01/How-to-Write-an-Abstract.pdf">How
            to write an abstract</a>.&quot;<br />
        <br />
        <b>Purpose of the experiment:</b><br />
        <span class="style2">- An introductory statement of the reason for choosing and doing
            this topic.<br />
            - A statement of the problem or hypothesis being studied. </span>
        <br />
        <br />
        <b>Procedures Used: </b>
        <br />
        <span class="style1">- </span><span class="style2">A summarization of the key points
            and an overview of how the investigation was conducted.
            <br />
            - An abstract does not give details about the materials used unless it greatly influenced
            the procedure or had to be developed to do the investigation.
            <br />
            - An abstract should only include procedures done by the student. Work done by a
            mentor (such as surgical procedures) or work done prior to student involvement must
            not be included.</span><span class="style1"> </span>
        <br />
        <br />
        <b>Observations/Data/Results:</b><br />
        <span class="style1">This section should provide key results that lead directly to the
            conclusions you have drawn.
            <br />
            It should not give too many details about the results nor include tables or graphs</span>
        <br />
        <br />
        <b>Conclusions:</b><br />
        <span class="style1">- Conclusions from the investigation should be described briefly.
            <br />
            - The summary paragraph should reflect on the process and possibly state some applications
            and extensions of the investigation.<br />
        </span>
        <br />
        <span style="font-size:9pt;color:gray">Total characters written:<span id="HowLong"></span>/2000</span>
        <br /><%--onblur="checkLast()"--%> <%--"--%>
        <asp:TextBox onchange="check()" onkeypress="javascript:check()" ID="txtAbstract" runat="server" Height="361px" Width="577px" Rows="10" TextMode="MultiLine" MaxLength="2000"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator Display="Dynamic" ID="txtAbstractValidator1" 
            ControlToValidate="txtAbstract" 
            Text="Abstract should be less than 2000 characters" 
            ValidationExpression="^[\s\S]{0,2000}$" runat="server" 
            ValidationGroup="vs" 
            ErrorMessage="Abstract should be less than 2000 characters" />
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" />
        I / We hereby certify that the above statements are correct and information provided<br />
        &nbsp;in the abstract is the result of my own research.<br />
        <asp:CustomValidator ClientValidationFunction="ValidateChecked" Runat="server" 
            ID="val" Display="Dynamic" ValidationGroup="vs" 
            ErrorMessage="You must accept the aggreement">You must accept the aggreement</asp:CustomValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Save Abstract"  OnClick="Button1_Click"
            Font-Bold="True" ValidationGroup="vs" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ValidationGroup="vs" ShowSummary="False" />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [Abstracts] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br /><br /><br />
        <script>
            check();
            </script>
</asp:Content>
