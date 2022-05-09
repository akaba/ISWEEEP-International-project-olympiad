<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AdultSupervisors.aspx.cs" Inherits="Admin_AdultSupervisors" Title="Adult Supervisors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">
    Page Size:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>


      <strong> Adult Supervisor:  </strong>

       <asp:DropDownList ID="AdultSupBox" class="chosen-select"  Width="300px" runat="server" AutoPostBack="True" DataSourceID="adultsvlist"
            DataTextField="sup" DataValueField="ASVID" OnDataBound="AdultSupBox_DataBound"  OnSelectedIndexChanged="AdultSupBox_SelectedIndexChanged">
        </asp:DropDownList>
    <br />  <br />

         <asp:AccessDataSource ID="adultsvlist" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT ASVID, ASVName +' ' + ASVLastName as sup FROM AdultSupervisors"></asp:AccessDataSource>


<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ASVID" 
        DataSourceID="AccessDataSource1" AllowPaging="True" AllowSorting="True" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <PagerSettings Position="TopAndBottom" />
        <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="asvid" DataNavigateUrlFormatString="travelinfo.aspx?asvid={0}" HeaderText="Travel"  Target="_blank" Text="Details" />

             <asp:TemplateField HeaderText="Login" >
                    <ItemTemplate>
                        <a href='<%# "LoginAS.aspx?asvid=" + Eval("ASVID") %>' target="_blank" ID="LoginASLink" runat="server"><%#Eval("ASVID") %></a>
                    </ItemTemplate>
             </asp:TemplateField> 


            <asp:boundfield DataField="ASVName" HeaderText="ASVName" 
                SortExpression="ASVName"></asp:boundfield>
            <asp:boundfield DataField="ASVLastName" HeaderText="ASVLastName" 
                SortExpression="ASVLastName"></asp:boundfield>
            
           
            <asp:boundfield DataField="ASVemail" HeaderText="ASVemail" 
                SortExpression="ASVemail"></asp:boundfield>
             <asp:boundfield DataField="sifre" HeaderText="Password" SortExpression="sifre">
            </asp:boundfield>
            
            <asp:boundfield DataField="gender" HeaderText="gender" SortExpression="gender">
            </asp:boundfield>
            <asp:checkboxfield DataField="Submitted" HeaderText="Submitted" 
                SortExpression="Submitted"></asp:checkboxfield>
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT * FROM [AdultSupervisors]"></asp:AccessDataSource>
</asp:Content>

