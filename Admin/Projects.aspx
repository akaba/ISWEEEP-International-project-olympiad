<%@ Page Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true"  CodeFile="Projects.aspx.cs" Inherits="Admin_Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
		var GB_ROOT_DIR = "../Greybox/";
	</script>

    <script type="text/javascript" src="../greybox/AJS.js"></script>
    <script type="text/javascript" src="../greybox/AJS_fx.js"></script>
    <script type="text/javascript" src="../greybox/gb_scripts.js"></script>
    <link href="../greybox/gb_styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cp1" runat="Server">
    
    <table> 
         <tr>       
            <th>ProjectCode</th><th>pid</th><th>Title</th><th>  Country</th><th>Status  </th><th>State </th><th>Page Size</th><th></th>
         </tr>
         <tr>
             <td>
        <asp:DropDownList ID="ProjectCodeBox" class="chosen-select"  Width="120px" runat="server" AutoPostBack="True" DataSourceID="codes"
            DataTextField="ProjectCode" DataValueField="ProjectCode" OnDataBound="ProjectCodeBox_DataBound"
            OnSelectedIndexChanged="ProjectCodeBox_SelectedIndexChanged">
        </asp:DropDownList>

</td><td>
        
        <asp:DropDownList ID="pidBox" class="chosen-select"  Width="80px" runat="server" AutoPostBack="True" DataSourceID="pids"
            DataTextField="pid" DataValueField="pid" OnDataBound="pidBox_DataBound"
            OnSelectedIndexChanged="pidBox_SelectedIndexChanged">
        </asp:DropDownList>
                 </td><td>

        
        <asp:DropDownList ID="titleBox" class="chosen-select"  Width="300px" runat="server" AutoPostBack="True" DataSourceID="titles"
            DataTextField="title" DataValueField="pid" OnDataBound="titleBox_DataBound"
            OnSelectedIndexChanged="titleBox_SelectedIndexChanged">
        </asp:DropDownList>

                 </td><td>

       
        <asp:DropDownList ID="countryBox" class="chosen-select" Width="150px" runat="server" AutoPostBack="True" DataSourceID="countries"
            DataTextField="country" DataValueField="country" OnDataBound="countryBox_DataBound"
            OnSelectedIndexChanged="countryBox_SelectedIndexChanged">
        </asp:DropDownList>
                    </td><td>
        <asp:DropDownList ID="statusBox" class="chosen-select"  Width="160px" runat="server" AutoPostBack="True"
            DataSourceID="statusler" DataTextField="status" DataValueField="status" 
            OnDataBound="statusBox_DataBound" 
            onselectedindexchanged="statusBox_SelectedIndexChanged">
        </asp:DropDownList>
                  </td><td>
       <asp:DropDownList ID="ddStates" class="chosen-select" Width="150px" runat="server" AutoPostBack="True" DataSourceID="statesDB"
            DataTextField="state" DataValueField="state" OnDataBound="ddStates_DataBound"
            OnSelectedIndexChanged="ddStates_SelectedIndexChanged">
        </asp:DropDownList>
         </td><td>
                 
                 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" class="chosen-select" Width="70px">
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
        </asp:DropDownList>
          </td><td>

        &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="#990000" Font-Bold="True"></asp:Label>
        
    </td>
    </tr>
    </table>


    <p style="font-weight: 700">

          <asp:Label ID="LabelGrid" runat="server" ForeColor="Red" BackColor="White" ></asp:Label>

        <asp:GridView ID="GridView1" Font-Size="10pt" runat="server" AllowPaging="True" AllowSorting="True" OnRowUpdated="GWRowUpdated"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pid" 
            DataSourceID="AccessDataSource1" PageSize="25" 
            ForeColor="#333333" EnableModelValidation="True" GridLines="None">
            <PagerSettings Position="TopAndBottom" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>      
            <asp:TemplateField HeaderText="Edit" >
                    <ItemTemplate>
                        <a href='<%# "EditProject.aspx?id=" + Eval("pid") %>' ID="EditLink" runat="server">EDIT</a>
                    </ItemTemplate>
             </asp:TemplateField> 
             <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <a href='<%# "projectinformation.aspx?id=" + Eval("pid") %>' title='<%# Eval("title").ToString().Length>60?Eval("title").ToString().Substring(0,60):Eval("title").ToString() %>' rel="gb_pageset[details]" ID="detailsLink" runat="server">Details</a>
                    </ItemTemplate>
             </asp:TemplateField>

               <asp:TemplateField HeaderText="Login" >
                    <ItemTemplate>
                        <a href='<%# "LoginAS.aspx?id=" + Eval("pid") %>' target="_blank" ID="LoginASLink" runat="server"><%#Eval("pid") %></a>&nbsp;                        
                           
                                            
                        <asp:LinkButton ID="CertificateLink" runat="server" CausesValidation="False" Visible='<%# IsCertEnabled(Eval("Status").ToString()) %>'><a href='<%# "../Certificate/Default.aspx?id=" + Eval("pid") %>' target="_blank" ID="A1" runat="server">Cert</a></asp:LinkButton>
                    </ItemTemplate>
             </asp:TemplateField>             
             <asp:TemplateField HeaderText="Project Title" sortexpression="title">
                    <ItemTemplate>
                        <span title='<%# Eval("title")%>'><%# Eval("title").ToString().Length>60? new DataGrabber().toTitleCase(Eval("title").ToString().Substring(0,60)+"..." ) : new DataGrabber().toTitleCase( Eval("title").ToString() ) %>  </span>
                    </ItemTemplate>
                </asp:TemplateField> 
            <asp:TemplateField HeaderText="Abstract">
                <ItemTemplate>
                    <asp:Label ID="LabelAbstract" runat="server" Text='<%# GetAbstract(Eval("AbstractSubmitted").ToString(),Eval("pid").ToString() ) %>'></asp:Label>
                </ItemTemplate>      
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Research Paper" SortExpression="ResearchPaper">   
                <ItemTemplate>
                    <asp:Label ID="LabelRPaper" runat="server" Text='<%# link(Eval("ResearchPaper").ToString()) %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="200" /> 
                </EditItemTemplate>
            </asp:TemplateField> 
             <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Visible='<%# IsEditEnabled(Eval("Status").ToString()) %>' CommandName="Edit" Text="EDIT"></asp:LinkButton>
                    </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="status" SortExpression="status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Dr1" runat="server" SelectedValue='<%# Bind("status") %>'>
                            <asp:ListItem Text="Select Status" Value=""></asp:ListItem>
                            <asp:ListItem>Saved</asp:ListItem>
                            <asp:ListItem>In review</asp:ListItem>
                            <asp:ListItem>Qualified</asp:ListItem>
                            <asp:ListItem>Not Qualified</asp:ListItem>
                            <asp:ListItem>Not Coming</asp:ListItem>
                            <asp:ListItem>Waiting List</asp:ListItem>                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                    </ItemTemplate> 
                </asp:TemplateField>

               <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" ReadOnly="True"></asp:BoundField>  
                <asp:BoundField DataField="ProjectCode" HeaderText="Code" SortExpression="ProjectCode" ReadOnly="True"></asp:BoundField> 

                <asp:CheckBoxField DataField="GroupProject" HeaderText="Grp" SortExpression="GroupProject" ReadOnly="True"></asp:CheckBoxField> 
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" ReadOnly="True"></asp:BoundField>
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" ReadOnly="True" />
                <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="pid" DataNavigateUrlFormatString="projectreviews.aspx?pid={0}"
                    Text="Reviews" />
            </Columns>
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </p>
    <p style="font-weight: 700">
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT * FROM [Projects] order by pid"  
            UpdateCommand="Update [Projects] SET Status =? WHERE (pid=?)"   
            OnSelected="AccessDataSource1_Selected"> 
             <UpdateParameters>  
                  <asp:Parameter Name="status" Type="String" />                      
                   <asp:Parameter Name="pid" Type="Int32" />                                           
        </UpdateParameters>           
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="codes" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT ProjectCode FROM Projects"></asp:AccessDataSource>

          <asp:AccessDataSource ID="pids" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT pid FROM Projects"></asp:AccessDataSource>

          <asp:AccessDataSource ID="titles" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT pid, title FROM Projects"></asp:AccessDataSource>

        <asp:AccessDataSource ID="countries" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="select distinct country from projects;"></asp:AccessDataSource>

        <asp:AccessDataSource ID="statusler" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="select distinct status from projects where status &lt;&gt;&quot;&quot;">
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="statesDB" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="select distinct state from projects where country=?">
            <SelectParameters>
                <asp:ControlParameter ControlID="countryBox" Name="?" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
    </p>
</asp:Content>
