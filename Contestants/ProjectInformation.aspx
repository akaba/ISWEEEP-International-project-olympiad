<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectInformation.aspx.cs"
    Inherits="ProjectInformation" MasterPageFile="~/contestants/contestant.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Project Information</title>
    <style type="text/css">
        .style8
        {
            width: 87px;
        }
    </style>
    <script type="text/javascript">
        function toggle(x) {
            var txt = document.getElementById("SCFname");
            if (x == 1) txt.style.display = "";
            else if (x == 0) txt.style.display = "none";
            else {
                if (document.getElementById("ctl00_cp1_RadioButtonList1_1").checked == true)
                    txt.style.display = "";
                else txt.style.display = "none";
            }
        }
        //var body = document.getElementsByTagName("body")[0];
        //body.onload = new function() { toggle(2) };
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="cp1" runat="server">
    <b>PROJECT INFORMATION FORM<br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Style="text-align: center" Text="&lt;div style='background:white;text-align:center;border:2px solid red'&gt;Your project supervisor needs to submit Risk management form. &lt;br&gt;&lt;/div&gt;"
            ForeColor="#0066FF" BackColor="White"></asp:Label>
    </b>
    <br />
    <asp:CheckBox ID="chkReview" runat="server" />
    &nbsp;<i>I reviewed the I-SWEEEP <a href="http://isweeep.org/?page_id=2592"
        target="_blank">Rules and Guidelines</a>. I understand the risks and possible danger.
        I adhered to all I-SWEEEP rules when I conducted my research and project.</i><br />
    <br />
    Please fill out the following information about your project:<b><br />
    </b>
    <br />
    <table>
        <tr>
            <td class="style8">
                <b>Project Title:</b>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtTitle" runat="server" Width="614px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTitle"
                    ErrorMessage="Title is required" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <%--<asp:Label ID="lblTitle" runat="server" Font-Bold="True"></asp:Label>--%>
            </td>
        </tr>
        <%--<tr>
                <td class="style8">
                    <b>Division:</b>
                </td>
                <td colspan="2">
                    <asp:DropDownList ID="ddDivision" runat="server">
                        <asp:ListItem Value="0">Select One</asp:ListItem>
                        <asp:ListItem Value="Junior">Junior (6-8 Grades)</asp:ListItem>
                        <asp:ListItem Value="Senior">Senior (9-12 Grades)</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddDivision"
                        ErrorMessage="Select the Division" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
                    &nbsp;***<span class="style7">Junior division is only open to contestants from USA.</span>
                </td>
            </tr>--%>
        <tr>
            <td class="style8">
                <b>Category:</b>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddCategory" runat="server" Height="21px" Width="280px">
                    <asp:ListItem Value="0">Select One</asp:ListItem>
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Energy</asp:ListItem>
                    <asp:ListItem>Environment- Management & Pollution</asp:ListItem>
                    <asp:ListItem>Environment- Health & Disease Prevention</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddCategory"
                    ErrorMessage="Select the Category" InitialValue="0" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Is this a continuation project from ISWEEEP
                <%=Settings.CurrentYear - 1 %>?
                <asp:RadioButtonList ID="RadioContinuation" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Flow">
                    <asp:ListItem Value="0">No</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioContinuation"
                    ErrorMessage="Is this a continuation project?"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Does this project involve one or more of the followings? (If yes, please check all
                that apply)
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="chkHazard" runat="server" Text="Hazardous Devices, Radiation and Laser" />
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="ChkNonHuman" runat="server" Text="NonHuman Vertabrate Animals" />
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="ChkChemicals" runat="server" Text="Chemicals and Controlled Substances" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="chkPathogens" runat="server" Text="Pathogens" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="ChkHuman" runat="server" Text="Human Subjects" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Did your project compete in a regional or local Science Fair?
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                    RepeatLayout="Flow">
                    <asp:ListItem onclick="javascript:toggle(0)" Value="0">No</asp:ListItem>
                    <asp:ListItem id="li1" runat="server" onclick="javascript:toggle(1)" Value="1">Yes</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                <span id="SCFname">Name of fair organization(s):<br />
                    <asp:TextBox ID="txtScfName" runat="server" Width="471px" Rows="3" TextMode="MultiLine"></asp:TextBox>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Students are highly encouraged to participate in other science fair organizations.
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <br />
                Does your project exhibit require access to 110 or 120 V. <b>electricity</b>? If
                yes, the electricity will be provided for finalist project booths with a <b>10 $ expense
                    fee</b>. Do you agree to make this payment at exhibition center?
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td colspan="2">
                <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatLayout="Flow" CellSpacing="3">
                    <asp:ListItem Value="0">No</asp:ListItem>
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                Is this a <b>group or individual</b> project?&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatLayout="Flow" CellSpacing="3">
                    <asp:ListItem Value="1">Group Project</asp:ListItem>
                    <asp:ListItem Value="0">Individual project</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList2"
                    ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CheckBox ID="ChkAccept" runat="server" Text="Entry Agreement: I enter this project at my own risk and will not hold anybody responsible for loss or damage to the exhibit, or harm to myself."
                    Style="font-weight: 400; font-style: italic" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:CheckBox ID="chkCOC" runat="server" Text="Code of Conduct and Legal Disclaimer: "
                    Style="font-weight: 400; font-style: italic" />
                I reviewed the <a target="_blank" href="../media/forms/I-SWEEEP Code of Conduct and Legal Disclaimer.pdf">code of conduct form</a> and I understand that violation of any rule explained in the <a target="_blank" href="../media/forms/I-SWEEEP Code of Conduct and Legal Disclaimer.pdf">code of conduct form</a> will result in my project’s immediate disqualification and removal of eligibility for all awards. I shall
indemnify, defend and hold I-SWEEEP and organizers of I-SWEEEP harmless from and against any negligence in any case due to injury, illness or any form of
harassment anywhere programs or events of I-SWEEEP takes place including but not limited to hotel and
convention center.<br />
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;
            </td>
            <td style="text-align: left; padding-top: 20px">
                &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" />
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        HeaderText="Please fill in the following fields" ShowSummary="False" />
    <p>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [Title], [Division], [Category], [ElectricityRequired], [RegionalParticipation], [RegionalName], [Status], [Email], [RiskFormData], [GroupProject], [continuation], [ApplicationType] FROM [Projects] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
    <script type="text/javascript">

        toggle(2);

        function toggleElectricityNotice() {
            var radyo = document.getElementById('ctl00_cp1_RadioButtonList3_0');
            if (radyo.checked == true) {
                document.getElementById('ctl00_cp1_RadioButtonList3_0').nextSibling.innerHTML = ("No: No electricity will be provided to your booth at the exhibition center. If you request electricity at the exhibition area, you MUST pay $50 latency fee.");
            }
            else document.getElementById('ctl00_cp1_RadioButtonList3_0').nextSibling.innerHTML = "No";
        }
        document.getElementById('ctl00_cp1_RadioButtonList3_0').onclick = toggleElectricityNotice;
        toggleElectricityNotice();

    </script>
</asp:Content>
