<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TravelInfo.aspx.cs" Inherits="Admin_TravelInfo" Title="Travel Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Traveler Page</title>
    <style type="text/css">
	.hidden{display:none}
  
    </style>
</head>
<body style="margin:0px 10px; padding:0px 10px; background-color: #E7E7FF">
        
        
    <form id="form1" runat="server">
    
    <p>
        <table>
            <tr>
		<td valign="top">
                    
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" DataSourceID="travelData" Height="50px" Width="300px" 
                        GridLines="Horizontal">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="ArrivalOrigin" HeaderText="ArrivalOrigin" 
                    SortExpression="ArrivalOrigin" />
                <asp:BoundField DataField="ArrivalDestination" HeaderText="ArrivalDestination" 
                    SortExpression="ArrivalDestination" />
                <asp:BoundField DataField="ArrivalAirline" HeaderText="ArrivalAirline" 
                    SortExpression="ArrivalAirline" />
                <asp:BoundField DataField="ArrivalFlightNo" HeaderText="ArrivalFlightNo" 
                    SortExpression="ArrivalFlightNo" />
                <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" 
                    SortExpression="ArrivalDate" />
                <asp:BoundField DataField="ArrivalTime" HeaderText="ArrivalTime" 
                    SortExpression="ArrivalTime" />
                <asp:BoundField DataField="DepartureOrigin" HeaderText="DepartureOrigin" 
                    SortExpression="DepartureOrigin" />
                <asp:BoundField DataField="DepartureDestination" 
                    HeaderText="DepartureDestination" SortExpression="DepartureDestination" />
                <asp:BoundField DataField="DepartureAirline" HeaderText="DepartureAirline" 
                    SortExpression="DepartureAirline" />
                <asp:BoundField DataField="DepartureFlightNo" HeaderText="DepartureFlightNo" 
                    SortExpression="DepartureFlightNo" />
                <asp:BoundField DataField="DepartureDate" HeaderText="DepartureDate" 
                    SortExpression="DepartureDate" />
                <asp:BoundField DataField="DepartureTime" HeaderText="DepartureTime" 
                    SortExpression="DepartureTime" />
            </Fields>
<HeaderTemplate>Travel Details</HeaderTemplate>
<emptydatatemplate>
                   No travel information.
                </emptydatatemplate>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:DetailsView>
        
                    </td>
                <td valign="top">
          <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="supervisorData"  GridLines="Horizontal">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
            <Fields>
                <asp:BoundField DataField="ASVName" HeaderText="Name" 
                    SortExpression="ASVName" />
                <asp:BoundField DataField="ASVLastName" HeaderText="LastName" 
                    SortExpression="ASVLastName" />
                <asp:BoundField DataField="ASVPhone" HeaderText="Phone" 
                    SortExpression="ASVPhone" />
                <asp:BoundField DataField="ASVAddress" HeaderText="Address" 
                    SortExpression="ASVAddress" />
                <asp:BoundField DataField="ASVemail" HeaderText="Email" 
                    SortExpression="ASVemail" />
                <asp:BoundField DataField="ASVfax" HeaderText="Fax" SortExpression="ASVfax" />
                <asp:BoundField DataField="gender" HeaderText="Gender" 
                    SortExpression="gender" />
            </Fields>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
			
<HeaderTemplate>Adult Supervisor Information</HeaderTemplate>
        </asp:DetailsView>
        </td>
                
            </tr>
        </table>
    </p>
    <p>
        <asp:DataList ID="DataList1" runat="server" 
            BackColor="#E7E7FF" BorderColor="#E7E7FF" BorderStyle="none" BorderWidth="1px" 
            CellPadding="3" DataSourceID="contestantData" GridLines="Vertical" 
            RepeatColumns="3" >
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
<HeaderTemplate>Contestants</HeaderTemplate>
            <ItemTemplate>
		<div style="padding:10px;border:1px solid black">
                Name:
                <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Eval("Firstname") %>' />
                
                <asp:Label ID="LastnameLabel" runat="server" Text='<%# Eval("Lastname") %>' />
                <br />
                Gender:
                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                <br />
                PassportNumber:
                <asp:Label ID="PassportNumberLabel" runat="server" 
                    Text='<%# Eval("PassportNumber") %>' />
                <br />
                PassportExpDate:
                <asp:Label ID="PassportExpDateLabel" runat="server" 
                    Text='<%# Eval("PassportExpDate") %>' />
                <br />
                Citizenship:
                <asp:Label ID="CitizenshipLabel" runat="server" 
                    Text='<%# Eval("Citizenship") %>' />
                <br />
                Country:
                <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </p>
    <p>
        <asp:DataList ID="DataList2" runat="server" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataKeyField="ID" DataSourceID="guestsdata" GridLines="Horizontal" 
            RepeatColumns="2" Width="633px">
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderTemplate>
                Guests
            </HeaderTemplate>
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemTemplate>
                FirstName:
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                LastName:
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                Gender:
                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                <br />
                DOB:
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB") %>' />
                <br />
                TShirtSize:
                <asp:Label ID="TShirtSizeLabel" runat="server" 
                    Text='<%# Eval("TShirtSize") %>' />
                <br />
                Citizenship:
                <asp:Label ID="CitizenshipLabel" runat="server" 
                    Text='<%# Eval("Citizenship") %>' />
                <br />
                PassportNo:
                <asp:Label ID="PassportNoLabel" runat="server" 
                    Text='<%# Eval("PassportNo") %>' />
                <br />
                PassportExpDate:
                <asp:Label ID="PassportExpDateLabel" runat="server" 
                    Text='<%# Eval("PassportExpDate") %>' />
                <br />
                Adress:
                <asp:Label ID="StreetLabel" runat="server" Text='<%# Eval("Street") %>' />
                ,
                <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                ,
                <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                ,
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
        <asp:AccessDataSource ID="guestsdata" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [Guests] WHERE ([ASVID] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ASVID" QueryStringField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
    </p>
    <asp:AccessDataSource ID="supervisorData" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [ASVName], [ASVLastName], [ASVPhone], [ASVAddress], [ASVemail], [ASVfax], [gender] FROM [AdultSupervisors] WHERE ([ASVID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="ASVID" 
                QueryStringField="asvid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <br />
    <asp:AccessDataSource ID="contestantData" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [Firstname], [Lastname], [Gender], [PassportNumber], [PassportExpDate], [Citizenship], [Country], [Phone] FROM [Contestants] WHERE ([isComingWith] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="isComingWith" 
                QueryStringField="asvid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <br />
    <asp:AccessDataSource ID="travelData" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        SelectCommand="SELECT [ArrivalOrigin], [ArrivalDestination], [ArrivalAirline], [ArrivalFlightNo], [ArrivalDate], [ArrivalTime], [DepartureOrigin], [DepartureDestination], [DepartureAirline], [DepartureFlightNo], [DepartureDate], [DepartureTime] FROM [TravelInfo] WHERE ([asvid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="asvid" QueryStringField="asvid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
</form>
        
        
</body>
</html>
        

