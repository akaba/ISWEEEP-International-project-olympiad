<%@ Page Title="" Language="C#" MasterPageFile="~/Affiliates/affiliates.master" AutoEventWireup="true" CodeFile="CodeAssignment.aspx.cs" Inherits="Affiliates_CodeAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

        


        <table class="Codewindow">
              <tr><td colspan="2">
                  <h4> Contestants will login at <a href="https://www.isweeep.org/isweeep/contestants/Login.aspx" target="_blank">https://www.isweeep.org/isweeep/contestants/Login.aspx</a> 
                      <br />by providing their email address and Project Code you have assigned. 
                  </h4>
                 </td></tr>   

            <tr>
                <td colspan="2"><strong>Assign Code to Invite new Projects:</strong></td>               
            </tr>                       
            <tr>
                <td >Country: </td>
                <td>
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td >Science Fair Name:</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>            
            <tr>
                <td >
                    Code Limit:
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>                   
                       
                </td>
            </tr>
             <tr>
                <td >
                     Codes Created:
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>                   
                       
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate" class="btn btn-default" onclick="btnGenerate_Click" />
                </td>
                <td>                    
                    <asp:Label ID="lblMessage" runat="server" ForeColor="White"></asp:Label>
                    
                </td>
            </tr>
           
        </table>
        <br />
    
        <br />
     
        <asp:AccessDataSource DataFile="~/App_Data/isweeep.mdb" SelectCommand="SELECT Country,ORGANIZATION,code_limit,code_created, CITY, shortName FROM AllScienceFairs WHERE (ID = ?)"
            ID="ScienceFairsData" runat="server">
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="orgid" />
            </SelectParameters>
        </asp:AccessDataSource>
    
        <br />
</asp:Content>

