<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="EditAffiliate.aspx.cs" Inherits="Admin_EditAffiliate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">



    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" BackColor="White" Font-Bold="True"></asp:Label>

    <asp:DetailsView ID="DetailsView1" runat="server" Width="800px" AutoGenerateRows="False" DataSourceID="AccessDataSource1" EnableModelValidation="True" DataKeyNames="ID" CellPadding="4" GridLines="None" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" /> 
         <FieldHeaderStyle BackColor="#E9ECF1" ForeColor="Black" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />           

            <asp:TemplateField HeaderText="Organization" HeaderStyle-Width="100" >           
                <EditItemTemplate>
                   <asp:TextBox ID="Organization" runat="server" Text='<%# Bind("Organization") %>' Width="500" />                                                                                    
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="Organization" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Organization" runat="server" Text='<%# Bind("Organization") %>' />
            </ItemTemplate>

<HeaderStyle Width="100px"></HeaderStyle>
            </asp:TemplateField>

            <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />

            <asp:TemplateField HeaderText="Email1"> 
            <EditItemTemplate>
            <asp:TextBox ID="Email1" Text='<%# Bind("Email1") %>' runat="server"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Email1" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email1" Display="Dynamic" ForeColor="Red"  
              ErrorMessage="*Not valid e-mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             </EditItemTemplate>
                 <ItemTemplate>
                  <asp:Label ID="Email1" Text='<%# Bind("Email1") %>' runat="server"></asp:Label> 
                 </ItemTemplate> 
             </asp:TemplateField>   
            
              <asp:TemplateField HeaderText="Email2"> 
            <EditItemTemplate>
            <asp:TextBox ID="Email2" Text='<%# Bind("Email2") %>' runat="server"></asp:TextBox>               
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email2" Display="Dynamic" ForeColor="Red"  
              ErrorMessage="*Not valid e-mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             </EditItemTemplate>
                  <ItemTemplate>
                  <asp:Label ID="Email2" Text='<%# Bind("Email2") %>' runat="server"></asp:Label> 
                 </ItemTemplate> 
             </asp:TemplateField>          
           
            <asp:TemplateField HeaderText="Event Date"> 
            <EditItemTemplate>
            <asp:TextBox ID="EventDate" Text='<%# Bind("EventDate", "{0:d}") %>' runat="server"></asp:TextBox>           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="EventDate"
                 Display="Dynamic" ErrorMessage="*Not valid (mm/dd/yyyy format please)" ForeColor="Red"
                 ValidationExpression="([1-9]|0[1-9]|1[012])[- /.]([1-9]|0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
             </EditItemTemplate>
                  <ItemTemplate>
                  <asp:Label ID="EventDate" Text='<%# Bind("EventDate", "{0:d}") %>' runat="server"></asp:Label> 
                 </ItemTemplate> 
             </asp:TemplateField>         

            <asp:TemplateField HeaderText="WebSite"> 
            <EditItemTemplate>
            <asp:TextBox ID="WebSite" Text='<%# Bind("WebSite") %>' runat="server" Width="500"></asp:TextBox>  
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="* Enter a valid URL(copy from address bar)" ValidationExpression="^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*$" ControlToValidate="WebSite"></asp:RegularExpressionValidator>
            </EditItemTemplate>
               <ItemTemplate>                 
                   <asp:HyperLink ID="WebSiteHyperLink" runat="server" NavigateUrl='<%# Bind("WebSite") %>' Target="_blank"> <asp:Label ID="EventDate" Text='<%# Bind("WebSite") %>' runat="server"></asp:Label> </asp:HyperLink>
                 </ItemTemplate> 
            </asp:TemplateField>  

            <asp:TemplateField HeaderText="Address" >           
                <EditItemTemplate>
                   <asp:TextBox ID="Address" runat="server" Text='<%# Bind("Address") %>' Width="650" />                                                                                    
                   <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="Address" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Address" runat="server" Text='<%# Bind("Address") %>' />
            </ItemTemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
            <asp:BoundField DataField="user_name" HeaderText="Username" SortExpression="user_name" InsertVisible="False" ReadOnly="True" /> 
            <asp:TemplateField HeaderText="Password" >           
                <EditItemTemplate>
                   <asp:TextBox ID="UserPasswordTextBox" runat="server" Text='<%# Bind("pass_word") %>' TextMode="SingleLine"/>                                                                                   
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserPasswordTextBox" ErrorMessage="*Enter your password to verify" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="UserPasswordLabel" runat="server" Text='**********' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="code_limit" HeaderText="Code limit" SortExpression="code_limit" InsertVisible="False"/>
            <asp:CheckBoxField DataField="active" HeaderText="Active" SortExpression="active"  InsertVisible="False" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-default" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
	


      <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        UpdateCommand="UPDATE Regional_State_Fairs SET State = ?, City = ?, Organization = ?, ContactPerson = ?, Email1 = ?, Email2 = ?, EventDate = ?, WebSite = ?, Address = ?, Phone = ?, Fax = ?, pass_word = ?, code_limit = ?, active = ? WHERE (ID = ?)" 
        SelectCommand="SELECT * FROM [Regional_State_Fairs] WHERE ([ID] = ?)">  
        <SelectParameters>        
              <asp:QueryStringParameter Name="ID" QueryStringField="rf" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Organization" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="EventDate" Type="DateTime" />
            <asp:Parameter Name="WebSite" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />            
            <asp:Parameter Name="pass_word" Type="String" />                   
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
     </asp:AccessDataSource>  

         <asp:DetailsView ID="DetailsView2" runat="server" Width="700px" AutoGenerateRows="False" DataSourceID="AccessDataSource2" EnableModelValidation="True" DataKeyNames="ID" CellPadding="4" GridLines="None" ForeColor="#333333">
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#E9ECF1" ForeColor="Black" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />           

            <asp:TemplateField HeaderText="Organization" HeaderStyle-Width="100">           
                <EditItemTemplate>
                   <asp:TextBox ID="Organization" runat="server" Text='<%# Bind("Organization") %>' Width="500" />                                                                                    
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="Organization" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Organization" runat="server" Text='<%# Bind("Organization") %>' />
            </ItemTemplate>

