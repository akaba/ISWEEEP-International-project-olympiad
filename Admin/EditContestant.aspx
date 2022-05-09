<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="EditContestant.aspx.cs" Inherits="Admin_EditContestant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

   <strong> Contestant:  </strong>

        <asp:DropDownList ID="ContestantBox" class="chosen-select"  Width="300px" runat="server" AutoPostBack="True" DataSourceID="contestants"
            DataTextField="Cname" DataValueField="ContestantID" OnDataBound="ContestantBox_DataBound" OnSelectedIndexChanged="ContestantBox_SelectedIndexChanged">
        </asp:DropDownList>

         <asp:AccessDataSource ID="contestants" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT ContestantID, Firstname +' '+ Lastname As Cname FROM Contestants"></asp:AccessDataSource>

    <asp:DetailsView ID="DetailsView1" runat="server" Width="500px" AutoGenerateRows="False" DataKeyNames="ContestantID" DataSourceID="AccessDataSource1" EnableModelValidation="True" CellPadding="4" GridLines="None" ForeColor="#333333" EditRowStyle-ForeColor="White">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />       

<EditRowStyle ForeColor="White"></EditRowStyle>

        <FieldHeaderStyle BackColor="#E9ECF1" ForeColor="Black" Font-Bold="True" /> 
        <Fields>
                <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-default" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
            </asp:CommandField>
                <asp:TemplateField HeaderText="ContestantID / pid" InsertVisible="False" SortExpression="ContestantID">                
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("ContestantID") %>'></asp:Label> / 
                         <asp:Label ID="Label8" runat="server" Text='<%# Bind("pid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>         
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="MI" HeaderText="MI" SortExpression="MI" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="GenderTextBox" runat="server" SelectedValue='<%# Bind("Gender") %>'>
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' Font-Bold="False" Width="300"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="DOB" SortExpression="DOB">
                <EditItemTemplate>
                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DOBTextBox"
                            Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DOBTextBox"
                            Display="Dynamic" ErrorMessage="  Not valid (please use year/month/date format )"
                            ForeColor="Red" ValidationExpression="((19|20)[0-9][0-9])[/]([1-9]|0[1-9]|1[012])[/]([12][0-9]|3[01]|[1-9]|0[1-9])"></asp:RegularExpressionValidator>
                 
                </EditItemTemplate>              
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName" />
            <asp:CheckBoxField DataField="VisaRequired" HeaderText="VisaRequired" SortExpression="VisaRequired" />
            <asp:BoundField DataField="PassportNumber" HeaderText="PassportNumber" SortExpression="PassportNumber" />
                <asp:TemplateField HeaderText="PassportExpDate" SortExpression="PassportExpDate">
                    <EditItemTemplate>                       
                        <asp:TextBox ID="txtPassportExpDate" runat="server" CssClass="popupDatepicker" Text='<%# Bind("PassportExpDate","{0:d}") %>'></asp:TextBox>                            
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PassportExpDate") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="label2" runat="server" Text='<%# Eval("PassportExpDate","{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" SortExpression="Citizenship" />
            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="isComingWith" HeaderText="Adult Supervisor" SortExpression="isComingWith" ReadOnly="True" />
            <asp:CheckBoxField DataField="CodeofConduct" HeaderText="CodeofConduct" SortExpression="CodeofConduct" />
            <asp:CheckBoxField DataField="MediaRelease" HeaderText="MediaRelease" SortExpression="MediaRelease" />
            <asp:CheckBoxField DataField="RiskForm" HeaderText="RiskForm" SortExpression="RiskForm" />
            <asp:CheckBoxField DataField="W9" HeaderText="W9" SortExpression="W9" />
                <asp:TemplateField HeaderText="TShirtSize" SortExpression="TShirtSize">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("[TShirtSize]") %>'>
                            <asp:ListItem Text="Select Size" Value=""></asp:ListItem>
                            <asp:ListItem Value="Small">Small</asp:ListItem>
                            <asp:ListItem Value="Medium">Medium</asp:ListItem>
                            <asp:ListItem Value="Large">Large</asp:ListItem>
                            <asp:ListItem Value="X-Large">X-Large</asp:ListItem>
                            <asp:ListItem Value="XX-Large">XX-Large</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TShirtSize") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TShirtSize") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:CheckBoxField DataField="observer" HeaderText="Observer" SortExpression="observer" />
                <asp:TemplateField HeaderText="Grade" SortExpression="Grade">
                    <EditItemTemplate>
                         <asp:DropDownList ID="ddGrade" runat="server" SelectedValue='<%# Bind("grade") %>'>
                            <asp:ListItem Text="Select grade" Value=""></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>                            
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddGrade"
                            Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            <asp:BoundField DataField="ParentName" HeaderText="ParentName" SortExpression="ParentName" />
                <asp:TemplateField HeaderText="ParentEmail" SortExpression="ParentEmail">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextParentEmail" runat="server" Text='<%# Bind("ParentEmail") %>' Width="300"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ForeColor="Red"  ControlToValidate="TextParentEmail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" ForeColor="Red" ControlToValidate="TextParentEmail"
                            Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ParentEmail") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ParentEmail") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>   
        </Fields>
      <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" 
  SelectCommand="SELECT * FROM [Contestants] WHERE ([ContestantID] = ?)" UpdateCommand="UPDATE [Contestants] SET [Firstname] = ?, [MI] = ?, [Lastname] = ?, [Gender] = ?, [Email] = ?, [DOB] = ?, [SchoolName] = ?, [VisaRequired] = ?, [PassportNumber] = ?, [PassportExpDate] = ?, [Citizenship] = ?, [Street] = ?, [City] = ?, [State] = ?, [Country] = ?, [ZipCode] = ?, [Phone] = ?, [CodeofConduct] = ?, [MediaRelease] = ?, [RiskForm] = ?, [W9] = ?, [TShirtSize] = ?, [observer] = ?, [Grade] = ?, [ParentName] = ?, [ParentEmail] = ? WHERE [ContestantID] = ?">
  <SelectParameters>
        <asp:QueryStringParameter Name="ContestantID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Firstname" Type="String" />
            <asp:Parameter Name="MI" Type="String" />
            <asp:Parameter Name="Lastname" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DOB" Type="String" />
            <asp:Parameter Name="SchoolName" Type="String" />
            <asp:Parameter Name="VisaRequired" Type="Boolean" />
            <asp:Parameter Name="PassportNumber" Type="String" />
            <asp:Parameter Name="PassportExpDate" Type="String" />
            <asp:Parameter Name="Citizenship" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />            
            <asp:Parameter Name="CodeofConduct" Type="Boolean" />
            <asp:Parameter Name="MediaRelease" Type="Boolean" />
            <asp:Parameter Name="RiskForm" Type="Boolean" />
            <asp:Parameter Name="W9" Type="Boolean" />
            <asp:Parameter Name="TShirtSize" Type="String" />
            <asp:Parameter Name="observer" Type="Boolean" />
            <asp:Parameter Name="Grade" Type="Int32" />
            <asp:Parameter Name="ParentName" Type="String" />
            <asp:Parameter Name="ParentEmail" Type="String" />
            <asp:QueryStringParameter Name="ContestantID" QueryStringField="cid" Type="Int32" />    
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>

