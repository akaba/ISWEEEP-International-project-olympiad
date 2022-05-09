<%@ Page MasterPageFile="~/Site.master" Language="C#" AutoEventWireup="true" CodeFile="RiskFormSubmission.aspx.cs" Inherits="ProjectSVContact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cp1" runat="server">

            <b>RISK MANAGEMENT FORM</b><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Finish Editing and Submit" Visible="False" />
            <br />
            Project Information:&nbsp;
            <asp:DataList ID="DataList1" runat="server"
                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                DataSourceID="AccessDataSource1" GridLines="Both">
                <ItemTemplate>
                    <b>Title:</b>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    <b>Division & Category:</b>
                    <asp:Label ID="DivisionLabel" runat="server" Text='<%# Eval("Division") %>' />
                     /                    
                    <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    <br />
                    <b>Project Status:</b>
                    <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                    <br />
                    
                    <b>Risk Form Data:</b>
                    <asp:Label ForeColor="Maroon" ID="RiskFormDataLabel" runat="server" 
                        Text='<%# printriskformdata((Eval("RiskFormData"))) %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
          
    
            <u><i>If required</u>, please, fill out the following form for the project:</i><br />
            <br />
    
    
        <table>
            <tr>
                <td>
                    <b>1.</b> Describe the hazardous chemicals , activities, or devices&nbsp; used:<br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="130px" Width="572px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    
   
    <p>
        <b>2. </b>Identify the risks involved:<br />
        <asp:TextBox ID="TextBox2" runat="server" Height="121px" 
            Width="580px" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <b>3.</b> Describe the safety precautions and procedures:<br />
        <asp:TextBox ID="TextBox3" runat="server" Height="121px" Width="579px" 
            TextMode="MultiLine"></asp:TextBox>
                </p>
    <p>
        <b>4.</b> Describe the disposal procedures (if applicable):<br />
        <asp:TextBox ID="TextBox4" runat="server" Height="81px" Width="574px" 
            TextMode="MultiLine"></asp:TextBox>
                </p>
    <p>
        <asp:CheckBox ID="CheckBox1" runat="server" 
            
            Text="  I agree with the risks assessment, safety precautions and procedures described in I-SWEEEP Rules.&lt;br&gt; I certify that I have reviewed the rules and guidelines and provided direct supervision." />
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="SAVE" onclick="Button1_Click" />
    &nbsp;&nbsp;
        </p>
    <p>
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT * FROM [RiskForms] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="PSVpid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [Title], [Division], [Category], [Status], [AbstractSubmitted], [RiskFormData], [email] FROM [Projects] WHERE (([pid] = ?) AND ([PSVID] = ?))">
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="PSVpid" Type="Int32" 
                    DefaultValue="0" />
                <asp:sessionparameter Name="PSVID" SessionField="PSVid" Type="Int32" 
                    DefaultValue="0" />
            </SelectParameters>
        </asp:AccessDataSource>
            </p>

</asp:Content>
