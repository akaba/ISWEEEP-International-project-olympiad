<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintAbstracts.aspx.cs" Inherits="Admin_PrintAbstracts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="DataList1" runat="server" DataSourceID="DSAbstracts">
            <ItemTemplate>
                <div style="width:800px;margin:0px auto;padding:0px 20px 10px;page-break-after:always;font-family:Calibri;font-size:11pt;">
                    <table style="width:100%; text-align:center;color:gray">
                        <tr>
                            <td style="width: 75px">
                                <img src="../images/i-sweeep.png" style="width: 75px" />
                            </td>
                            <td style="padding-right:80px">
                                <h3 style="margin:5px;padding:0;font-size:16pt">
                                    I-SWEEEP
                                    <% = Settings.CurrentYear %></h3>
                                <div style="font-size: 9pt;">
                                    International Sustainable World (Energy-Engineering-Environment) Project Olympiad</div>
                                <div style="font-weight: bold;margin-top:10px;font-size:15pt;">
                                    PROJECT ABSTRACT</div>
                            </td>
                        </tr>
                    </table>
                    <table style="border-radius: 12px;-moz-border-radius: 12px;-webkit-border-radius: 12px;border:1px solid black;margin-top:10px;width:100%">
                        <tr>
                            <td style="width: 133px;padding:4px">
                                Booth Number:
                            </td>
                            <td style="padding:4px;font-weight:bold">
                                <asp:Label ID="boothnumberLabel" runat="server" Text='<%# Eval("boothnumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px;padding:4px">
                                Contestant(s):
                            </td>
                            <td style="padding:4px;font-weight:bold">
                                <asp:Label ID="contestants" runat="server" Text='<%# getContestants(Eval("CN1"),Eval("CN2"),Eval("CN3") ) %>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px;padding:4px">
                                Country:
                            </td>
                            <td style="padding:4px;font-weight:bold">
                                <asp:Label ID="CountryLabel" runat="server" Text='<%# getPlace(Eval("Country"), Eval("State") ) %>' />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px;padding:4px">
                                Category:
                            </td>
                            <td style="padding:4px;font-weight:bold">
                                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                            </td>
                        </tr>
                        <tr style="">
                            <td style="width: 133px;padding:4px;padding-bottom:10px">
                                Project Title:
                            </td>
                            <td style="padding:4px;font-weight:bold;padding-bottom:10px">
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                            </td>
                        </tr>
                    </table>

                    <table style="border-radius: 12px;-moz-border-radius: 12px;-webkit-border-radius: 12px;border:1px solid #343434;margin-top:10px;width:100%">
                         <tr>
                            <td style="padding:20px 10px 20px 10px;">
                                <asp:Label ID="AbstractLabel" runat="server" Text='<%# Eval("Abstract") %>' />
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        <asp:AccessDataSource ID="DSAbstracts" runat="server" DataFile="~/App_Data/isweeep.mdb"
            SelectCommand="SELECT Projects.pid, 
(SELECT Min(ContestantID) FROM Contestants WHERE Pid=Projects.Pid) AS C1,
 
(SELECT Min(ContestantID) FROM Contestants AS C2 WHERE Pid=Projects.Pid And
ContestantID&gt;(SELECT Min(ContestantID) FROM Contestants AS C1 WHERE Pid=C2.Pid)) AS C2, 
(SELECT Min(ContestantID) FROM Contestants AS C3 WHERE Pid=Projects.Pid And ContestantID&gt; 
(SELECT Min(ContestantID) FROM Contestants AS C2 WHERE pid=C3.Pid And 
ContestantID&gt;(SELECT Min(ContestantID) FROM Contestants AS C1 WHERE Pid=C2.Pid))) AS C3, 

IIf(C1&gt;0,DFirst(&quot;FirstName &amp;' ' &amp; LastName&quot;,&quot;Contestants&quot;,&quot;ContestantID=&quot; &amp; [C1])) AS CN1, 
IIf(C2&gt;0,DFirst(&quot;FirstName &amp;' ' &amp; LastName&quot;,&quot;Contestants&quot;,&quot;ContestantID=&quot; &amp; [C2])) AS CN2, 
IIf(C3&gt;0,DFirst(&quot;FirstName &amp;' ' &amp; LastName&quot;,&quot;Contestants&quot;,&quot;ContestantID=&quot; &amp; [C3])) AS CN3, 
Projects.Title, boothnumber, Projects.Division, Projects.Category, Projects.Country, Projects.State, Abstracts.Abstract
FROM Projects LEFT JOIN Abstracts ON Projects.pid = Abstracts.pid
WHERE(((Projects.Status)=&quot;Qualified&quot;))
order by boothnumber;"></asp:AccessDataSource>
    </form>
</body>
</html>
