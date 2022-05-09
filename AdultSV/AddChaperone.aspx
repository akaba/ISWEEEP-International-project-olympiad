<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true" CodeFile="AddChaperone.aspx.cs" Inherits="AdultSV_AddChaperone" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
 <title>Adult Supervisor Information Page</title>
 <script type="text/javascript">
     /*function changeCountry() {
     var citizendd = document.getElementById("ddCitizen");
     var countrydd = document.getElementById("ddCountry");
     {
     countrydd.selectedIndex = citizendd.selectedIndex;
     countrydd.title = "Changed automatically...Make sure this is correct";
     countrydd.style.backgroundColor = "yellow";
     }
     setVisibility();

     }
     function setVisibility(){
     var citizendd = document.getElementById("ddCitizen");            
     var tr1 = document.getElementById("Pass1");
     var tr2 = document.getElementById("Pass2");
     if (citizendd.value == "UNITED STATES") {
     tr1.style.display = "none";
     tr2.style.display = "none";
     }
     else {
     tr1.style.display = "";
     tr2.style.display = "";
     }
        
     }*/
    </script>

    <style type="text/css">
	 .style1
        {
            width: 100%;background-color:transparent;
        }
  </style>
</asp:Content>
   
   <asp:Content ContentPlaceHolderID="cp1" runat="server">
            <b>Additional Guest(over 18 years old), Supervisor, Observer Student:</b><br /><br />
            I-SWEEEP does not provide hotel 
            accommodations for additional guests, supervisors and observer students. There is a <b style="color: #FF0000">$150 cost of 
            attendance per day </b>for additional group member, which includes accommodation, meal, and transportation.
