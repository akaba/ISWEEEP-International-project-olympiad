<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="RegionalStateFairs.aspx.cs" Inherits="Admin_RegionalStateFairs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"> 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server" > 
    
    <p>
      
        State:<asp:DropDownList class="chosen-select" ID="ddStates" runat="server" AutoPostBack="True" DataSourceID="statesDB"
            DataTextField="state" DataValueField="state" OnDataBound="ddStates_DataBound"
            OnSelectedIndexChanged="ddStates_SelectedIndexChanged"></asp:DropDownList> 
    <asp:CheckBox ID="CheckBox1"  AutoPostBack="true" runat="server" />ONLY Inactive
     
           </p>
            


        <div>
          
       

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="AccessDataSource1" 
        PageSize="15" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" >
         <PagerSettings Position="TopAndBottom" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />                       
        <Columns>  
           <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <a href='<%# "EditAffiliate.aspx?rf=" + Eval("id") %>' ID="EditLink" runat="server">EDIT</a>
                    </ItemTemplate>
          </asp:TemplateField> 
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" ReadOnly="True" />           
            <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
            <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
            <asp:BoundField DataField="Email1" HeaderText="E-mail" SortExpression="Email1" />           
            <asp:BoundField DataField="Phone" HeaderText="Phone" />  
            <asp:BoundField DataField="user_name" HeaderText="Username" />
            <asp:BoundField DataField="pass_word" HeaderText="Password" />
            <asp:BoundField DataField="code_limit" HeaderText="Code limit" />
            <asp:CheckBoxField DataField="active" HeaderText="Active"/>   

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>


    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT * FROM [Regional_State_Fairs] WHERE active=True" 
        UpdateCommand="UPDATE Regional_State_Fairs SET Organization =, ContactPerson =, [Email1] =, user_name =, pass_word =, code_limit =, active =">   
        </asp:AccessDataSource>

     <asp:AccessDataSource ID="statesDB" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="select distinct state from [Regional_State_Fairs];"></asp:AccessDataSource>
                                
    
   </div>  
    
</asp:Content>
  