<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="AddJudge.aspx.cs" Inherits="Admin_AddJudge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

    <h2>Add A New Judge</h2>
            <table>
            <tr>
                <td>
                    First name:
                </td>
                <td>                    
                    <asp:TextBox ID="txtFirstName" runat="server" Width="250px"></asp:TextBox>*
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>              
            </tr>
            <tr>
                <td>
                    Last name:
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox>*              
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                        Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
                  <tr>
                <td>
                    Email Address:
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>*
             
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ErrorMessage="Invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Width="250px"></asp:TextBox>
                </td>
             
            </tr>
                  <tr>
                <td>
                    Company:
                </td>
                <td>
                    <asp:TextBox ID="txtCompany" runat="server" Width="250px"></asp:TextBox>
                </td>
             
            </tr>
                  <tr>
                <td>
                    Position:
                </td>
                <td>
                    <asp:TextBox ID="txtPosition" runat="server" Width="250px"></asp:TextBox>
                </td>
             
            </tr>                
              <tr>
                <td>
                    Checkin:
                </td>
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                </td>
             
            </tr> 
                
                                  
                <tr>
                  <td>
                </td>
                <td style="height: 21px">
                    <br/>
                                        
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" class="btn btn-default" CausesValidation="True" />  
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <br/> <br/><br/>
                    <asp:Button ID="ButtonClear" Cssclass="btn-danger" runat="server" Text="Clear Form" OnClick="ButtonClear_Click" />
                                 
                </td>             
            </tr>
                </table>
  

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" ></asp:AccessDataSource>
</asp:Content>

