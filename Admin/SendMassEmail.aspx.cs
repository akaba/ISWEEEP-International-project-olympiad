using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMassEmail : System.Web.UI.Page
{
    string EmailsQuery, sendFrom, subject, emailAdresField;
    protected void Page_Load(object sender, EventArgs e)
    {
        EmailsQuery = "select asvname&' ' & asvlastname as title, asvemail as email from adultsupervisors where asvid in (select asvid from projects where status='qualified')";
	sendFrom = "info@isweeep.org";
        subject = "Student performances in I-SWEEEP";
        emailAdresField = "email";
    }
    protected string GetMessage(DataRow row)
    {
        string html = "";
        string title = row["title"].ToString();
        html += @" Dear " + title + @",<br />
 <br />
On Saturday, April 17, 2010, there will be a social event program at the hotel between 8:00 pm and 9:30 pm. In the program there will be a part where student performances will take place. If you have students interested in this activity please provide the following information by April 8 2009.
<br><br>
Name of the student:<br>
Description of the performance:<br>
Country/state:<br>
Supervisor’s name:<br>
Video link of the performance (it can be youtube):<br>
<br><br>
Note: Responding to this email does not guarantee that you will have a performance during the event.

 <br><br>
Thank you, 

 <br><br>
<b>I-SWEEEP</b>


 <br />";
        return html;
    }
    protected void lstButton_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        DataGrabber dg = new DataGrabber();
        DataTable tbl = dg.ExecuteSelectQuery(EmailsQuery);
        GridView1.DataSource = tbl;
        GridView1.DataBind();
    }
    protected void viewButton_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber(); 
        EmailSender es = new EmailSender();
        DataTable tbl = dg.ExecuteSelectQuery(EmailsQuery);
        Label1.Text = "";
        for (int i = 0; i < tbl.Rows.Count; i++)
        {
            DataRow row = tbl.Rows[i];
            Label1.Text += "Message to <b>" + row[emailAdresField].ToString() + "</b><br>Subject: " + subject + "<hr>" + GetMessage(row) + "<br><hr>";
        }

    }
    protected void sendButton_Click(object sender, EventArgs e)
    {
        DataGrabber dg = new DataGrabber(); 
        EmailSender es = new EmailSender();
        DataTable tbl = dg.ExecuteSelectQuery(EmailsQuery);
        Label1.Text = "";
        for (int i = 0; i < tbl.Rows.Count; i++)
        {
            DataRow row = tbl.Rows[i];
            es.sendMail(GetMessage(row), subject, sendFrom, row[emailAdresField].ToString());
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Label1.Text = "";
    }
}