For more Information <a href='http://isweeep.org/science-fair-information' target='_blank'>click here</a> to view accommodation files.
            
            <br />
            
            <br />
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
                DataKeyNames="ID" DataSourceID="guestData"  
                oniteminserted="FormView1_ItemInserted" >
                <EditItemTemplate>
                    <asp:TextBox ID="ASVIDTextBox" runat="server" Text='<%# Bind("ASVID") %>' 
                        Visible="False" />
                   
                    <table class="style1">
                        <tr>
                            <td>
                                First Name:</td>
                            <td>
                                <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                    Text='<%# Bind("FirstName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name:</td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" 
                                    Text='<%# Bind("LastName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="LastNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Gender") %>' ID="ddGender" runat="server" Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="ddGender" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                T-Shirt size:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("TShirtSize") %>' ID="ddTshirt" runat="server" Width="100px">
                                    <asp:ListItem>Select One</asp:ListItem>
                                    <asp:ListItem>Small</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>Large</asp:ListItem>
                                    <asp:ListItem>X-Large</asp:ListItem>
                                    <asp:ListItem>XX-Large</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ControlToValidate="ddTshirt" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select One" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Citizenship:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("CitizenShip") %>' AppendDataBoundItems="true" ID="ddCountries" runat="server" DataSourceID="countriesData" 
                                     DataTextField="Country" DataValueField="Country">
                                    <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="ddCountries" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="Visa1">
                            <td>USA VISA:</td><td  colspan="2">
                                <asp:CheckBox ID="VisaCheckBox" AutoPostBack="true" Checked='<%# Bind("VisaRequired") %>'  OnCheckedChanged="ToggleVisa" runat="server"  />
                              
                                <asp:Label ID="LabelVisa" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'  ForeColor="Red" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport No:</td>
                            <td>
                                <asp:TextBox ID="PassportNoTextBox" runat="server" Text='<%# Bind("PassportNo") %>' />                           
                                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="PassportNoTextBox" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport<br />Expiration Date:</td>
                            <td>
                                <asp:TextBox ID="txtPassportExpDate" CssClass="popupDatepicker" runat="server" Text='<%# Bind("PassportExpDate") %>' />
                                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtPassportExpDate" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Street:</td>
                            <td>
                                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="StreetTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:</td>
                            <td>
                                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="CityTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State:</td>
                            <td>
                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Country:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Country") %>' ID="ddCountry" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="countriesData" DataTextField="Country" DataValueField="Country" >
                                    <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                                    <asp:ListItem Value="UNITED STATES">UNITED STATES</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="ddCountry" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Zip Code:</td>
                            <td>
                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone:</td>
                            <td>
                                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:</td>
                            <td>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Insert" runat="server" ControlToValidate="EmailTextBox"
                        Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    &nbsp;<br />
                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" ValidationGroup="Insert"
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="ASVIDTextBox" runat="server" Text='<%# Bind("ASVID") %>' 
                        Visible="true" style="display:none" />
                   
                    <table class="style1">
                        <tr>
                            <td>
                                First Name:</td>
                            <td>
                                <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                    Text='<%# Bind("FirstName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Last Name:</td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" 
                                    Text='<%# Bind("LastName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="LastNameTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Gender") %>' ID="ddGender" runat="server" Width="100px">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="ddGender" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                T-Shirt size:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("TShirtSize") %>' ID="ddTshirt" runat="server" Width="100px">
                                    <asp:ListItem>Select One</asp:ListItem>
                                    <asp:ListItem>Small</asp:ListItem>
                                    <asp:ListItem>Medium</asp:ListItem>
                                    <asp:ListItem>Large</asp:ListItem>
                                    <asp:ListItem>X-Large</asp:ListItem>
                                    <asp:ListItem>XX-Large</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ControlToValidate="ddTshirt" Display="Dynamic" ErrorMessage="Required" 
                                    InitialValue="Select One" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Citizenship:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("CitizenShip") %>' AppendDataBoundItems="true" ID="ddCountries" runat="server" DataSourceID="countriesData" 
                                     DataTextField="Country" DataValueField="Country">
                                    <asp:ListItem Text="Select Country" Value=""></asp:ListItem>
                                    <asp:ListItem Text="UNITED STATES" Value="UNITED STATES"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="ddCountries" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="Visa1">
                            <td>USA VISA:</td><td  colspan="2">
                                <asp:CheckBox ID="VisaCheckBox" AutoPostBack="true" Checked="true" OnCheckedChanged="ToggleVisa" runat="server"  />
                                <asp:Label ID="LabelVisa" runat="server" Text="*Required"  ForeColor="Red" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport No:</td>
                            <td>
                         <asp:TextBox ID="PassportNoTextBox" runat="server" Text='<%# Bind("PassportNo") %>' />                      
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ValidationGroup="Insert" runat="server" ErrorMessage="Required" ControlToValidate="PassportNoTextBox" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Passport<br />
                                Expiration Date:</td>
                            <td>
                                <asp:TextBox ID="txtPassportExpDate" CssClass="popupDatepicker" runat="server" Text='<%# Bind("PassportExpDate") %>' />                                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Insert" runat="server" ErrorMessage="Required" ControlToValidate="txtPassportExpDate" ></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Street:</td>
                            <td>
                                <asp:TextBox ID="StreetTextBox" runat="server" Text='<%# Bind("Street") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="StreetTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                City:</td>
                            <td>
                                <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="CityTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                State:</td>
                            <td>
                                <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Country:</td>
                            <td>
                                <asp:DropDownList SelectedValue='<%# Bind("Country") %>' ID="ddCountry" runat="server" AppendDataBoundItems="True" 
                                    DataSourceID="countriesData" DataTextField="Country" DataValueField="Country" >
                                    <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                                    <asp:ListItem Value="UNITED STATES">UNITED STATES</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="ddCountry" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Zip Code:</td>
                            <td>
                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone:</td>
                            <td>
                                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email:</td>
                            <td>
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Required" 
                                    ValidationGroup="Insert"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Insert" ControlToValidate="EmailTextBox"
                        Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                          <tr><td>
                    &nbsp;
                </td>
                <td>               
                <asp:CheckBox runat="server" ID="MyCheckBox" AutoPostBack="true" OnCheckedChanged="ToggleDone" Text="(Insert button will be visible when you accept this agreement)<br/>I agree to pay $150 per day by adding 3rd member, which includes accommodation, meal, and transportation.<br />For more Information <a href='http://isweeep.org/science-fair-information' target='_blank'>click here</a> to view accommodation files." Visible="True" Font-Bold="True" ForeColor="Red" />
              
                </td>
                 <td>
     
                </td>

             </tr>


                    </table>
                    &nbsp;<br />
                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" ValidationGroup="Insert" Visible="false"
                        CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td>
                                <b>First Name:</b></td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Last Name:</b></td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Gender:</b></td>
                            <td>
                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <b>T-Shirt Size:</b></td>
                            <td>
                                <asp:Label ID="TShirtSizeLabel" runat="server" 
                                    Text='<%# Bind("TShirtSize") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Citizenship:</b></td>
                            <td>
                                <asp:Label ID="CitizenshipLabel" runat="server" 
                                    Text='<%# Bind("Citizenship") %>' />
                            </td>
                        </tr>
                         <tr id="Visa1">
                            <td><b>USA VISA:</b></td><td  colspan="2">                                                              
                                <asp:Label ID="LabelVisa" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'  ForeColor="Red" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Passport No</b></td>
                            <td>
                                <asp:Label ID="PassportNoLabel" runat="server" 
                                    Text='<%# Bind("PassportNo") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Passport<br />
                                Expiration Date</b></td>
                            <td>
                                <asp:Label ID="PassportExpDateLabel" runat="server" 
                                    Text='<%# Bind("PassportExpDate") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Street:</b></td>
                            <td>
                                <asp:Label ID="StreetLabel" runat="server" Text='<%# Bind("Street") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>City:</b></td>
                            <td>
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>State:</b></td>
                            <td>
                                <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Country:</b></td>
                            <td>
                                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Zip Code:</b></td>
                            <td>
                                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Phone:</b></td>
                            <td>
                                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Email:</b></td>
                            <td>
                                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />                      
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton CommandName="New" Text="Add New" runat="server" ID="AddButton"/>
                    <br />
                    <asp:LinkButton CommandName="Edit" Text="Edit" runat="server" ID="EditButton"/>                    
                    <br />
                    <asp:LinkButton CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure that you want to delete this person? This is the final confirmation.')"  Text="Delete" runat="server" ID="DeleteButton"/>
                    <br />
                    
                </ItemTemplate>
                <PagerTemplate>
                <asp:LinkButton CommandName="Page" CommandArgument="First" ID="LinkButton1" runat="server"
                    Style="color: black">&lt;&lt; First</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Prev" ID="LinkButton2" runat="server"
                    Style="color: black">&lt; Prev</asp:LinkButton>
                <span style="padding-left: 20px; padding-right: 20px; color: red">[Record
                    <%= FormView1.DataItemIndex +1 %>
                    of
                    <%= FormView1.PageCount  %>]</span>
                <asp:LinkButton CommandName="Page" CommandArgument="Next" ID="LinkButton3" runat="server"
                    Style="color: black">Next &gt;</asp:LinkButton>
                <asp:LinkButton CommandName="Page" CommandArgument="Last" ID="LinkButton4" runat="server"
                    Style="color: black">Last &gt;&gt;</asp:LinkButton>
            </PagerTemplate>
                <EmptyDataTemplate>
                     <asp:Button ID="NewButton" runat="server" 
                         CausesValidation="False" CommandName="New"
                    Font-Bold="true" Text=" Add new guest/supervisor" />
                </EmptyDataTemplate>
            <PagerSettings NextPageText="Next" PreviousPageText="Previous" />
            <PagerStyle BackColor="white"  ForeColor="Black" HorizontalAlign="Left" />
                <HeaderStyle Font-Bold="True" ForeColor="#00033D" />
            <HeaderTemplate>
                Add / edit additional guests, supervisors, observer student:
            </HeaderTemplate>
            <EditRowStyle Font-Bold="True"  />
            </asp:FormView>
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        
        <asp:AccessDataSource ID="guestData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [Guests] WHERE ([ASVID] = ?) ORDER BY [ID]" 
                DeleteCommand="DELETE FROM [Guests] WHERE [ID] = ?" 
                InsertCommand="INSERT INTO [Guests] ([ASVID], [FirstName], [LastName], [Gender], [TShirtSize], [Citizenship],[VisaRequired], [PassportNo], [PassportExpDate], [Street], [City], [State], [Country], [ZipCode], [Phone], [Email]) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                UpdateCommand="UPDATE [Guests] SET [ASVID] = ?, [FirstName] = ?, [LastName] = ?, [Gender] = ?,  [TShirtSize] = ?, [Citizenship] = ?, [VisaRequired]=? , [PassportNo] = ?, [PassportExpDate] = ?, [Street] = ?, [City] = ?, [State] = ?, [Country] = ?, [ZipCode] = ?, [Phone] = ?, [Email] = ? WHERE [ID] = ?">
            <SelectParameters>
                <asp:sessionparameter Name="ASVID" SessionField="asvid" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="ASVID" Type="Int32" SessionField="asvid"  />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="TShirtSize" Type="String" />
                <asp:Parameter Name="Citizenship" Type="String" />
                <asp:Parameter Name="VisaRequired" Type="Boolean" />
                <asp:Parameter Name="PassportNo" Type="String" />
                <asp:Parameter Name="PassportExpDate" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="ASVID" Type="Int32" SessionField="asvid"  />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter Name="TShirtSize" Type="String" />
                <asp:Parameter Name="Citizenship" Type="String" />
                <asp:Parameter Name="VisaRequired" Type="Boolean" />
                <asp:Parameter Name="PassportNo" Type="String" />
                <asp:Parameter Name="PassportExpDate" Type="String" />
                <asp:Parameter Name="Street" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
            <br />
                    <asp:AccessDataSource ID="countriesData" runat="server" DataFile="~/App_Data/isweeep.mdb"
                        
                SelectCommand="SELECT [country] FROM [Countries] ORDER BY [country]"></asp:AccessDataSource> 
   </asp:Content>