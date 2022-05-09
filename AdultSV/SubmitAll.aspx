<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true" CodeFile="SubmitAll.aspx.cs" Inherits="AdultSV_SubmitAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">

 
        <b>Finalize &amp;  Submit Information</b><br />
        <asp:label id="lblMessage" runat="server" font-bold="True" forecolor="Red"></asp:label>
        <br />
        Please review the information below and finalize the process. If any information
        needs to be changed, click on the menu items and change it from the corresponding
        page.<br />
        <br />
        Below is the summary of the information you submitted so far:<br />
        <br />
        <asp:detailsview id="DetailsView1" runat="server" autogeneraterows="False" datasourceid="adultSVdata"
            backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px"
            cellpadding="3" forecolor="Black" gridlines="Vertical">
            <footerstyle backcolor="#CCCCCC" />
            <pagerstyle backcolor="#999999" forecolor="Black" horizontalalign="Center" />
            <fields>
                    <asp:BoundField DataField="ASVName" HeaderText="Name" 
                        SortExpression="ASVName"></asp:BoundField>
                    <asp:BoundField DataField="ASVLastName" HeaderText="Last Name" 
                        SortExpression="ASVLastName"></asp:BoundField>
                    <asp:BoundField DataField="ASVPhone" HeaderText="Phone" 
                        SortExpression="ASVPhone"></asp:BoundField>
                     <asp:BoundField DataField="ASVemail" HeaderText="Email" 
                        SortExpression="ASVemail"></asp:BoundField>
                    <asp:BoundField DataField="ASVfax" HeaderText="Fax" SortExpression="ASVfax">
                    </asp:BoundField>
                    <asp:BoundField DataField="ASVCitizenship" HeaderText="Citizenship" 
                        SortExpression="ASVCitizenship"></asp:BoundField>
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender">
                    </asp:BoundField>
                    <asp:BoundField DataField="TshirtSize" HeaderText="T-Shirt Size" SortExpression="TshirtSize"></asp:BoundField>

                   <asp:TemplateField HeaderText="USA VISA">                
                        <ItemTemplate>
                            <asp:Label ID="LabelVisa" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'  ForeColor="Red" ></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField>

                   
                    <asp:BoundField DataField="PassportNumber" HeaderText="Passport Number" SortExpression="PassportNumber"></asp:BoundField>
                    <asp:BoundField DataField="PassportExpDate" HeaderText="Passport Expiration" SortExpression="PassportExpDate"></asp:BoundField>
                    </fields>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <headertemplate>
                    <b>Supervisor Information:</b><br />
                </headertemplate>
            <editrowstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="#CCCCCC" />
        </asp:detailsview>
        <br />
        <br />
        <asp:datalist id="DataList1" runat="server" datasourceid="comingContestants" backcolor="White"
            bordercolor="#999999" borderstyle="Solid" borderwidth="1px" cellpadding="3" forecolor="Black"
            gridlines="Vertical">
            <footerstyle backcolor="#CCCCCC" />
            <alternatingitemstyle backcolor="#CCCCCC" />
            <selecteditemstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <headertemplate>
                    <b>Contestants coming with you:</b>
                </headertemplate>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <itemtemplate>
                    Contestant:<asp:Label ID="contestantLabel" runat="server" Text='<%# Eval("contestant") %>' />
                    <br />
                    USA VISA:<asp:Label ID="LabelVisa" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'  ForeColor="Red" ></asp:Label>
                    <br/>
                    Passport Number:<asp:Label ID="PassportNumberLabel" runat="server" Text='<%# Eval("PassportNumber") %>' />                        
                    <br />
                    Passport Expiration Date:<asp:Label ID="PassportExpDateLabel" runat="server" Text='<%# Eval("PassportExpDate") %>' />                        
                    <br />
                    <br />
                </itemtemplate>
        </asp:datalist>
        <br />
        <asp:DataList ID="DataList2" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataKeyField="ID" DataSourceID="guestData" ForeColor="Black" 
            GridLines="Horizontal">
            <footerstyle backcolor="#CCCCCC" />
            <alternatingitemstyle backcolor="#CCCCCC" />
            <selecteditemstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <headertemplate>
                    <b>Additional Guest(over 18 years old), Supervisor, Observer Student coming with you:</b>
                </headertemplate>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <ItemTemplate>
                
                Name:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                &nbsp;
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                Gender:
                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                <br />
                T-Shirt Size:
                <asp:Label ID="TShirtSizeLabel" runat="server" Text='<%# Eval("TShirtSize") %>' />
                    
                <br />
                Citizenship:
                <asp:Label ID="CitizenshipLabel" runat="server" Text='<%# Eval("Citizenship") %>' />
                    
                <br />
                USA VISA:<asp:Label ID="LabelVisa" runat="server" Text='<%# (Boolean.Parse(Eval("VisaRequired").ToString())) ? "*Required" : "*Not Required" %>'  ForeColor="Red" ></asp:Label>
                <br/>
                Passport Number:
                <asp:Label ID="PassportNoLabel" runat="server" Text='<%# Eval("PassportNo") %>' />
                 &nbsp;
                Exp. Date:
                <asp:Label ID="PassportExpDateLabel" runat="server" Text='<%# Eval("PassportExpDate") %>' /> 
                    
                <br />
                Address:
                <asp:Label ID="StreetLabel" runat="server" Text='<%# Eval("Street") %>' />
                , <br />
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                , 
                
                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                &nbsp; 
                
                <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                
                , 
                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <b>
            <br />
        </b>
        <asp:detailsview id="DetailsView3" runat="server" autogeneraterows="False" datasourceid="schooldata"
            backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px"
            cellpadding="3" forecolor="Black" gridlines="Vertical">
            <footerstyle backcolor="#CCCCCC" />
            <pagerstyle backcolor="#999999" forecolor="Black" horizontalalign="Center" />
            <emptydatatemplate>
                    <span class="style1">You need to enter School/Organization information.</span>
                </emptydatatemplate>
            <fields>
                    <asp:BoundField DataField="SchoolName" HeaderText="School Name" 
                        SortExpression="SchoolName"></asp:BoundField>
                    <asp:BoundField DataField="SchoolAddress" HeaderText="School Address" 
                        SortExpression="SchoolAddress"></asp:BoundField>
                    <asp:BoundField DataField="SchoolPhone" HeaderText="School Phone" 
                        SortExpression="SchoolPhone"></asp:BoundField>
                    <asp:BoundField DataField="SchoolWeb" HeaderText="School Web" 
                        SortExpression="SchoolWeb"></asp:BoundField>
                </fields>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <headertemplate>
                    <b>School Information:</b>
                </headertemplate>
            <editrowstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="#CCCCCC" />
        </asp:detailsview>
        <br />
        
        <asp:detailsview id="DetailsView4" runat="server" autogeneraterows="False" datasourceid="traveldata"
            backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px"
            cellpadding="3" forecolor="Black" gridlines="Vertical">
            <footerstyle backcolor="#CCCCCC" />
            <pagerstyle backcolor="#999999" forecolor="Black" horizontalalign="Center" />
            <emptydatatemplate>
                    <span class="style1">Travel details not entered yet.</span>
                </emptydatatemplate>
            <fields>
                    <asp:BoundField DataField="ArrivalType" HeaderText="Arriving by:" 
                        SortExpression="ArrivalType"></asp:BoundField>
                    
                    <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date" 
                        SortExpression="ArrivalDate"></asp:BoundField>
                    <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" 
                        SortExpression="ArrivalTime"></asp:BoundField>
                    <asp:BoundField DataField="ArrivalOrigin" HeaderText="Arrival Origin" 
                        SortExpression="ArrivalOrigin"></asp:BoundField>
                    <asp:BoundField DataField="ArrivalDestination" HeaderText="Arrival Destination" 
                        SortExpression="ArrivalDestination"></asp:BoundField>
                    <asp:BoundField DataField="ArrivalAirline" HeaderText="Arrival Airline" 
                        SortExpression="ArrivalAirline"></asp:BoundField>
                    <asp:BoundField DataField="ArrivalFlightNo" HeaderText="Arrival Flight No" 
                        SortExpression="ArrivalFlightNo"></asp:BoundField>
                    <asp:BoundField DataField="DepartureType" HeaderText="Departing by:" 
                        SortExpression="DepartureType"></asp:BoundField>
                    <asp:BoundField DataField="DepartureDate" HeaderText="Departure Date" 
                        SortExpression="DepartureDate"></asp:BoundField>
                    <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" 
                        SortExpression="DepartureTime"></asp:BoundField>
                    <asp:BoundField DataField="DepartureOrigin" HeaderText="Departure Origin" 
                        SortExpression="DepartureOrigin"></asp:BoundField>
                     <asp:BoundField DataField="DepartureAirline" HeaderText="Departure Airline" 
                        SortExpression="DepartureAirline"></asp:BoundField>
                    <asp:BoundField DataField="DepartureFlightNo" HeaderText="Departure Flight No" 
                        SortExpression="DepartureFlightNo"></asp:BoundField>
                </fields>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <headertemplate>
                    <b>Travel Details:</b>
                </headertemplate>
            <editrowstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="#CCCCCC" />
        </asp:detailsview>
        <br /> 

        <asp:detailsview id="DetailsView2" runat="server" autogeneraterows="False" datasourceid="Embassydata"
            backcolor="White" bordercolor="#999999" borderstyle="Solid" borderwidth="1px"
            cellpadding="3" forecolor="Black" gridlines="Vertical">
            <footerstyle backcolor="#CCCCCC" />
            <pagerstyle backcolor="#999999" forecolor="Black" horizontalalign="Center" />
            <emptydatatemplate>
                    <span class="style1">You need to enter Embassy information.</span>
             </emptydatatemplate>
            <fields>
                    <asp:BoundField DataField="EmbassyName" HeaderText="Embassy Name" SortExpression="EmbassyName"></asp:BoundField>                        
                    <asp:BoundField DataField="EmbassyAddress" HeaderText="Embassy Address"  SortExpression="EmbassyAddress"></asp:BoundField>                       
                    <asp:BoundField DataField="EmbassyPhone" HeaderText="Embassy Phone" SortExpression="EmbassyPhone"></asp:BoundField>
                    <asp:BoundField DataField="EmbassyFax" HeaderText="Embassy Fax" SortExpression="EmbassyFax"></asp:BoundField>                        
                    <asp:BoundField DataField="EmbassyWeb" HeaderText="Embassy Web" SortExpression="EmbassyWeb"></asp:BoundField>
                        
                </fields>
            <headerstyle backcolor="#888888" font-bold="True" forecolor="white" />
            <headertemplate>
                    <b>Embassy Information:</b>
                </headertemplate>
            <editrowstyle backcolor="#000099" font-bold="True" forecolor="White" />
            <alternatingrowstyle backcolor="#CCCCCC" />
        </asp:detailsview>

    <br/>
        <asp:button id="Button1" runat="server"  onclick="Button1_Click" text="Submit" />
        <br />
        <br />
        <asp:accessdatasource id="adultSVdata" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [ASVName], [ASVLastName], [ASVPhone], [ASVAddress], [ASVemail], [ASVfax], [ASVCitizenship], [gender], [VisaRequired], [PassportNumber],[PassportExpDate],[TShirtSize] FROM [AdultSupervisors] WHERE ([ASVID] = ?)">
            <selectparameters>
                    <asp:sessionparameter Name="ASVID" SessionField="asvid" Type="Int32" />
                </selectparameters>
        </asp:accessdatasource>
        <br />
        <asp:accessdatasource id="comingContestants" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [contestant],[VisaRequired], [PassportNumber], [PassportExpDate] FROM [ContestantsForAdultSVs] WHERE ([isComingWith] = ?)"
            onselected="comingContestants_Selected">
            <selectparameters>
                    <asp:sessionparameter Name="isComingWith" SessionField="asvid" Type="Int32" />
                </selectparameters>
        </asp:accessdatasource>
        <br />
        <asp:accessdatasource id="traveldata" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [ArrivalType],[DepartureType],[ArrivalDate], [ArrivalTime], [ArrivalOrigin], [ArrivalDestination], [ArrivalAirline], [ArrivalFlightNo], [DepartureDate], [DepartureTime], [DepartureOrigin], [DepartureDestination], [DepartureAirline], [DepartureFlightNo] FROM [TravelInfo] WHERE ([asvid] = ?)">
            <selectparameters>
                    <asp:sessionparameter Name="asvid" SessionField="asvid" Type="Int32" />
                </selectparameters>
        </asp:accessdatasource>
        <br />
        <asp:accessdatasource id="schooldata" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [SchoolName], [SchoolAddress], [SchoolPhone], [SchoolFax], [SchoolWeb] FROM [Schools] WHERE ([asvid] = ?)">
            <selectparameters>
                    <asp:sessionparameter Name="asvid" SessionField="asvid" Type="Int32" />
                </selectparameters>
        </asp:accessdatasource>
        <br />
        <asp:AccessDataSource ID="guestData" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM Guests where asvid=?">
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="asvid" />
            </SelectParameters>
        </asp:AccessDataSource>
      <br />
     <asp:accessdatasource id="Embassydata" runat="server" datafile="~/App_Data/isweeep.mdb"
            selectcommand="SELECT [EmbassyName], [EmbassyAddress], [EmbassyPhone], [EmbassyFax], [EmbassyWeb] FROM [Embassy] WHERE ([asvid] = ?)">
            <selectparameters>
                    <asp:sessionparameter Name="asvid" SessionField="asvid" Type="Int32" />
                </selectparameters>
        </asp:accessdatasource>
    </asp:Content>
