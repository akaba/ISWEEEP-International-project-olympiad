<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RiskManagementFormStatus.aspx.cs" Inherits="RiskManagementFormStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Risk Management Form Status</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" DataSourceID="AccessDataSource1" GridLines="Vertical" 
            Height="50px" Width="729px" ForeColor="Black">
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <EmptyDataTemplate>
                No form submission.
            </EmptyDataTemplate>
            <Fields>
                <asp:BoundField DataField="RiskFormStatus" HeaderText="Risk Form Status" 
                    SortExpression="RiskFormStatus" />
                <asp:BoundField DataField="HazardousDescription" 
                    HeaderText="Hazardous Description" SortExpression="HazardousDescription" />
                <asp:BoundField DataField="RisksInvolved" HeaderText="Risks Involved" 
                    SortExpression="RisksInvolved" />
                <asp:BoundField DataField="SafetyPrecautions" HeaderText="Safety Precautions" 
                    SortExpression="SafetyPrecautions" />
                <asp:BoundField DataField="DisposalProcedure" HeaderText="Disposal Procedure" 
                    SortExpression="DisposalProcedure" />
            </Fields>
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                Risk Management Form Status for this project:
            </HeaderTemplate>
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:DetailsView>
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT [RiskFormData], [HazardousDescription], [RisksInvolved], [SafetyPrecautions], [DisposalProcedure], [RiskFormStatus] FROM [RiskFormsByProjects] WHERE ([pid] = ?)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="pid" QueryStringField="pid" 
                    Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
