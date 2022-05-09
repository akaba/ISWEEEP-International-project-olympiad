<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Admin_Statistics" Title="Statistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <STYLE>table{width:100%} table tr th{text-align:left} #mainTable{font-style:'trebuchet ms'; font-size:11pt;}</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="savedProjects" 
        style="font-weight: 700">
        <ItemTemplate>
            Started Project Count:
            <asp:Label ID="StartedProjectCountLabel" runat="server" 
                Text='<%# Eval("StartedProjectCount") %>' />
            
        </ItemTemplate>
    </asp:DataList>
    <br />
    <table id="mainTable" width=800 style="width:800px">
        <tr>
            <td valign="top">
    Categories:<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="catCount" 
        AllowSorting="True" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <Columns>
            <asp:boundfield DataField="DivisionAndCategory" 
                HeaderText="Div-Catg" SortExpression="DivisionAndCategory">
            </asp:boundfield>
            <asp:boundfield DataField="sayi" HeaderText="Total" 
                SortExpression="sayi"></asp:boundfield>
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
            </td>
            <td valign="top">
                Status Count:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="statusCount" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
        <footerstyle backcolor="#507CD1" forecolor="White" Font-Bold="True" />
        <rowstyle backcolor="#EFF3FB" />
        <Columns>
            <asp:boundfield DataField="status" HeaderText="Status" SortExpression="status">
            </asp:boundfield>
            <asp:boundfield DataField="sayi" HeaderText="Total" 
                SortExpression="sayi"></asp:boundfield>
        </Columns>
        <pagerstyle forecolor="White" horizontalalign="Center" BackColor="#2461BF" />
        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
        <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
            </td>
<td valign="top">
    Categories of Qualified Projects:<asp:GridView ID="GridView5" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="Qualifiedcategory" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="Division" HeaderText="Division" 
                SortExpression="Division" />
            <asp:BoundField DataField="CountOfCategory" HeaderText="Count" 
                SortExpression="CountOfCategory" />
        </Columns>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            
            <td valign="top">
                Countries and Qualified Projects:<asp:GridView ID="GridView6" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" />
            <asp:BoundField DataField="NumberOfprojects" HeaderText="Total" 
                SortExpression="NumberOfprojects" />
            <asp:BoundField DataField="QualifiedProjects" HeaderText="Qualified" 
                SortExpression="QualifiedProjects" />
        </Columns>
        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
            </td>
        
            <td valign="top">
                Countries:<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
                <asp:GridView ID="countryProjectsGrid" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="countryProjects" EnableModelValidation="True">
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Country" HeaderText="Country" 
                            SortExpression="Country" />
                        <asp:BoundField DataField="NumberOfprojects" HeaderText="Total" 
                            SortExpression="NumberOfprojects" />
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td valign="top">
                Tshirt sizes of qualified <b>Contestants</b>:<asp:GridView ID="cattotalproj" 
                    runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="tshirts" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="tshirtsize" HeaderText="tshirtsize" 
                            SortExpression="tshirtsize"></asp:BoundField>
                        <asp:BoundField DataField="counts" HeaderText="counts" SortExpression="counts">
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>

                Tshirt sizes of<b> Adult Supervisors</b>:<asp:GridView ID="GridView3" 
                    runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="ASVtshirts" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="tshirtsize" HeaderText="tshirtsize" 
                            SortExpression="tshirtsize"></asp:BoundField>
                        <asp:BoundField DataField="counts" HeaderText="counts" SortExpression="counts">
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>

                   Tshirt sizes of <b>Guests</b>:<asp:GridView ID="GridView4" 
                    runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="Gueststshirts" ForeColor="#333333" GridLines="None" EnableModelValidation="True">
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="tshirtsize" HeaderText="tshirtsize" 
                            SortExpression="tshirtsize"></asp:BoundField>
                        <asp:BoundField DataField="counts" HeaderText="counts" SortExpression="counts">
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>

            </td>
        </tr>
    </table>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [Country], [NumberOfprojects], [QualifiedProjects] FROM [ProjectCountByCountry] ORDER BY [QualifiedProjects] DESC">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="Qualifiedcategory" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT * FROM [_QualifiedCategories]"></asp:AccessDataSource>
    <asp:AccessDataSource ID="tshirts" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="select tshirtsize, count(tshirtsize) as counts from contestants where contestants.pid in (select pid from projects where status='qualified') group by tshirtsize ">
    </asp:AccessDataSource>

     <asp:AccessDataSource ID="ASVtshirts" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="select tshirtsize, count(tshirtsize) as counts from AdultSupervisors where AdultSupervisors.ASVID in (select ASVID from projects where status='qualified') group by tshirtsize ">
    </asp:AccessDataSource>

     <asp:AccessDataSource ID="Gueststshirts" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="select tshirtsize, count(tshirtsize) as counts from Guests where Guests.ASVID in (select ASVID from projects where status='qualified') group by tshirtsize ">
    </asp:AccessDataSource>

    <br />
    <asp:AccessDataSource ID="savedProjects" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [StartedProjectCount] FROM [_ElleTutulurProjeSayisi]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="statusCount" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [status], [sayi] FROM [_ProjeStatusSayisi]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="catCount" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT [DivisionAndCategory], [sayi] FROM [_kategoriProjeSayisi]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="countryProjects" runat="server" 
        DataFile="~/App_Data/isweeep.mdb" onselected="countryProjects_Selected" 
        SelectCommand="SELECT [NumberOfprojects], [Country] FROM [_ProjectCountByCountry] order by NumberOfprojects desc">
    </asp:AccessDataSource>
    </asp:Content>

