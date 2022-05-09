<%@ Page MasterPageFile="~/AdultSV/adultSV.master" Language="C#" AutoEventWireup="true" CodeFile="TravelDetails.aspx.cs" Inherits="TravelDetails" %>

<%@ Register Src="../DaySelector.ascx" TagName="DaySelector" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
        .flight1, .flight2{}
    </style>
    <script type="text/javascript">
        function setRows(type) {
            if (type == 1) {
                var ddArrType = document.getElementById("ctl00_cp1_ddArrivalType");
                if (ddArrType.selectedIndex == 2) {
                    var x = document.getElementsByTagName("tr");
                    for (var i = 0; i < x.length; i++) {
                        //alert(x[i].className);
                        if (x[i].className == "flight1")
                            x[i].style.display = "none";
                    }
                }
                else if (ddArrType.selectedIndex == 1) {
                    var x = document.getElementsByTagName("tr");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].className == "flight1")
                            x[i].style.display = "";
                    }
                }
            }
            else {
                var ddDepType = document.getElementById("ctl00_cp1_ddDepartureType");
                if (ddDepType.selectedIndex == 2) {
                    var x = document.getElementsByTagName("tr");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].className == "flight2")
                            x[i].style.display = "none";
                    }
                }
                else if (ddDepType.selectedIndex == 1) {
                    var x = document.getElementsByTagName("tr");
                    for (var i = 0; i < x.length; i++) {
                        if (x[i].className == "flight2")
                            x[i].style.display = "";
                    }
                }
            }
        }
    </script>
    </asp:Content>
   
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" runat="server">
<b>Travel Details Form:</b><br />
        <br />
        You can enter the travel details now, or after you finalize your travel plans.
        <br />
        <table >
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <b>Name of arriving contestants:</b>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Please select the contestant(s) who will travel with you:
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <b><asp:CheckBoxList ForeColor="Blue" ID="CheckBoxList1" runat="server" DataSourceID="contestantsForTravel"
                        DataTextField="contestant" DataValueField="ContestantID" RepeatColumns="1" OnDataBound="CheckBoxList1_DataBound">
                    </asp:CheckBoxList><br /></b>
                </td>
            </tr>
            <tr>
                <td >
                    <b>Arrival information:<b>
                </td>
                <td >
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td >
                    Transportation Type:</td>
                <td>
                    <asp:DropDownList onchange="javascript:setRows(1)" ID="ddArrivalType" runat="server">
                        <asp:ListItem Value="">Select One</asp:ListItem>
                        <asp:ListItem>Flight</asp:ListItem>
                        <asp:ListItem>Car</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td >
                    Date
                </td>
                <td>
                    <uc1:DaySelector ID="dateArrival" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Estimated Arrival
                    Time
                </td>
                <td>
                    <asp:DropDownList ID="ddArrivalHour" runat="server">
                    </asp:DropDownList>
                    :<asp:DropDownList ID="ddArrivalMinute" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="flight1">
                <td>
                    Airport at Origin
                </td>
                <td>
                    <asp:TextBox ID="txtArrivalAirport" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="flight1">
                <td>
                    Airport at Destination
                </td>
                <td>
                    <asp:TextBox ID="txtArrivalDestination" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="flight1">
                <td>
                    Airline:
                </td>
                <td>
                    <asp:TextBox ID="txtArrivalAirline" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="flight1">
                <td>
                    Flight Number:
                </td>
                <td>
                    <asp:TextBox ID="txtArrivalFlight" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Departure Information:</b>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Transportation Type:</td>
                <td>
                    <asp:DropDownList onchange="javascript:setRows(2)" ID="ddDepartureType" runat="server">
                        <asp:ListItem Value="">Select One</asp:ListItem>
                        <asp:ListItem>Flight</asp:ListItem>
                        <asp:ListItem>Car</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Date
                </td>
                <td>
                    <uc1:DaySelector ID="DateDeparture" runat="server" />
                </td>
            </tr>
            <tr>
                 <td>
                    Departure Time
                </td>
                <td>
                    <asp:DropDownList ID="ddDepartureHour" runat="server">
                    </asp:DropDownList>
                    :<asp:DropDownList ID="ddDepartureMinute" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="flight2">
                <td>
                    Airport
                </td>
                <td>
                    <asp:TextBox ID="txtDeptAirport" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="flight2"> 
                <td>
                    Airline:
                </td>
                <td>
                    <asp:TextBox ID="txtDeptAirline" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="flight2">
                <td>
                    Flight Number:
                </td>
                <td>
                    <asp:TextBox ID="txtDeptFlight" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    Please note that I-SWEEEP will not provide any accommodations<br> for extra days (non-event days) of your stay. 
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Save" onClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [TravelInfo] WHERE ([asvid] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="asvid" SessionField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="travelersData" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [TravelerQuery] WHERE ([asvid] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="asvid" SessionField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="contestantsForTravel" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [ContestantsForAdultSVs] WHERE ([ASVID] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="ASVID" SessionField="asvid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <script>            setRows(1); setRows(2)</script>
   </asp:Content>