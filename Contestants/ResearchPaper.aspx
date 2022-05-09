<%@ Page MasterPageFile="~/contestants/contestant.master" Language="C#" AutoEventWireup="true" CodeFile="ResearchPaper.aspx.cs" Inherits="rplan" %>

<asp:Content runat="server" ContentPlaceHolderID="cp1">
<b>Project Research Paper:<br />
        </b>
		<asp:Panel id="Panelvan" runat="server">
		
		<br />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View runat="server" ID="QualifiedView">
            Uploading your project research paper is not mandatory, however we <b>highly recommend</b>
            that you upload your research paper to help us review your project. <br />
        </asp:View>
        <asp:View runat="server" ID="NonQualifiedView">
            You have to upload your research paper to help us review your project.<br />
        </asp:View>
    </asp:MultiView>
    <br />
        You can upload a PDF file, a Word document(.doc, .docx)&nbsp; or a zip (.zip) file. 
		If you have to send multiple files, please put them in a zip file and upload it.
            It can take a few minutes depending on the file size and your internet speed. 
            <b>Files larger than 20 MB cannot be uploaded</b>. If your research paper cannot be uploaded for any reason then 
            you can email your research paper to <a href="mailto:info@isweeep.org">
            info@isweeep.org</a>. <br />&nbsp;<br />
            <br />
        
            <br />
            Select the file to upload:<br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        Click on the button to start uploading the file:
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
	</asp:Panel>
        <br />
        <asp:Button ID="btnSubmit" onClientClick="javascript:this.value='File is being uploaded...Please wait';this.style.color='maroon';" runat="server" onclick="btnSubmit_Click" 
            Text="Send Project Research Paper"  />
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>


            <br />


        <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1" 
        ondatabound="FormView1_DataBound">
        
        <ItemTemplate>
            <span style="color:blue">You already uploaded the following file:</span>
            <asp:HyperLink Text="Uploaded Research Paper" ID="RPaperLink" runat="server" 
              Target="_blank"   NavigateUrl='<%# Bind("researchpaper") %>'  />
            <br />
        </ItemTemplate>
        <EmptyDataTemplate>
            NONE
        </EmptyDataTemplate>
    </asp:FormView>


        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/isweeep.mdb" 
            SelectCommand="SELECT researchpaper FROM [Projects] WHERE ([pid] = ?)" >
            <SelectParameters>
                <asp:sessionparameter Name="pid" SessionField="pid" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>

</asp:Content>
