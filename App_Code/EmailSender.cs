#region imports
using System.Data;
using System;
using System.Net.Mail;

#endregion

/// <summary>
/// Summary description for EmailSender
/// </summary>
public class EmailSender
{
    public void hataYolla(string s)
    {
        sendMail(s, "Error in ISWEEEP registration application", "info@isweeep.org", "info@isweeep.org");
    }
    public static string sendEmail2ProjectPeople(int pid, string Message, string Subject)
    {
        DataGrabber dg = new DataGrabber();
        DataTable dt = dg.ExecuteSelectQuery(@"SELECT Projects.Status, Projects.pid, Projects.Email, (Select ProjectSupervisors.SVemail from ProjectSupervisors where Projects.PSVID=ProjectSupervisors.SVID ) AS PSV_Email, (Select AdultSupervisors.ASVemail from AdultSupervisors where Projects.ASVID=AdultSupervisors.ASVID ) AS ASV_Email
            FROM Projects
            WHERE (Projects.Status)>"") and Projects.pid=" + pid + ";");

        if (dt.Rows.Count < 1)
            return "2";


        return "1";
    }
    public string sendMail(string Message, string Subject, string From, string mailTo)
    {
        if (mailTo.Length <= 6 || From.Length <= 6 || Message.Length <= 0)
            return "2";

        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();
        try
        {
            MailAddress fromAddress = new MailAddress(From);
            smtpClient.Host = "127.0.0.1";
            smtpClient.Port = 25;
            message.From = fromAddress;
            message.CC.Add("erosales@harmonytx.org");
            message.CC.Add("hander@harmonytx.org ");
            message.CC.Add("iayyildiz@harmonytx.org");
            message.To.Add(mailTo);
            message.Subject = Subject;
            message.IsBodyHtml = true;
            message.Body = Message;
            smtpClient.Send(message);
            return "1";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }

    public string sendTopluMail(string Message, string From, MailAddressCollection mailTo)
    {
        if (mailTo.Count <= 0 || From.Length <= 6 || Message.Length <= 0)
            return "2";

        SmtpClient smtpClient = new SmtpClient();
        MailMessage message = new MailMessage();
        try
        {
            MailAddress fromAddress = new MailAddress(From);
            smtpClient.Host = "127.0.0.1";
            smtpClient.Port = 25;
            message.From = fromAddress;
            message.Bcc.Add("info@isweeep.org");
            message.Bcc.Add("erosales@harmonytx.org");
            message.Bcc.Add("hander@harmonytx.org ");
            message.Bcc.Add("iayyildiz@harmonytx.org");

            foreach (MailAddress adr in mailTo)
                message.Bcc.Add(adr);

            message.Subject = "I-SWEEEP";
            message.IsBodyHtml = true;
            message.Body = Message;
            smtpClient.Send(message);
            return "1";
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }
}