<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Letter.aspx.cs" Inherits="Admin_Letter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css" >
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
    <div style ="margin-left:15px" >
        
         <br />
        <asp:Label ID="Label1" runat="server" Width="650px" Font-Size="10pt"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Width="650px" Font-Size="10pt"></asp:Label>
       <table cellpadding="2" cellspacing="0" width="650" style="font-size: 10px;"> 
       <tr>
       <td style="font-weight: bold;">First Name</td><td style="font-weight: bold;">Last Name</td><td style="font-weight: bold">Status</td><td style="font-weight: bold">Passport Number</td><td style="font-weight: bold">Passport Exp. Date</td>
       </tr>  

       <asp:ListView ID="ListView1" runat="server" DataSourceID="supervisorData" >
                 <ItemTemplate> 
                    <tr>
                        <td><%# Eval("ASVName")%></td><td><%# Eval("ASVLastName")%></td><td>Supervisor</td><td><%# Eval("passportNumber")%></td><td><%# Eval("PassportExpDate")%></td>      
                    </tr>      
              </ItemTemplate>  
               <LayoutTemplate>                 
                     <tr runat="server" id="itemPlaceholder" />               
                </LayoutTemplate> 
        </asp:ListView> 

        <asp:ListView ID="ListView2" runat="server" DataSourceID="contestantData">                
                 <ItemTemplate> 
                    <tr>
                        <td><%# Eval("Firstname")%></td><td><%# Eval("Lastname")%></td><td>Finalist</td><td><%# Eval("PassportNumber")%></td><td><%# Eval("PassportExpDate")%></td>      
                    </tr>      
              </ItemTemplate> 
              <LayoutTemplate>                 
                     <tr runat="server" id="itemPlaceholder" />                
             </LayoutTemplate> 
        </asp:ListView> 

        <asp:ListView ID="ListView3" runat="server" DataSourceID="guestsdata">
                 <ItemTemplate> 
                    <tr>
                        <td><%# Eval("Firstname")%></td><td><%# Eval("Lastname")%></td><td>Additional Guest, Supervisor, Observer</td><td><%# Eval("PassportNo")%></td><td><%# Eval("PassportExpDate")%></td>      
                    </tr>      
              </ItemTemplate>
              <LayoutTemplate>                 
                     <tr runat="server" id="itemPlaceholder" />                
             </LayoutTemplate> 
        </asp:ListView> 

        </table>
        <asp:Label ID="Label3" runat="server" Text="" Width="650" Font-Size="10pt"></asp:Label>   
    </div>

    <asp:AccessDataSource ID="supervisorData" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        SelectCommand="SELECT [ASVName], [ASVLastName],[passportNumber],[PassportExpDate] FROM [AdultSupervisors] WHERE ([ASVID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="ASVID" QueryStringField="asvid" Type="Int32" />                
        </SelectParameters>
    </asp:AccessDataSource> 
   
    <asp:AccessDataSource ID="contestantData" runat="server" DataFile="~/App_Data/isweeep.mdb"        
        SelectCommand="SELECT [Firstname], [Lastname], [Gender], [PassportNumber], [PassportExpDate], [Citizenship], [Country], [Phone] FROM [Contestants] WHERE ([isComingWith] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="isComingWith" QueryStringField="asvid" Type="Int32" />                
        </SelectParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="guestsdata" runat="server" DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [Guests] WHERE ([ASVID] = ?)">  
            <SelectParameters>
                <asp:QueryStringParameter Name="ASVID" QueryStringField="asvid" Type="Int32" />
            </SelectParameters>
    </asp:AccessDataSource>
   
    <asp:AccessDataSource ID="travelData" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        SelectCommand="SELECT [ArrivalOrigin], [ArrivalDestination], [ArrivalAirline], [ArrivalFlightNo], [ArrivalDate], [ArrivalTime], [DepartureOrigin], [DepartureDestination], [DepartureAirline], [DepartureFlightNo], [DepartureDate], [DepartureTime] FROM [TravelInfo] WHERE ([asvid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="asvid" QueryStringField="asvid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="SchoolsDataSource" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        SelectCommand="SELECT * FROM [Schools] WHERE ([asvid] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="asvid" QueryStringField="asvid" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="AccessDataSource1"  DataFile="~/App_Data/isweeep.mdb"  runat="server"></asp:AccessDataSource>

    </form>
</body>
</html>
