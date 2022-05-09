<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="EditProject.aspx.cs" Inherits="Admin_EditProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

    <strong> Project:  </strong>
   

       <asp:DropDownList ID="ProjectBox" class="chosen-select"  Width="600px" runat="server" AutoPostBack="True" DataSourceID="projects"
            DataTextField="title" DataValueField="pid" OnDataBound="ProjectBox_DataBound"  OnSelectedIndexChanged="ProjectBox_SelectedIndexChanged">
        </asp:DropDownList>
     <br/><br/>
         <asp:AccessDataSource ID="projects" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT DISTINCT pid, title FROM Projects where status is NOT Null"></asp:AccessDataSource>

   

    <asp:DetailsView ID="DetailsView1" runat="server" Width="800px" AutoGenerateRows="False" DataSourceID="AccessDataSource1" EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />        
        <FieldHeaderStyle BackColor="#E9ECF1" ForeColor="Black" Font-Bold="True" /> 
        <Fields>
        <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-default" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" SortExpression="pid" ReadOnly="True" />
            <asp:BoundField DataField="ProjectCode" HeaderText="ProjectCode" SortExpression="ProjectCode" ReadOnly="True" />
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="400px" />
            </asp:TemplateField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"  ControlStyle-Width="600" >  
<ControlStyle Width="600px"></ControlStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Category" SortExpression="Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddCategory" runat="server" SelectedValue='<%# Bind("Category") %>'>  
                    <asp:ListItem Value="">Select Category</asp:ListItem>   
                    <asp:ListItem Value="0">Select Category</asp:ListItem>             
                    <asp:ListItem>Engineering</asp:ListItem>
                    <asp:ListItem>Energy</asp:ListItem>
                    <asp:ListItem>Environment- Management & Pollution</asp:ListItem>
                    <asp:ListItem>Environment- Health & Disease Prevention</asp:ListItem>
                </asp:DropDownList>             
                </EditItemTemplate>            
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>           

            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" ReadOnly="True" />
            <asp:BoundField DataField="ApplicationType" HeaderText="ApplicationType" SortExpression="ApplicationType" ReadOnly="True" />           
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" ReadOnly="True" />
            <asp:TemplateField HeaderText="Contestants">
                <ItemTemplate>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="AccessDataSource2">
                        <AlternatingItemStyle ForeColor="#284775" />
                        <ItemStyle ForeColor="#333333" />
                        <ItemTemplate>
                              <a href='<%# "EditContestant.aspx?cid=" + Eval("ContestantID") %>' ID="LoginASLink" runat="server"><%#Eval("name") %></a>                         
                         </ItemTemplate>
                    </asp:DataList>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:CheckBoxField DataField="GroupProject" HeaderText="GroupProject" SortExpression="GroupProject"></asp:CheckBoxField>            
            <asp:CheckBoxField DataField="ElectricityRequired" HeaderText="ElectricityRequired" SortExpression="ElectricityRequired" />                
            <asp:TemplateField HeaderText="Continuation">
                <ItemTemplate>
                    <asp:CheckBox ID="chk1" Enabled="false" runat="server" Checked='<%# Eval("Continuation") %>'>
                    </asp:CheckBox>
                    &nbsp;Form Submitted:
                    <asp:CheckBox ID="chk5" Enabled="false" runat="server" Checked='<%# Eval("ContinuationFormSubmitted").ToString()=="1" %>'>
                    </asp:CheckBox>
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
            </asp:TemplateField>


                        <asp:BoundField DataField="RegionalName" HeaderText="RegionalName" SortExpression="RegionalName"  ControlStyle-Width="600" >  
<ControlStyle Width="600px"></ControlStyle>
            </asp:BoundField>

            <asp:TemplateField HeaderText="Project Supervisor">
                <ItemTemplate>
                     <a href='<%# "EditProjectSupervisor.aspx?id=" + Eval("PSVID") + "&pid=" + Eval("pid")  %>' ID="Editpsv" runat="server">EDIT</a>  
                    <asp:Label ID="Labelsvname" runat="server" Text='<%# (Eval("SVName").ToString()) %>'></asp:Label>
                    <asp:Label ID="Labelsvlastname" runat="server" Text='<%# (Eval("SVLastName").ToString()) %>'></asp:Label>
                    &nbsp; /&nbsp; Email:
                    <asp:Label ID="Labelsvemail" runat="server" Text='<%# (Eval("SVemail").ToString()) %>'></asp:Label>
                    &nbsp; /&nbsp; ID:
                    <asp:Label ID="Labelpsvid" runat="server" Text='<%# (Eval("PSVID").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
			<asp:TemplateField HeaderText="Adult Supervisor">
                <ItemTemplate>
                    <asp:Label ID="LabelASV" runat="server" Text='<%# getASV(Eval("asvid").ToString()) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Risk Data">
                <ItemTemplate>
                    <asp:Label ID="LabelRiskFormData" runat="server" Text='<%# getRiskFormData(Eval("RiskFormData"), Eval("RiskFormSubmitted"), Eval("pid") ) %>'></asp:Label>
                </ItemTemplate>       
                    
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reviews">
                <ItemTemplate>
                    <asp:Label ID="LabelReviews" runat="server" Text='<%# getReviews(Eval("Reviews"),Eval("pid") ) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>      
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" 
        SelectCommand="SELECT * FROM [ProjectDetails] WHERE ([pid] = ?)" 
        UpdateCommand="UPDATE [Projects] SET [Email] = ?, [Title] = ?, [Category] = ?,  [GroupProject] = ?, [ElectricityRequired] = ?,[RegionalName] = ? WHERE [pid] = ?">
        <SelectParameters>        
              <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>             
        <UpdateParameters>
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Title" Type="String" />          
            <asp:Parameter Name="Category" Type="String" />
            <asp:Parameter Name="GroupProject" Type="Boolean" />
            <asp:Parameter Name="ElectricityRequired" Type="Boolean" />           
            <asp:Parameter Name="RegionalName" Type="String" />  
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />        
        </UpdateParameters>
    </asp:AccessDataSource>

     <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"
        SelectCommand="SELECT contestantID, firstname + ' ' + lastname as Name FROM [Contestants] WHERE ([pid] = ?)">
        <SelectParameters>          
            <asp:QueryStringParameter Name="pid" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>

</asp:Content>

