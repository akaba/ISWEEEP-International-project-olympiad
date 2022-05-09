<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="JudgeCheckin.aspx.cs" Inherits="Admin_JudgeCheckin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp1" Runat="Server">

        <asp:DropDownList ID="JudgeBox" class="chosen-select"  Width="300px" runat="server" AutoPostBack="True" DataSourceID="Judges"
            DataTextField="Judge" DataValueField="JudgeId" OnDataBound="JudgeBox_DataBound"
            OnSelectedIndexChanged="JudgeBox_SelectedIndexChanged">
        </asp:DropDownList>
       <a href="AddJudge.aspx"  class="btn btn-default" >Add A New Judge</a> 
     <a href="../Certificate/JudgeCertificates.aspx" target="_blank" class="btn btn-default" >Judge Certificate Search</a> 
      <asp:AccessDataSource ID="Judges" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT JudgeId, JudgeName + ' '+ JudgeLastName as Judge FROM Judges"></asp:AccessDataSource>

         <br/> <br/>


    <asp:GridView ID="GridView1" runat="server" DataSourceID="AccessDataSource1" CellPadding="4" EnableModelValidation="True" ForeColor="#333333" GridLines="None"
        AutoGenerateColumns="False" DataKeyNames="JudgeId">
        <AlternatingRowStyle BackColor="White" />
        <Columns>    
            <asp:CommandField ShowEditButton="True" />
             <asp:CheckBoxField DataField="Checkin" HeaderText="Checkin" SortExpression="Checkin" />
            <asp:BoundField DataField="JudgeId" HeaderText="Id" Visible="False" ReadOnly="True" SortExpression="JudgeId" />
            <asp:BoundField DataField="JudgeName" HeaderText="Name" SortExpression="JudgeName" />
            <asp:BoundField DataField="JudgeLastName" HeaderText="LastName" SortExpression="JudgeLastName" />
            <asp:BoundField DataField="JEmail" HeaderText="Email" SortExpression="JEmail" /> 
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            <asp:BoundField DataField="JPhone" HeaderText="Phone" SortExpression="JPhone" /> 
           
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>

      <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/isweeep.mdb" 
          SelectCommand="SELECT [JudgeId], [JudgeName], [JEmail], [JPhone], [JudgeLastName], [CompanyName], [Position], [Checkin] FROM [Judges]" 
          UpdateCommand="UPDATE [Judges] SET [JudgeName] = ?, [JEmail] = ?, [JPhone] = ?, [JudgeLastName] = ?, [CompanyName] = ?, [Position] = ?, [Checkin] = ? WHERE [JudgeId] = ?">
          <UpdateParameters>
              <asp:Parameter Name="JudgeName" Type="String" />
              <asp:Parameter Name="JEmail" Type="String" />
              <asp:Parameter Name="JPhone" Type="String" />
              <asp:Parameter Name="JudgeLastName" Type="String" />
              <asp:Parameter Name="CompanyName" Type="String" />
              <asp:Parameter Name="Position" Type="String" />
              <asp:Parameter Name="Checkin" Type="Boolean" />
              <asp:Parameter Name="JudgeId" Type="Int32" />
          </UpdateParameters>
        </asp:AccessDataSource>
        


</asp:Content>