<HeaderStyle Width="100px"></HeaderStyle>
            </asp:TemplateField>

            <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />

            <asp:TemplateField HeaderText="Email1"> 
            <EditItemTemplate>
            <asp:TextBox ID="Email1" Text='<%# Bind("Email1") %>' runat="server"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="Email1" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email1" Display="Dynamic" ForeColor="Red"  
              ErrorMessage="*Not valid e-mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             </EditItemTemplate>
            <ItemTemplate>
                  <asp:Label ID="Email1" Text='<%# Bind("Email1") %>' runat="server"></asp:Label> 
                 </ItemTemplate>
             </asp:TemplateField> 
            
              <asp:TemplateField HeaderText="Email2"> 
            <EditItemTemplate>
            <asp:TextBox ID="Email2" Text='<%# Bind("Email2") %>' runat="server"></asp:TextBox>  

           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email2" Display="Dynamic" ForeColor="Red"  
              ErrorMessage="*Not valid e-mail format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             </EditItemTemplate>
                 <ItemTemplate>
                  <asp:Label ID="Email2" Text='<%# Bind("Email2") %>' runat="server"></asp:Label> 
                 </ItemTemplate>
             </asp:TemplateField>          
           
            <asp:TemplateField HeaderText="Event Date"> 
            <EditItemTemplate>
            <asp:TextBox ID="EventDate" Text='<%# Bind("EventDate", "{0:d}") %>' runat="server"></asp:TextBox>   
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="EventDate"
                 Display="Dynamic" ErrorMessage="*Not valid (mm/dd/yyyy format please)" ForeColor="Red"
                 ValidationExpression="([1-9]|0[1-9]|1[012])[- /.]([1-9]|0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"></asp:RegularExpressionValidator>
             </EditItemTemplate>
                 <ItemTemplate>
                  <asp:Label ID="EventDate" Text='<%# Bind("EventDate", "{0:d}") %>' runat="server"></asp:Label> 
                 </ItemTemplate> 

             </asp:TemplateField>         

            <asp:TemplateField HeaderText="WebSite"> 
            <EditItemTemplate>
            <asp:TextBox ID="WebSite" Text='<%# Bind("WebSite") %>' runat="server" Width="500"></asp:TextBox>  
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="* Enter a valid URL(copy from address bar)" ValidationExpression="^(http|https|ftp)\://[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(:[a-zA-Z0-9]*)?/?([a-zA-Z0-9\-\._\?\,\'/\\\+&amp;%\$#\=~])*$" ControlToValidate="WebSite"></asp:RegularExpressionValidator>
            </EditItemTemplate>
               <ItemTemplate>                 
                   <asp:HyperLink ID="WebSiteHyperLink" runat="server" NavigateUrl='<%# Bind("WebSite") %>' Target="_blank"> <asp:Label ID="EventDate" Text='<%# Bind("WebSite") %>' runat="server"></asp:Label> </asp:HyperLink>
                 </ItemTemplate> 
            </asp:TemplateField>  

            <asp:TemplateField HeaderText="Address" >           
                <EditItemTemplate>
                   <asp:TextBox ID="Address" runat="server" Text='<%# Bind("Address") %>' Width="650" />                                                                                    
                   <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="Address" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Address" runat="server" Text='<%# Bind("Address") %>' />
            </ItemTemplate>
            </asp:TemplateField>


            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
            <asp:BoundField DataField="user_name" HeaderText="Username" SortExpression="user_name" InsertVisible="False" ReadOnly="True" /> 
            <asp:TemplateField HeaderText="Password" >           
                <EditItemTemplate>
                   <asp:TextBox ID="UserPasswordTextBox" runat="server" Text='<%# Bind("pass_word") %>' TextMode="SingleLine"/>                                                                                    
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserPasswordTextBox" ErrorMessage="*Enter your password to verify" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="UserPasswordLabel" runat="server" Text='**********' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="code_limit" HeaderText="Code limit" SortExpression="code_limit" InsertVisible="False" />
            <asp:CheckBoxField DataField="active" HeaderText="Active" SortExpression="active"  InsertVisible="False" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-default" >
<ControlStyle CssClass="btn btn-default"></ControlStyle>
            </asp:CommandField>
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />     
    </asp:DetailsView>
	
	    <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/isweeep.mdb"         
        UpdateCommand="UPDATE [International_Fairs] SET [Country] = ?, [City] = ?, [Organization] = ?, [ContactPerson] = ?, [Email1] = ?, [Email2] = ?, [EventDate] = ?, [WebSite] = ?, [Address] = ?, [Phone] = ?, [Fax] = ?, [pass_word] = ?, code_limit = ?, active = ?  WHERE [ID] = ?" 
        SelectCommand="SELECT * FROM [International_Fairs] WHERE ([ID] = ?)">  
        <SelectParameters>           
            <asp:QueryStringParameter Name="ID" QueryStringField="if" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Organization" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="EventDate" Type="DateTime" />
            <asp:Parameter Name="WebSite" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />            
            <asp:Parameter Name="pass_word" Type="String" />                   
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
     </asp:AccessDataSource>

</asp:Content>

