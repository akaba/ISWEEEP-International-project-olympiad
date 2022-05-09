<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true"  CodeFile="ParticipantInfo.aspx.cs" Inherits="ParticipantInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">
    <b>CONTESTANT INFORMATION FORM</b>
    <br />
    <br />
    In order to verify/enter data for contestant(s), you need to obtain the contestant's
    project code.
    <p>
        To retrieve contestants, enter the project code:</p>


        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
            ErrorMessage="*" ValidationGroup="retrieve"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Retrieve Contestants" OnClick="Button1_Click"
            ValidationGroup="retrieve" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <asp:Panel ID="Panel1" runat="server" Font-Bold="False">
            Below are the contestants added so far; you will select the ones who are coming
            with you in the travel details form.<br/> 
            <br />
            Click Edit button and specificy <b>USA visa requirement status</b> for each person, enter the passport number and expiration date.
          
            <br/>
            <br/>
            
            <asp:GridView ID="GridView2" runat="server" OnRowUpdating="GridView2_RowUpdating" OnRowUpdated="GridView2_RowUpdated" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="contestantID" DataSourceID="AccessDataSource3"  ForeColor="#333333" GridLines="None" EnableModelValidation="false">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:CommandField causesvalidation="false" ShowEditButton="True"  ShowSelectButton="True" />
                    <asp:BoundField DataField="contestantID" HeaderText="contestantID" Visible="False" ReadOnly="True" /> 
                    <asp:BoundField DataField="contestant" HeaderText="Name on Passport" ReadOnly="True" SortExpression="contestant" />
                    <asp:TemplateField HeaderText="USA VISA" SortExpression="VisaRequired">
                        <EditItemTemplate>
                            <asp:CheckBox ID="VisaCheckBox" runat="server" AutoPostBack="true" Checked='<%# Bind("VisaRequired") %>' ForeColor="Red" OnCheckedChanged="ToggleDone" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="VisaLabel" runat="server" ForeColor="Red" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                        <asp:TemplateField HeaderText="Passport Number" SortExpression="PassportNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassportNumber" runat="server" Text='<%# Bind("PassportNumber") %>'></asp:TextBox>
                            <asp:Label ID="lbPassportNumber" runat="server" ForeColor="Red"></asp:Label>                            
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="label1" runat="server" Text='<%# Eval("PassportNumber") %>'></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField>


                   

                    <asp:TemplateField HeaderText="Passport Expiration Date" SortExpression="PassportExpDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassportExpDate" runat="server" CssClass="popupDatepicker" Text='<%# Bind("PassportExpDate","{0:d}") %>'></asp:TextBox>
                            <asp:Label ID="lbPassportExpDate" runat="server" ForeColor="Red"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="label2" runat="server" Text='<%# Eval("PassportExpDate","{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <EmptyDataTemplate>
                    No students were entered yet...
                </EmptyDataTemplate>
                <SelectedRowStyle BackColor="#aaccff" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#A8D368" Font-Bold="True" ForeColor="black" />
                <EditRowStyle BackColor="#aaccff" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

            <br/>

            <b style="color: blue">Student Details:</b>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ContestantID" DataSourceID="contestantInfo">
                <EditItemTemplate>
                    ContestantID:
                    <asp:Label ID="ContestantIDLabel1" runat="server" Text='<%# Eval("ContestantID") %>' />
                    <br />
                    Firstname:
                    <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
                    <br />
                    Lastname:
                    <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
                    <br />
                    MI:
                    <asp:TextBox ID="MITextBox" runat="server" Text='<%# Bind("MI") %>' />
                    <br />
                    DOB:
                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                    <br />
                    Gender:
                    <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                    <br />
                    PassportNumber:
                    <asp:TextBox ID="PassportNumberTextBox" runat="server" Text='<%# Bind("PassportNumber") %>' />
                    <br />
                    PassportExpDate:
                    <asp:TextBox ID="PassportExpDateTextBox" runat="server" Text='<%# Bind("PassportExpDate") %>' />
                    <br />
                    Citizenship:
                    <asp:TextBox ID="CitizenshipTextBox" runat="server" Text='<%# Bind("Citizenship") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Firstname:
                    <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
                    <br />
                    Lastname:
                    <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
                    <br />
                    MI:
                    <asp:TextBox ID="MITextBox" runat="server" Text='<%# Bind("MI") %>' />
                    <br />
                    DOB:
                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                    <br />
                    Gender:
                    <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' />
                    <br />
                    PassportNumber:
                    <asp:TextBox ID="PassportNumberTextBox" runat="server" Text='<%# Bind("PassportNumber") %>' />
                    <br />
                    PassportExpDate:
                    <asp:TextBox ID="PassportExpDateTextBox" runat="server" Text='<%# Bind("PassportExpDate") %>' />
                    <br />
                    Citizenship:
                    <asp:TextBox ID="CitizenshipTextBox" runat="server" Text='<%# Bind("Citizenship") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <b>Name:</b><asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' />
                    <asp:Label ID="MILabel" runat="server" Text='<%# Bind("MI") %>' />
                    <asp:Label ID="LastnameLabel" runat="server" Text='<%# Bind("Lastname") %>' />
                    <br />
                    <b>Date Of Birth:</b>
                    <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                    <br />
                    <b>Gender:</b>
                    <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                    <br />
                    <b>USA Visa:</b>
                    <asp:Label ID="VisaRequiredLabel" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>' />
                    <br />
                    <b>Citizenship: </b>
                    <asp:Label ID="CitizenshipLabel" runat="server" Text='<%# Bind("Citizenship") %>' />
                    <br />
                    <b>PassportNumber:</b>
                    <asp:Label ID="PassportNumberLabel" runat="server" Text='<%# Bind("PassportNumber") %>' />
                    <br />
                    <b>PassportExpDate</b>:
                    <asp:Label ID="PassportExpDateLabel" runat="server" Text='<%# Bind("PassportExpDate") %>' />
                    <br />
                    If any of this information is wrong, please make students update it from the project
                    registration page or email to <a href="mailto:info@isweeep.org">info@isweeep.org</a>
                    about the change.
                </ItemTemplate>
                <EmptyDataTemplate>
                    Select a student from the list above to see the details.<br />
                </EmptyDataTemplate>
            </asp:FormView>
            <br />
        </asp:Panel>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [pid], [ProjectCode], [Title], [Division], [Category], [Status], [ASVID] FROM [Projects] WHERE (([ASVID] = ?) AND ([ProjectCode] = ?) and status='Qualified')">
            <SelectParameters>
                <asp:SessionParameter Name="ASVID" SessionField="asvid" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox1" Name="ProjectCode" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="contestantInfo" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT ContestantID, Firstname, Lastname, MI , DOB , Gender, VisaRequired , PassportNumber , PassportExpDate , Citizenship FROM Contestants WHERE (contestantID = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="ContestantID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="AccessDataSource3" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT [contestantID], [contestant],[VisaRequired],[PassportNumber], [PassportExpDate] FROM [ContestantsForAdultSVs] WHERE ([ASVID] = ?)"
            UpdateCommand="UPDATE Contestants SET VisaRequired=?, PassportNumber =?, PassportExpDate =? where contestantID=?"
            OnSelected="AccessDataSource3_Selected">
            <SelectParameters>
                <asp:SessionParameter Name="ASVID" SessionField="asvid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="VisaRequired" Type="Boolean" />
                <asp:Parameter Type="String" Name="PassportNumber" />
                <asp:Parameter Type="String" Name="PassportExpDate" />
                <asp:Parameter Type="Int32" Name="contestantID" />
            </UpdateParameters>
        </asp:AccessDataSource>  



    </asp:Content>
