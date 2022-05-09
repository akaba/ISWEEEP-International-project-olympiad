<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"
    CodeFile="Contestants.aspx.cs" Inherits="Admin_Contestants" Title="Contestants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
    label { display: inline-block; }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" runat="Server">
     <div class="form-group">
         <p>

                 &nbsp;Contestant:
        <asp:DropDownList ID="ContestantBox" class="chosen-select"  Width="300px" runat="server" AutoPostBack="True" DataSourceID="Contestants"
            DataTextField="Contestant" DataValueField="ContestantID" OnDataBound="ContestantBox_DataBound"
            OnSelectedIndexChanged="ContestantBox_SelectedIndexChanged">
        </asp:DropDownList>

          <asp:AccessDataSource ID="Contestants" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT ContestantID, FirstName + ' '+ LastName as Contestant FROM Contestants"></asp:AccessDataSource>

    <label for="ctl00_cp1_DropDownList1">Page Size:</label>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" class="chosen-select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>40</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
        <asp:ListItem>1000</asp:ListItem>
    </asp:DropDownList>
   Show only qualified<asp:CheckBox ID="CheckBox1" Text="" class="small-select" AutoPostBack="true" runat="server" />
             </p>
          </div>
   
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Font-Size="10pt" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ContestantID" DataSourceID="AccessDataSource1"
        ForeColor="#333333" GridLines="None" EnableModelValidation="True" HeaderStyle-HorizontalAlign="Left">
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <PagerSettings Position="TopAndBottom" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>         

              <asp:HyperLinkField SortExpression="ContestantID" DataNavigateUrlFields="ContestantID"
                DataNavigateUrlFormatString="EditContestant.aspx?cid={0}" HeaderText="EDIT" Target="_blank"
                DataTextField="ContestantID"></asp:HyperLinkField>

            <asp:HyperLinkField SortExpression="isComingWith" DataNavigateUrlFields="isComingWith"
                DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}" HeaderText="Travel" Target="_blank"
                DataTextField="isComingWith"></asp:HyperLinkField>
            
            <asp:HyperLinkField SortExpression="pid" DataNavigateUrlFields="pid" DataTextField="pid" DataNavigateUrlFormatString="projectinformation.aspx?id={0}"
                HeaderText="Project" Text="Project"></asp:HyperLinkField>
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname">
            </asp:BoundField>
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname">
            </asp:BoundField>
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB"></asp:BoundField>
            <asp:BoundField DataField="Gender" HeaderText="Gnd" SortExpression="Gender"></asp:BoundField>
            <asp:BoundField DataField="SchoolName" HeaderText="SchoolName" SortExpression="SchoolName">
            </asp:BoundField>
            <asp:BoundField DataField="Citizenship" HeaderText="Citizenship" SortExpression="Citizenship"
                Visible="False"></asp:BoundField>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
            </asp:BoundField>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"></asp:BoundField>
            <asp:BoundField DataField="ParentEmail" HeaderText="Parent Email" SortExpression="ParentEmail"></asp:BoundField>
        </Columns>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT * FROM [Contestants]"></asp:AccessDataSource>
</asp:Content>
